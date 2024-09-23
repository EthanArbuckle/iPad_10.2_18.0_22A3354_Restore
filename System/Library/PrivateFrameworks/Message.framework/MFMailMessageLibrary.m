@implementation MFMailMessageLibrary

- (unint64_t)protectedDataAvailability
{
  return self->_protectedDataAvailability;
}

void __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v7))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "longLongValue");
    *a4 = 1;
  }

}

- (id)dataProvider
{
  MFAttachmentLibraryDataProvider *attachmentDataProvider;
  MFAttachmentLibraryDataProvider *v4;
  MFAttachmentLibraryDataProvider *v5;

  attachmentDataProvider = self->_attachmentDataProvider;
  if (!attachmentDataProvider)
  {
    v4 = -[MFAttachmentLibraryDataProvider initWithLibrary:]([MFAttachmentLibraryDataProvider alloc], "initWithLibrary:", self);
    v5 = self->_attachmentDataProvider;
    self->_attachmentDataProvider = v4;

    attachmentDataProvider = self->_attachmentDataProvider;
  }
  return attachmentDataProvider;
}

- (void)reloadMailboxCacheWithConnection:(id)a3
{
  id v4;
  id v5;
  int table;
  int i;
  char **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char **pazResult;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  pazResult = (char **)0xAAAAAAAAAAAAAAAALL;
  table = sqlite3_get_table((sqlite3 *)objc_msgSend(v4, "sqlDB", 0xAAAAAAAAAAAAAAAALL), "SELECT ROWID, url FROM mailboxes", &pazResult, (int *)&v12 + 1, (int *)&v12, 0);
  objc_msgSend(v4, "checkForConnectionErrorWithMessage:", CFSTR("selecting mailbox URLs"));
  if (!table)
  {
    for (i = HIDWORD(v12); HIDWORD(v12); --HIDWORD(v12))
    {
      v8 = &pazResult[2 * i];
      v9 = atoll(*v8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

      i = HIDWORD(v12) - 1;
    }
    _MFLockGlobalLock();
    objc_storeStrong((id *)&self->_mailboxCache, v5);
    _MFUnlockGlobalLock();
  }
  sqlite3_free_table(pazResult);

}

- (id)_nonLocalAccountsClause
{
  NSString *v3;

  -[MFMailMessageLibrary _waitForActiveAccountsRebuild](self, "_waitForActiveAccountsRebuild");
  -[MFMailMessageLibrary mf_lock](self, "mf_lock");
  v3 = self->_nonLocalAccountClause;
  -[MFMailMessageLibrary mf_unlock](self, "mf_unlock");
  return v3;
}

- (id)activeMailboxesClause
{
  NSString *v3;

  -[MFMailMessageLibrary _waitForActiveAccountsRebuild](self, "_waitForActiveAccountsRebuild");
  -[MFMailMessageLibrary mf_lock](self, "mf_lock");
  v3 = self->_activeMailboxesClause;
  -[MFMailMessageLibrary mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)_waitForActiveAccountsRebuild
{
  NSConditionLock *activeAccountsCondition;
  void *v4;

  activeAccountsCondition = self->_activeAccountsCondition;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(activeAccountsCondition) = -[NSConditionLock lockWhenCondition:beforeDate:](activeAccountsCondition, "lockWhenCondition:beforeDate:", 0, v4);

  if ((_DWORD)activeAccountsCondition)
    -[NSConditionLock unlock](self->_activeAccountsCondition, "unlock");
}

uint64_t __53__MFMailMessageLibrary__firstDateForQuery_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -1;
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    if (sqlite3_step(v5) == 100)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int(v5, 0);
    sqlite3_reset(v5);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error performing query: %@"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkForConnectionErrorWithMessage:", v6);

  return 1;
}

id __64__MFMailMessageLibrary_rebuildActiveAccountMailboxesExpression___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "URLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("url"));
    objc_msgSend(v3, "beginsWith:caseSensitive:", v2, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)rebuildActiveMailboxesClauseWithActiveAccounts:(id)a3 inactiveAccounts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  MFMailMessageLibrary *v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  +[LocalAccount localAccount](LocalAccount, "localAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke;
  v20[3] = &unk_1E4E899E0;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v6, "ef_filter:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary _mailboxesClauseForAccounts:](self, "_mailboxesClauseForAccounts:", v6);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary _mailboxesClauseForAccounts:](self, "_mailboxesClauseForAccounts:", v11);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary mf_lock](self, "mf_lock");
  v14 = objc_msgSend(v7, "count") != 0;
  if (self->_activeMailboxesClause != v12 || (-[NSString isEqual:](v12, "isEqual:", v12) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeMailboxesClause, v12);
    v14 = 1;
  }
  if (self->_nonLocalAccountClause != v13)
    objc_storeStrong((id *)&self->_nonLocalAccountClause, v13);
  -[MFMailMessageLibrary mf_unlock](self, "mf_unlock");
  if (v14)
  {
    -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suspend");

    dispatch_get_global_queue(25, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke_2;
    block[3] = &unk_1E4E88EE8;
    v18 = v7;
    v19 = self;
    dispatch_async(v16, block);

  }
}

- (id)_mailboxesClauseForAccounts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "arrayByApplyingSelector:", sel_URLString);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("url"));
          objc_msgSend(v10, "beginsWith:caseSensitive:", v9, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v11);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F020]), "initWithExpressions:", v4);
    objc_msgSend(v12, "ef_SQLExpression");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" AND +messages.mailbox IN (SELECT ROWID FROM mailboxes WHERE %@) "), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (MFMailMessageLibrary)defaultInstance
{
  MFMailMessageLibrary *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)&sSharedInstanceLock);
  if (!sSharedInstance_0 && objc_msgSend(a1, "canUsePersistence"))
  {
    v3 = [MFMailMessageLibrary alloc];
    objc_msgSend(a1, "defaultPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MFMailMessageLibrary initWithPath:](v3, "initWithPath:", v4);
    v6 = (void *)sSharedInstance_0;
    sSharedInstance_0 = v5;

  }
  v7 = (id)sSharedInstance_0;
  os_unfair_lock_unlock((os_unfair_lock_t)&sSharedInstanceLock);
  return (MFMailMessageLibrary *)v7;
}

- (BOOL)allowedToAccessProtectedData
{
  return self->_allowedToAccessProtectedData;
}

+ (BOOL)canUsePersistence
{
  void *v2;
  void *v3;
  char v4;

  if ((EFIsRunningUnitTests() & 1) != 0)
    return 1;
  MFUserAgent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "isMobileMail"))
      v4 = objc_msgSend(v3, "isMaild");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)reloadMailboxCacheIfNecessaryWithConnection:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_mailboxCache)
    -[MFMailMessageLibrary reloadMailboxCacheWithConnection:](self, "reloadMailboxCacheWithConnection:", v4);

}

- (void)_updateUnreconciledMessageCount
{
  EFObserver *unreconciledMessageCountObservable;
  id v4;

  atomic_store(+[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithLibrary:](MFLibraryMessageReconciler, "numberOfUnreconciledMessagesWithLibrary:", self), &self->_unreconciledMessageCount);
  atomic_store(0, &self->_unreconciledMessageChangeCount);
  unreconciledMessageCountObservable = self->_unreconciledMessageCountObservable;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EFObserver observerDidReceiveResult:](unreconciledMessageCountObservable, "observerDidReceiveResult:");

}

void __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "removeSearchableItemsForAccount:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5++), (_QWORD)v8);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 40), "searchableIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  objc_msgSend(*(id *)(a1 + 40), "searchableIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "refresh");

}

- (EDSearchableIndex)searchableIndex
{
  void *v2;
  void *v3;
  void *v4;

  -[MFMailMessageLibrary persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableIndexManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDSearchableIndex *)v4;
}

- (id)_selectClauseForOptions:(unsigned int)a3 protectedDataAvailable:(BOOL)a4
{
  if ((a3 & 0x4000) != 0)
    return CFSTR("SELECT messages.conversation_id ");
  if ((a3 & 0x2000) != 0)
    return CFSTR("SELECT COUNT(DISTINCT(messages.message_id)) ");
  if ((a3 & 0x10000) != 0)
    return &stru_1E4F1C8F8;
  -[MFMailMessageLibrary _selectExpressionForMessageWithAvailableTables:](self, "_selectExpressionForMessageWithAvailableTables:", tablesForOptionsAndCriterion(a3, 0, a4) | 0x20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_selectExpressionForMessageWithAvailableTables:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  int v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v3 = *(_QWORD *)&a3;
  v46 = *MEMORY[0x1E0C80C00];
  if (tableNamesForTableOptions_onceToken != -1)
    dispatch_once(&tableNamesForTableOptions_onceToken, &__block_literal_global_2127);
  v5 = (void *)tableNamesForTableOptions_cachedSets;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __tableNamesForTableOptions_block_invoke_2;
  v42[3] = &__block_descriptor_36_e12___NSSet_8__0l;
  v43 = v3;
  objc_msgSend(v5, "objectForKey:generator:", v6, v42);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailMessageLibrary persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryParser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sqlPropertyMapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v10;
  objc_msgSend(v10, "mainTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithTable:", v12);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v10, "keyPathMappers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v19, "selectResultExpression");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v19, "tableName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v33, "containsObject:", v21);

          if (v22)
          {
            objc_msgSend(v19, "selectResultExpression");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "selectResultAlias");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addResult:alias:", v23, v24);

          }
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v16);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v32, "additionalColumns");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(v13, "addResultColumn:fromTable:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v12);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v26);
  }

  objc_msgSend(v13, "queryString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "substringToIndex:", objc_msgSend(v29, "rangeOfString:options:", CFSTR("FROM"), 4));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)_canSelectMessagesWithOptions:(unsigned int)a3 connection:(id)a4
{
  __int16 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;

  v4 = a3;
  v6 = a4;
  -[MFMailMessageLibrary persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagePersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (v4 & 0x8000) == 0 || -[MFMailMessageLibrary isProtectedDataAvailable:](self, "isProtectedDataAvailable:", v6);
  }
  else
  {
    EDLibraryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _canSelectMessagesWithOptions:connection:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (EDPersistence)persistence
{
  return (EDPersistence *)objc_getProperty(self, a2, 240, 1);
}

BOOL __88__MFMailMessageLibrary_rebuildActiveMailboxesClauseWithActiveAccounts_inactiveAccounts___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

id __29__MFMailMessageLibrary_start__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("useLegacyFormat");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)rebuildActiveAccountMailboxesExpression:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EFSQLValueExpressable *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "ef_compactMap:", &__block_literal_global_1133);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D1F040]);
    v6 = (void *)objc_msgSend(v5, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("mailboxes"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F020]), "initWithExpressions:", v4);
    objc_msgSend(v6, "setWhere:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("mailbox"));
    objc_msgSend(v8, "disqualified");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "in:", v6);
    v10 = (EFSQLValueExpressable *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[MFMailMessageLibrary mf_lock](self, "mf_lock");
  if (v10 != self->_enabledAccountMailboxesExpression)
    objc_storeStrong((id *)&self->_enabledAccountMailboxesExpression, v10);
  -[MFMailMessageLibrary mf_unlock](self, "mf_unlock");

}

- (void)rebuildActiveAccountsClausesAndExpressionsWithAccounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isActive", (_QWORD)v13))
          v12 = v5;
        else
          v12 = v6;
        objc_msgSend(v12, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[MFMailMessageLibrary rebuildActiveAccountMailboxesExpression:](self, "rebuildActiveAccountMailboxesExpression:", v5);
  -[MFMailMessageLibrary rebuildActiveMailboxesClauseWithActiveAccounts:inactiveAccounts:](self, "rebuildActiveMailboxesClauseWithActiveAccounts:inactiveAccounts:", v5, v6);
  -[NSConditionLock lock](self->_activeAccountsCondition, "lock");
  -[NSConditionLock unlockWithCondition:](self->_activeAccountsCondition, "unlockWithCondition:", 0);

}

- (void)renameOrRemoveDatabaseIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MFMailMessageLibrary *v16;
  _QWORD v17[2];
  uint64_t (*v18)(uint64_t);
  void *v19;
  MFMailMessageLibrary *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", CFSTR(".reset-database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    MFLogGeneral();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472;
    v18 = __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke;
    v19 = &unk_1E4E8AE10;
    v20 = self;
    v21 = v3;
    v22 = v4;
    v8 = v7;
    v9 = v17;
    v10 = mach_absolute_time();
    v18((uint64_t)v9);
    v11 = mach_absolute_time();
    if (EFGetElapsedTimeSinceAbsoluteTime_onceToken != -1)
      dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken, &__block_literal_global_2185);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = CFSTR("#Performance Moving database files");
      v25 = 2048;
      v26 = (double)((v11 - v10)
                   * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo
                   / *(unsigned int *)algn_1EE7C22CC)
          / 1000000000.0;
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "%@ : took %fs", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_2;
  v14[3] = &unk_1E4E88EE8;
  v13 = v3;
  v15 = v13;
  v16 = self;
  objc_msgSend(v12, "performBlock:", v14);

}

- (id)dateOfOldestNonSearchResultMessageInMailbox:(id)a3
{
  -[MFMailMessageLibrary _firstDateForQuery:inMailbox:](self, "_firstDateForQuery:inMailbox:", CFSTR("SELECT date_received FROM messages WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND flags & 128 = 0 ORDER BY date_received ASC LIMIT 1;"),
    a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_firstDateForQuery:(id)a3 inMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _firstDateForQuery:inMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__MFMailMessageLibrary__firstDateForQuery_inMailbox___block_invoke;
  v16[3] = &unk_1E4E8A4C0;
  v10 = v6;
  v17 = v10;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v16);

  v12 = *((_DWORD *)v21 + 6);
  if (v12 == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v14;
    goto LABEL_7;
  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v12);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v13 = 0;
LABEL_7:

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  MFMessageBodyMigrator *v7;
  void *v8;
  void *v9;
  int v10;
  MFMessageAttachmentMigrator *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[16];

  -[MFMailMessageLibrary database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reconcileJournalWithCompletionBlock:", 0);

  -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWillResume");

  -[MFMailMessageLibrary storedIntegerPropertyWithName:](self, "storedIntegerPropertyWithName:", CFSTR("NeedToMigrateFiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = -[MFMessageBodyMigrator initWithLibrary:]([MFMessageBodyMigrator alloc], "initWithLibrary:", self);
    -[MFMailMessageLibrary setBodyMigrator:](self, "setBodyMigrator:", v7);

    -[MFMailMessageLibrary bodyMigrator](self, "bodyMigrator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startMigratingBodies");
  }
  else
  {
    -[MFMailMessageLibrary storedIntegerPropertyWithName:](self, "storedIntegerPropertyWithName:", CFSTR("NeedToMigrateAttachments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (!v10)
      goto LABEL_6;
    v11 = -[MFMessageAttachmentMigrator initWithLibrary:]([MFMessageAttachmentMigrator alloc], "initWithLibrary:", self);
    -[MFMailMessageLibrary setAttachmentMigrator:](self, "setAttachmentMigrator:", v11);

    -[MFMailMessageLibrary attachmentMigrator](self, "attachmentMigrator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startMigratingAttachments");
  }

LABEL_6:
  -[MFMailMessageLibrary storedIntegerPropertyWithName:](self, "storedIntegerPropertyWithName:", CFSTR("UseLegacyMessageIDHashFormat"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (v13)
  {
    EDLibraryLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Using legacy message-id hash format", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBool:forKey:", 1, *MEMORY[0x1E0D1E098]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", *MEMORY[0x1E0D1E098]);
  }

  MFSetUseLegacyMessageIDHashFormat();
  AnalyticsSendEventLazy();
}

- (id)storedIntegerPropertyWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", CFSTR("SELECT value FROM properties WHERE key = ?"), v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v6[16];

  EFRegisterContentProtectionObserver();
  EDLibraryLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_INFO, "access to protected data is allowed", v6, 2u);
  }

  v3 = *(void **)(a1 + 32);
  if (EFProtectedDataAvailable())
    v4 = 1;
  else
    v4 = 2;
  return objc_msgSend(v3, "_setProtectedDataAvailabilityState:", v4);
}

void __59__MFMailMessageLibrary__setProtectedDataAvailabilityState___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  EDLibraryLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_INFO, "Posting %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6], CFSTR("MailMessageLibraryProtectedDataAvailibilityKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", a1[4], a1[5], v5);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__MFMailMessageLibrary_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (OS_os_log *)(id)log_log_7;
}

void __44__MFMailMessageLibrary_journalWasReconciled__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_setProtectedDataAvailabilityState:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MFMailMessageLibrary_journalWasReconciled__block_invoke_2;
  block[3] = &unk_1E4E88DC8;
  block[4] = v2;
  dispatch_async(v3, block);
}

- (void)_setProtectedDataAvailabilityState:(unint64_t)a3
{
  int *p_protectedDataAvailability;
  uint64_t protectedDataAvailability;
  unsigned int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD block[4];
  __CFString *v12;
  MFMailMessageLibrary *v13;
  unint64_t v14;

  p_protectedDataAvailability = &self->_protectedDataAvailability;
  protectedDataAvailability = self->_protectedDataAvailability;
  if (protectedDataAvailability != a3)
  {
    do
    {
      v7 = __ldxr((unsigned int *)p_protectedDataAvailability);
      if (v7 != (_DWORD)protectedDataAvailability)
      {
        __clrex();
        return;
      }
    }
    while (__stxr(a3, (unsigned int *)p_protectedDataAvailability));
    if (a3 == 2)
    {
      -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPersistenceAvailable:", 0);
      v10 = CFSTR("MailMessageLibraryWillBecomeUnavailable");
    }
    else
    {
      if (a3 == 1)
      {
        v10 = CFSTR("MailMessageLibraryDidBecomeAvailable");
        goto LABEL_12;
      }
      if (a3)
        return;
      -[MFMailMessageLibrary persistence](self, "persistence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchableIndexManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enableIndexingAndBeginScheduling:", 1);

      v10 = CFSTR("MailMessageLibraryDidFinishReconciliation");
    }

LABEL_12:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MFMailMessageLibrary__setProtectedDataAvailabilityState___block_invoke;
    block[3] = &unk_1E4E8AD18;
    v13 = self;
    v14 = a3;
    v12 = (__CFString *)v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (unsigned)allNonDeleteCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (!v6 || v5)
  {
    v9 = 128;
    if (!v5 || v6)
      v9 = 0;
    v10 = 1048704;
    if (v5)
      v10 = 0;
    if (!v6 && !v5)
      v9 = v10;
  }
  else
  {
    v9 = 0x100000;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT count(messages.rowid) FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.rowid WHERE url = ? AND (flags & %llu = 0) AND deleted = '0'"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", v11, v8);

  return v12;
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v9;
  _MFMessageCollector *v10;
  void *v11;

  length = a5.length;
  location = a5.location;
  v7 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:range:](self, "sendMessagesMatchingCriterion:to:options:range:", v9, v10, v7, location, length);
  -[_MFMessageCollector messages](v10, "messages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 range:(_NSRange)a6
{
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:success:", a3, a4, *(_QWORD *)&a5, 0, a6.location, a6.length, 0);
}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  _MFMessageCollector *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:](self, "sendMessagesMatchingCriterion:to:options:", v6, v7, v4);
  -[_MFMessageCollector messages](v7, "messages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5
{
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:success:", a3, a4, *(_QWORD *)&a5, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (id)indexableMessagesWhere:(id)a3 sortedBy:(id)a4 limit:(int64_t)a5 options:(unsigned int)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t *v22;
  int64_t v23;
  unsigned int v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  -[MFMailMessageLibrary _nonLocalAccountsClause](self, "_nonLocalAccountsClause");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__6;
    v29 = __Block_byref_object_dispose__6;
    v30 = (id)MEMORY[0x1E0C9AA60];
    -[MFMailMessageLibrary database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary indexableMessagesWhere:sortedBy:limit:options:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke;
    v18[3] = &unk_1E4E8AE60;
    v24 = a6;
    v18[4] = self;
    v23 = a5;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    v22 = buf;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v18);

    v15 = *((id *)v26 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "#Warning SearchableIndex: Skipping message search request until we have determined our active non-local accounts", buf, 2u);
    }

    v15 = (id)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (int)_integerForQuery:(id)a3 withTextArgument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _integerForQuery:withTextArgument:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MFMailMessageLibrary__integerForQuery_withTextArgument___block_invoke;
  v13[3] = &unk_1E4E8A588;
  v16 = &v17;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v13);

  LODWORD(v6) = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return (int)v6;
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 range:(_NSRange)a7 success:(BOOL *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  NSUInteger v23;
  NSUInteger v24;
  BOOL *v25;
  unsigned int v26;
  unsigned int v27;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a4;
  -[MFMailMessageLibrary database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89__MFMailMessageLibrary_sendMessagesMatchingCriterion_to_options_baseTable_range_success___block_invoke;
  v20[3] = &unk_1E4E8AC60;
  v20[4] = self;
  v26 = a5;
  v27 = a6;
  v19 = v14;
  v21 = v19;
  v23 = location;
  v24 = length;
  v18 = v15;
  v22 = v18;
  v25 = a8;
  objc_msgSend(v16, "__performReadWithCaller:usingBlock:", v17, v20);

}

- (MFPersistenceDatabase_iOS)database
{
  return (MFPersistenceDatabase_iOS *)objc_getProperty(self, a2, 248, 1);
}

+ (id)propertyMapper
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  const __CFString *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F028]), "initWithAllowedProtocolPrefixes:", &unk_1E4F68F20);
  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("ROWID"), v3, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_libraryID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("remote_id"), v4, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_remoteID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v66[0] = &unk_1E4F69B50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("date_received"), v5, v6, objc_opt_class(), sel_dateReceived);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v64 = &unk_1E4F69B68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("date_sent"), v7, v8, objc_opt_class(), sel_dateSent);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v62 = &unk_1E4F69B80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("display_date"), v9, v10, objc_opt_class(), sel_displayDate);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("flags"), v11, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_messageFlags);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("size"), v12, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_messageSize);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("subject_prefix"), v13, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_prefix);

  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("subject"), CFSTR("subjects"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_subjectWithoutPrefix);
  v59 = CFSTR("MFColumnAlias");
  v60 = CFSTR("sender_comment");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("comment"), CFSTR("sender"), v14, objc_opt_class(), sel_displayName);

  v57 = CFSTR("MFColumnAlias");
  v58 = CFSTR("sender_address");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("address"), CFSTR("sender"), v15, objc_opt_class(), sel_address);

  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("summary"), CFSTR("summaries"), MEMORY[0x1E0C9AA70], objc_opt_class(), sel_summary);
  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("mailbox"), v16, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_mailboxID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("original_mailbox"), v17, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_originalMailboxID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("content_type"), v18, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_contentType);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("conversation_id"), v19, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_conversationID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("encoding"), v20, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_preferredEncoding);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("external_id"), v21, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_externalID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("global_message_id"), v22, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_globalMessageID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("message_id"), v23, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_messageIDHash);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("unique_id"), v24, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_uniqueRemoteId);

  v55 = CFSTR("MFColumnAlias");
  v56 = CFSTR("conversation_flags");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("flags"), CFSTR("conversations"), v25, objc_opt_class(), sel_conversationFlags);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("list_id_hash"), v26, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_listIDHash);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("document_id"), v27, MEMORY[0x1E0C9AA70], objc_opt_class(), sel_documentID);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("MFColumnAlias");
  v53[1] = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v54[0] = CFSTR("read_later_date");
  v54[1] = &unk_1E4F69B98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("read_later_date"), v28, v29, objc_opt_class(), sel_date);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = CFSTR("MFColumnAlias");
  v51[1] = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v52[0] = CFSTR("send_later_date");
  v52[1] = &unk_1E4F69BB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("send_later_date"), v30, v31, objc_opt_class(), sel_sendLaterDate);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v50 = &unk_1E4F69BC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("unsubscribe_type"), v32, v33, objc_opt_class(), sel_unsubscribeType);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = CFSTR("MFColumnAlias");
  v47[1] = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v48[0] = CFSTR("follow_up_start_date");
  v48[1] = &unk_1E4F69BE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("follow_up_start_date"), v34, v35, objc_opt_class(), sel_startDate);

  objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = CFSTR("MFColumnAlias");
  v45[1] = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v46[0] = CFSTR("follow_up_end_date");
  v46[1] = &unk_1E4F69BF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("follow_up_end_date"), v36, v37, objc_opt_class(), sel_endDate);

  v43[0] = CFSTR("MFColumnAlias");
  v43[1] = CFSTR("MFDefaultValue");
  v44[0] = CFSTR("sender_bucket");
  v44[1] = &unk_1E4F69C10;
  v43[2] = CFSTR("MFPropertyMapperLookupKeyCriterionType");
  v44[2] = &unk_1E4F69C28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("bucket"), CFSTR("senders"), v38, objc_opt_class(), sel_senderBucket);

  v41 = CFSTR("MFColumnAlias");
  v42 = CFSTR("brand_indicator_location");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerColumnName:table:lookupKeys:forClass:property:", CFSTR("url"), CFSTR("brand_indicators"), v39, objc_opt_class(), sel_brandIndicatorLocation);

  return v2;
}

void __27__MFMailMessageLibrary_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;

}

uint64_t __58__MFMailMessageLibrary__integerForQuery_withTextArgument___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_int64ForQuery:connection:textArgument:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48));

  return 1;
}

- (int64_t)_int64ForQuery:(id)a3 connection:(id)a4 textArgument:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int64_t v14;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v8, "preparedStatementForQueryString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v16 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__MFMailMessageLibraryuint64_tForQuery_connection_textArgument___block_invoke;
  v17[3] = &unk_1E4E8A268;
  v17[4] = &v18;
  objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v11, v17, &v16);
  v12 = v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error performing query: %@: %@"), v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkForConnectionErrorWithMessage:", v13);

  v14 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v14;
}

uint64_t __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  char *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _MFMessageCollector *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_canSelectMessagesWithOptions:connection:", *(unsigned int *)(a1 + 80), v3) & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "_selectClauseForOptions:protectedDataAvailable:", *(unsigned int *)(a1 + 80), v4);
    v6 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 80), 0, v4);
    v7 = joinsForTables(v6);
    if (*(_QWORD *)(a1 + 72))
      v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" LIMIT %ld"), *(_QWORD *)(a1 + 72));
    else
      v8 = &stru_1E4F1C8F8;
    v9 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 40))
    {
      if (v9)
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ FROM messages %s WHERE %@ %@ ORDER BY %@%@"), v5, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), v8);
      else
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ FROM messages %s WHERE %@ %@%@"), v5, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v8);
    }
    else if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ FROM messages %s ORDER BY %@%@"), v5, v7, *(_QWORD *)(a1 + 48), v8);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ FROM messages %s %@"), v5, v7, v8);
    }
    v11 = (void *)v10;
    free(v7);
    objc_msgSend(v3, "preparedStatementForQueryString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc_init(_MFMessageCollector);
      objc_msgSend(*(id *)(a1 + 32), "_sendMessagesForStatement:connection:to:options:timestamp:", v12, v3, v13, *(unsigned int *)(a1 + 80), mach_absolute_time());
      v14 = -[_MFMessageCollector copyMessages](v13, "copyMessages");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
    else
    {
      MFLogGeneral();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke_cold_1();

    }
  }

  return 1;
}

uint64_t __89__MFMailMessageLibrary_sendMessagesMatchingCriterion_to_options_baseTable_range_success___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  char v5;
  void *v6;
  void *v7;
  _BYTE *v8;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_canSelectMessagesWithOptions:connection:", *(unsigned int *)(a1 + 80), v3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "queryForCriterion:connection:options:baseTable:isSubquery:range:", *(_QWORD *)(a1 + 40), v3, *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preparedStatementForQueryString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendMessagesForStatement:connection:to:options:timestamp:", v7, v3, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 80), mach_absolute_time());

  }
  v8 = *(_BYTE **)(a1 + 72);
  if (v8)
    *v8 = v5;

  return 1;
}

- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 isSubquery:(BOOL)a7 range:(_NSRange)a8
{
  uint64_t v9;
  uint64_t v10;
  id v13;
  id v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v13 = a3;
  v14 = a4;
  v36 = v14;
  if (-[MFMailMessageLibrary _canSelectMessagesWithOptions:connection:](self, "_canSelectMessagesWithOptions:connection:", v10, v14))
  {
    v15 = -[MFMailMessageLibrary isProtectedDataAvailable:](self, "isProtectedDataAvailable:", v14);
    objc_msgSend(v13, "criterionForSQL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFMailMessageLibrary _equalToMailboxIDsFromCriterion:](self, "_equalToMailboxIDsFromCriterion:", v16);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v9)
      v9 = objc_msgSend(v16, "bestBaseTable");
    v37 = tablesForOptionsAndCriterion(v10, v16, v15);
    -[MFMailMessageLibrary persistence](self, "persistence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchableIndexManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary database](self, "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "propertyMapper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "SQLExpressionWithTables:baseTable:protectedDataAvailable:searchableIndexManager:mailboxIDs:propertyMapper:", &v37, v9, v15, v18, v35, v20);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    tablesForBaseTableAndOtherTables(v9, v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MFMailMessageLibrary _selectClauseForOptions:protectedDataAvailable:](self, "_selectClauseForOptions:protectedDataAvailable:", v10, v15);
    -[MFMailMessageLibrary activeMailboxesClause](self, "activeMailboxesClause");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ FROM %@ WHERE %@%@"), v22, v21, v34, v23);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ FROM %@ WHERE %@"), v22, v21, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a7)
    {
      if ((v10 & 0x3000180) != 0 || (v9 | 0x10) == 0x10)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        -[MFMailMessageLibrary _sqlSortByStringFromOptions:](self, "_sqlSortByStringFromOptions:", v10);
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = objc_msgSend(v26, "UTF8String");
        v28 = "ASC";
        if ((v10 & 0x400) == 0)
          v28 = "DESC";
        objc_msgSend(v25, "stringWithFormat:", CFSTR(" ORDER BY %1$s %2$s, messages.ROWID %2$s"), v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "stringByAppendingString:", v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v30;
      }
      if (a8.length != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(" LIMIT %lu"), a8.length);
        v31 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v31;
      }
      if (a8.location)
      {
        objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(" OFFSET %lu"), a8.location);
        v32 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v32;
      }
    }

  }
  else
  {
    v24 = 0;
    v16 = v13;
  }

  return v24;
}

- (void)_sendMessagesForStatement:(id)a3 connection:(id)a4 to:(id)a5 options:(unsigned int)a6 timestamp:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  double Current;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  NSObject *v23;
  double v24;
  double v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  int v29;
  CFAbsoluteTime v30;
  MFMailMessageLibrary *v31;
  id v32;
  id v33[3];
  double v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  uint8_t buf[4];
  _BYTE v41[18];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_msgSend(v13, "sqlDB");
  Current = CFAbsoluteTimeGetCurrent();
  v33[0] = 0;
  v39 = 0;
  v33[2] = (id)a7;
  v31 = self;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

  objc_storeStrong(v33, a5);
  v33[1] = (id)0x3F000000000003E8;
  v34 = Current;
  v35 = 0;
  v36 = a6;
  v37 = v15;
  v38 = -[MFMailMessageLibrary isProtectedDataAvailable:](v31, "isProtectedDataAvailable:", v13);
  v17 = v39;
  v39 = 0;

  v18 = (void *)MEMORY[0x1A85B0E24]();
  -[MFMailMessageLibrary _iterateStatement:connection:withProgressMonitor:andRowHandler:context:](v31, "_iterateStatement:connection:withProgressMonitor:andRowHandler:context:", v12, v13, v14, handleMessageRow, &v31);
  if (objc_msgSend(v32, "count"))
  {
    v19 = v32;
    MFLogGeneral();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v35)
      v22 = 0;
    else
      v22 = v21;

    if (v22)
    {
      MFLogGeneral();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = CFAbsoluteTimeGetCurrent();
        v25 = v34;
        v26 = objc_msgSend(v32, "count");
        *(_DWORD *)buf = 134218240;
        *(double *)v41 = v24 - v25;
        *(_WORD *)&v41[8] = 2048;
        *(_QWORD *)&v41[10] = v26;
        _os_log_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_INFO, "#SQLite #Performance %.3f seconds to load first batch of %lu messages", buf, 0x16u);
      }

    }
    objc_msgSend(v14, "newMessagesAvailable:", v19);
    v27 = objc_msgSend(v19, "count");
    v35 += v27;

  }
  objc_autoreleasePoolPop(v18);
  MFLogGeneral();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = v35;
    v30 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v41 = v29;
    *(_WORD *)&v41[4] = 2048;
    *(double *)&v41[6] = v30 - Current;
    _os_log_impl(&dword_1A4F90000, v28, OS_LOG_TYPE_INFO, "#SQLite #Performance loaded %d messages in %.3f seconds", buf, 0x12u);
  }

  __destructor_8_s0_s8_s16_s72((id *)&v31);
}

- (BOOL)isProtectedDataAvailable:(id)a3
{
  id v5;
  char v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 7018, CFSTR("Wrong kind of database connection"));

  }
  v6 = objc_msgSend(v5, "protectedDatabaseAttached");

  return v6;
}

- (void)_iterateStatement:(id)a3 connection:(id)a4 withProgressMonitor:(id)a5 andRowHandler:(void *)a6 context:(id *)a7
{
  id v11;
  id v12;
  id v13;
  sqlite3 *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  void *v30;
  const $27578CF1E51A0308951664630F7DF36F *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  sqlite3 *v36;
  id v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (sqlite3 *)objc_msgSend(v12, "sqlDB", v13);
  v36 = v14;
  v15 = v13;
  v37 = v15;
  sqlite3_progress_handler(v14, 200, (int (__cdecl *)(void *))progressHandler, &v36);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __95__MFMailMessageLibrary__iterateStatement_connection_withProgressMonitor_andRowHandler_context___block_invoke;
  v24[3] = &unk_1E4E8A308;
  v18 = v16;
  v25 = v18;
  v19 = v15;
  v26 = v19;
  v29 = &v32;
  v30 = a6;
  v31 = a7;
  v20 = v12;
  v27 = v20;
  v21 = v17;
  v28 = v21;
  v23 = 0;
  LOBYTE(v13) = objc_msgSend(v11, "executeUsingBlock:error:", v24, &v23);
  v22 = v23;
  sqlite3_progress_handler(v14, 0, 0, 0);
  if ((v13 & 1) == 0 && !*((_BYTE *)v33 + 24))
    objc_msgSend(v20, "handleError:message:", v22, CFSTR("loading messages"));

  _Block_object_dispose(&v32, 8);
}

- (id)_sqlSortByStringFromOptions:(unsigned int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("read_later_date");
  v4 = CFSTR("send_later_date");
  if ((a3 & 0x2000000) == 0)
    v4 = CFSTR("date_received");
  if ((a3 & 0x1000000) == 0)
    v3 = v4;
  if ((a3 & 0x100) != 0)
    return CFSTR("display_date");
  else
    return (id)v3;
}

- (id)_equalToMailboxIDsFromCriterion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MFMailMessageLibrary__equalToMailboxIDsFromCriterion___block_invoke;
  v7[3] = &unk_1E4E8AC38;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  v3 = (id)objc_msgSend(a3, "criterionByApplyingTransform:", v7);
  if (*((_BYTE *)v9 + 24))
  {
    v4 = (void *)v13[5];
    v13[5] = 0;

  }
  v5 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (MFMailMessageLibrary)initWithPath:(id)a3
{
  id v4;
  void *v5;
  MFMailMessageLibrary *v6;

  v4 = a3;
  MFUserAgent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFMailMessageLibrary initWithPath:inMemoryIdentifier:userAgent:](self, "initWithPath:inMemoryIdentifier:userAgent:", v4, 0, v5);

  return v6;
}

id __56__MFMailMessageLibrary__equalToMailboxIDsFromCriterion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && objc_msgSend(v3, "criterionType") == 23)
  {
    if (objc_msgSend(v4, "qualifier") == 3)
    {
      objc_msgSend(v4, "expression");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 32), "mailboxIDForURLString:", v5);
      if (v6 != *MEMORY[0x1E0D1DC08])
      {
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (!v7)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

          v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend(v7, "addIndex:", v6);
      }

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return v4;
}

- (int64_t)mailboxIDForURLString:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  MFMailMessageLibrary *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int64_t v22;

  v4 = a4;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0xAAAAAAAAAAAAAAAALL;
  v22 = -[MFMailMessageLibrary mailboxIDForURLString:](self, "mailboxIDForURLString:", v6);
  v7 = v20[3];
  if (v7 == *MEMORY[0x1E0D1DC08] && v4)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    -[MFMailMessageLibrary database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary mailboxIDForURLString:createIfNecessary:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__MFMailMessageLibrary_mailboxIDForURLString_createIfNecessary___block_invoke;
    v14[3] = &unk_1E4E8A7D8;
    v12 = v9;
    v18 = &v19;
    v15 = v12;
    v16 = self;
    v17 = v6;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v14);

    v7 = v20[3];
  }
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (int64_t)mailboxIDForURLString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *mailboxCache;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;
  MFMailMessageLibrary *v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v5 = *MEMORY[0x1E0D1DC08];
  v22 = *MEMORY[0x1E0D1DC08];
  if (objc_msgSend(v4, "length"))
  {
    v6 = MEMORY[0x1E0C809B0];
    if (self->_mailboxCache)
    {
      _MFLockGlobalLock();
      mailboxCache = self->_mailboxCache;
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke;
      v16[3] = &unk_1E4E8A800;
      v17 = v4;
      v18 = &v19;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mailboxCache, "enumerateKeysAndObjectsUsingBlock:", v16);
      _MFUnlockGlobalLock();

    }
    if (v20[3] == v5)
    {
      -[MFMailMessageLibrary database](self, "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary mailboxIDForURLString:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke_2;
      v12[3] = &unk_1E4E8A4C0;
      v14 = self;
      v15 = &v19;
      v13 = v4;
      objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);

    }
  }
  v10 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (MFMailMessageLibrary)initWithPath:(id)a3 inMemoryIdentifier:(id)a4 userAgent:(id)a5
{
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  MFWeakObjectCache *v16;
  void *v17;
  MFPersistence_iOS *v18;
  void *v19;
  MFPersistence_iOS *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  dispatch_queue_t v25;
  void *v26;
  dispatch_queue_t v27;
  void *v28;
  dispatch_queue_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  dispatch_queue_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  dispatch_queue_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  int v61;
  uint64_t v62;
  NSObject *v63;
  SEL v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  objc_class *v68;
  uint64_t v69;
  void *v70;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  uint8_t buf[8];
  _QWORD block[4];
  id v79;
  objc_super v80;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MFIsMobileMail() ^ 1;
  if (v11)
    LOBYTE(v12) = 1;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userAgent"));

  }
  v80.receiver = self;
  v80.super_class = (Class)MFMailMessageLibrary;
  v13 = -[MFMailMessageLibrary init](&v80, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = v14;

    objc_msgSend(v13, "renameOrRemoveDatabaseIfNeeded");
    v16 = -[MFWeakObjectCache initWithBlock:]([MFWeakObjectCache alloc], "initWithBlock:", &__block_literal_global_15);
    v17 = (void *)*((_QWORD *)v13 + 3);
    *((_QWORD *)v13 + 3) = v16;

    v74 = v10;
    v75 = v11;
    v18 = [MFPersistence_iOS alloc];
    objc_msgSend((id)objc_opt_class(), "propertyMapper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MFPersistence_iOS initWithPath:inMemoryIdentifier:library:propertyMapper:](v18, "initWithPath:inMemoryIdentifier:library:propertyMapper:", v9, v10, v13, v19);

    -[EDPersistence hookRegistry](v20, "hookRegistry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerMessageChangeHookResponder:", v13);

    -[EDPersistence hookRegistry](v20, "hookRegistry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerProtectedDataReconciliationHookResponder:", v13);

    objc_storeStrong((id *)v13 + 30, v20);
    -[MFPersistence_iOS database](v20, "database");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v13 + 31);
    *((_QWORD *)v13 + 31) = v23;

    v25 = dispatch_queue_create("com.apple.message.library", 0);
    v26 = (void *)*((_QWORD *)v13 + 5);
    *((_QWORD *)v13 + 5) = v25;

    v27 = dispatch_queue_create("com.apple.message.library.indexing", 0);
    v28 = (void *)*((_QWORD *)v13 + 39);
    *((_QWORD *)v13 + 39) = v27;

    v29 = dispatch_queue_create("com.apple.message.library.stats", 0);
    v30 = (void *)*((_QWORD *)v13 + 6);
    *((_QWORD *)v13 + 6) = v29;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_UTILITY, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_queue_create("com.apple.message.library.keybag", v32);
    v34 = (void *)*((_QWORD *)v13 + 12);
    *((_QWORD *)v13 + 12) = v33;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v35, QOS_CLASS_UTILITY, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = dispatch_queue_create("com.apple.message.library.conversationcalculation", v36);
    v38 = (void *)*((_QWORD *)v13 + 13);
    *((_QWORD *)v13 + 13) = v37;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v39 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v39, QOS_CLASS_UTILITY, -10);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = dispatch_queue_create("com.apple.message.library.fs-compression", v40);
    v42 = (void *)*((_QWORD *)v13 + 15);
    *((_QWORD *)v13 + 15) = v41;

    *((_BYTE *)v13 + 232) = objc_msgSend(v11, "isAllowedToAccessProtectedData");
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    v44 = (void *)*((_QWORD *)v13 + 7);
    *((_QWORD *)v13 + 7) = v43;

    *((_QWORD *)v13 + 25) = 0;
    v45 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v46 = (void *)*((_QWORD *)v13 + 27);
    *((_QWORD *)v13 + 27) = v45;

    v47 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v48 = (void *)*((_QWORD *)v13 + 28);
    *((_QWORD *)v13 + 28) = v47;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.message.library.fileRemovalAfterCompaction"), 9);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v13 + 34);
    *((_QWORD *)v13 + 34) = v49;

    v51 = objc_opt_new();
    v52 = (void *)*((_QWORD *)v13 + 35);
    *((_QWORD *)v13 + 35) = v51;

    *((_DWORD *)v13 + 52) = 0;
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)*((_QWORD *)v13 + 21);
    *((_QWORD *)v13 + 21) = v53;

    atomic_store(0xFFFFFFFF, (unsigned int *)v13 + 44);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    EFVerifyFileProtectionType();
    objc_msgSend(v55, "URLByAppendingPathComponent:", CFSTR("Envelope Index"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    EFVerifyFileProtectionType();
    *((_DWORD *)v13 + 38) = 0;
    v57 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v58 = (void *)*((_QWORD *)v13 + 20);
    *((_QWORD *)v13 + 20) = v57;

    v59 = objc_alloc_init(MEMORY[0x1E0D1E138]);
    v60 = (void *)*((_QWORD *)v13 + 23);
    *((_QWORD *)v13 + 23) = v59;

    v61 = objc_msgSend(v13, "allowedToAccessProtectedData");
    v62 = MEMORY[0x1E0C809B0];
    if (v61)
    {
      objc_msgSend(v55, "URLByAppendingPathComponent:", CFSTR("Protected Index"));
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = a2;
      EFVerifyFileProtectionType();
      v65 = *((_QWORD *)v13 + 12);
      block[0] = v62;
      block[1] = 3221225472;
      block[2] = __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke_2;
      block[3] = &unk_1E4E88DC8;
      v79 = v13;
      dispatch_sync(v65, block);

    }
    else
    {
      *((_DWORD *)v13 + 22) = 2;
      EDLibraryLog();
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = a2;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v63, OS_LOG_TYPE_INFO, "access to protected data is not allowed", buf, 2u);
      }
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v13);
    objc_copyWeak(&v76, (id *)buf);
    EFLogRegisterStateCaptureBlock();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)*((_QWORD *)v13 + 37);
    *((_QWORD *)v13 + 37) = v66;

    v68 = NSClassFromString(CFSTR("MFMailMessageLibrarySwiftProperties"));
    if (!v68)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", v64, v13, CFSTR("MailMessageLibrary.m"), 458, CFSTR("Class not found."));

    }
    v69 = objc_msgSend([v68 alloc], "initWithMailMessageLibrary:", v13);
    v70 = (void *)*((_QWORD *)v13 + 40);
    *((_QWORD *)v13 + 40) = v69;

    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);

    v10 = v74;
    v11 = v75;
  }

  return (MFMailMessageLibrary *)v13;
}

void __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  id obj;
  _QWORD v16[2];
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contentsOfDirectoryAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v1)
  {
    v3 = *(_QWORD *)v22;
    *(_QWORD *)&v2 = 138412546;
    v13 = v2;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v22 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v4);
        if (objc_msgSend(v5, "hasPrefix:", CFSTR("SavedFolders"), v13))
        {
          MFLogGeneral();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("#Performance Removing "), "stringByAppendingString:", v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v17 = __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_3;
          v18 = &unk_1E4E88EE8;
          v19 = *(_QWORD *)(a1 + 40);
          v20 = v5;
          v8 = v6;
          v9 = v7;
          v10 = v16;
          v11 = mach_absolute_time();
          v17((uint64_t)v10);
          v12 = mach_absolute_time();
          if (EFGetElapsedTimeSinceAbsoluteTime_onceToken != -1)
            dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken, &__block_literal_global_2185);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v27 = v9;
            v28 = 2048;
            v29 = (double)((v12 - v11)
                         * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo
                         / *(unsigned int *)algn_1EE7C22CC)
                / 1000000000.0;
            _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "%@ : took %fs", buf, 0x16u);
          }

        }
        ++v4;
      }
      while (v1 != v4);
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v1);
  }

}

void __44__MFMailMessageLibrary_journalWasReconciled__block_invoke_2(uint64_t a1)
{
  void *v2;
  double Current;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  CFAbsoluteTime v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  double v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count"));
    Current = CFAbsoluteTimeGetCurrent();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v24;
      *(_QWORD *)&v6 = 134217984;
      v22 = v6;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        if ((EFProtectedDataAvailable() & 1) == 0)
          break;
        objc_msgSend(*(id *)(a1 + 32), "messageWithLibraryID:options:inMailbox:", (int)objc_msgSend(v9, "intValue"), 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "headersIfAvailable");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            MFLogGeneral();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = objc_msgSend(v11, "messageIDHash");
              *(_DWORD *)buf = v22;
              v28 = v14;
              _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Threading %lld: resolving threads after journal reconciliation", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "updateThreadingInfoForMessage:fromHeaders:", v11, v12);
          }

        }
        objc_msgSend(v2, "addObject:", v9, v22, (_QWORD)v23);

        if (v5 == ++v8)
        {
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }

    EDLibraryLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v2, "count");
      v17 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218240;
      v28 = v16;
      v29 = 2048;
      v30 = v17 - Current;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_INFO, "Updated conversation hashes on %lu messages (%.4f seconds)", buf, 0x16u);
    }

    v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count");
    v19 = objc_msgSend(v2, "count");
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 112);
    if (v18 == v19)
    {
      *(_QWORD *)(v20 + 112) = 0;

    }
    else
    {
      objc_msgSend(v21, "minusSet:", v2);
    }

  }
}

- (void)journalWasReconciled
{
  NSObject *keyBagQueue;
  _QWORD block[5];

  keyBagQueue = self->_keyBagQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MFMailMessageLibrary_journalWasReconciled__block_invoke;
  block[3] = &unk_1E4E88DC8;
  block[4] = self;
  dispatch_async(keyBagQueue, block);
}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFMailMessageLibrary_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (OS_os_log *)(id)signpostLog_log;
}

void __35__MFMailMessageLibrary_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

id __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke(uint64_t a1, void *a2)
{
  +[MFLibraryMessage messageWithLibraryID:](MFLibraryMessage, "messageWithLibraryID:", objc_msgSend(a2, "longLongValue"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __66__MFMailMessageLibrary_initWithPath_inMemoryIdentifier_userAgent___block_invoke_106(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "persistence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistenceStatistics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[MFMailMessageLibrary allowedToAccessProtectedData](self, "allowedToAccessProtectedData"))
    EFUnregisterContentProtectionObserver();
  -[MFMailMessageLibrary _cancelPendingJournalReconciliation](self, "_cancelPendingJournalReconciliation");
  xpc_activity_unregister("com.apple.message.statisticsLogging");
  -[MFMailMessageLibrary closeDatabaseConnections](self, "closeDatabaseConnections");
  -[MFMailMessageLibrary stateCaptureCancelable](self, "stateCaptureCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  EFAtomicSetOnceObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)MFMailMessageLibrary;
  -[MFMailMessageLibrary dealloc](&v4, sel_dealloc);
}

+ (void)test_setDefaultInstance:(id)a3
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MailMessageLibrary.m"), 676, CFSTR("%s can only be called from unit tests"), "+[MFMailMessageLibrary test_setDefaultInstance:]", v8);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&sSharedInstanceLock);
  objc_storeStrong((id *)&sSharedInstance_0, a3);
  +[MFLibraryStore sharedInstanceIfExists](MFLibraryStore, "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLibrary:", sSharedInstance_0);

  os_unfair_lock_unlock((os_unfair_lock_t)&sSharedInstanceLock);
}

- (void)invalidateAndWait
{
  id v3;
  id v4;
  id v5;

  EFUnregisterContentProtectionObserver();
  -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceDidInvalidate");

  -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterAllHookResponders");

  -[MFMailMessageLibrary fileRemovalAfterCompactionScheduler](self, "fileRemovalAfterCompactionScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSyncBlock:", &__block_literal_global_271);

}

- (void)_setSuspendedUnderLock:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_suspendedUnderLock);
}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 725, CFSTR("%s can only be called from unit tests"), "-[MFMailMessageLibrary test_tearDown]");

  }
  -[MFMailMessageLibrary remoteContentParser](self, "remoteContentParser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "test_tearDown");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  +[MailAccount setMailAccounts:](MailAccount, "setMailAccounts:", MEMORY[0x1E0C9AA60]);
  +[MailAccount test_tearDown](MailAccount, "test_tearDown");
  +[MFInvocationQueue flushAllInvocationQueues](MFInvocationQueue, "flushAllInvocationQueues");
  -[MFMailMessageLibrary mailboxFrecencyController](self, "mailboxFrecencyController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "test_tearDown");

  -[MFMailMessageLibrary persistence](self, "persistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "test_tearDown");

  -[MFMailMessageLibrary invalidateAndWait](self, "invalidateAndWait");
  -[MFMailMessageLibrary closeDatabaseConnections](self, "closeDatabaseConnections");
  +[MFMailMessageLibrary test_setDefaultInstance:](MFMailMessageLibrary, "test_setDefaultInstance:", 0);
  MFSetUserAgent(0);
}

- (id)messageBasePathForAccount:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  v4 = a3;
  objc_msgSend(v4, "personaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "path");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_path;
  }
  v7 = v6;

  return v7;
}

- (void)bodyMigrationFinished
{
  MFMessageAttachmentMigrator *v3;
  id v4;

  -[MFMailMessageLibrary setStoredIntegerPropertyWithName:value:](self, "setStoredIntegerPropertyWithName:value:", CFSTR("NeedToMigrateFiles"), MEMORY[0x1E0C9AAA0]);
  -[MFMailMessageLibrary setBodyMigrator:](self, "setBodyMigrator:", 0);
  v3 = -[MFMessageAttachmentMigrator initWithLibrary:]([MFMessageAttachmentMigrator alloc], "initWithLibrary:", self);
  -[MFMailMessageLibrary setAttachmentMigrator:](self, "setAttachmentMigrator:");

  -[MFMailMessageLibrary attachmentMigrator](self, "attachmentMigrator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startMigratingAttachments");

}

- (void)attachmentMigrationFinished
{
  -[MFMailMessageLibrary setStoredIntegerPropertyWithName:value:](self, "setStoredIntegerPropertyWithName:value:", CFSTR("NeedToMigrateAttachments"), MEMORY[0x1E0C9AAA0]);
  -[MFMailMessageLibrary setAttachmentMigrator:](self, "setAttachmentMigrator:", 0);
}

- (MFMessageChangeManager_iOS)messageChangeManager
{
  void *v2;
  void *v3;

  -[MFMailMessageLibrary persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageChangeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MFMessageChangeManager_iOS *)v3;
}

- (void)_didAddUnreconciledMessages:(unint64_t)a3
{
  unsigned int *p_unreconciledMessageChangeCount;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;

  p_unreconciledMessageChangeCount = &self->_unreconciledMessageChangeCount;
  v4 = atomic_load(&self->_unreconciledMessageChangeCount);
  do
  {
    v5 = v4;
    v6 = v4 + a3;
    while (1)
    {
      v4 = __ldaxr(p_unreconciledMessageChangeCount);
      if (v4 != v5)
        break;
      if (!__stlxr(v6, p_unreconciledMessageChangeCount))
      {
        v7 = 1;
        goto LABEL_7;
      }
    }
    v7 = 0;
    __clrex();
LABEL_7:
    if (v6 < 0x3E8)
      v8 = 1;
    else
      v8 = 3;
    if (!v7)
      v8 = 0;
  }
  while (!v8);
  if (v8 == 3)
    -[MFMailMessageLibrary _updateUnreconciledMessageCount](self, "_updateUnreconciledMessageCount");
}

- (EFObservable)unreconciledMessageCountObservable
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = -[MFMailMessageLibrary unreconciledMessageCount](self, "unreconciledMessageCount");
  -[EFObserver distinctUntilChanged](self->_unreconciledMessageCountObservable, "distinctUntilChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFObservable *)v7;
}

- (unint64_t)unreconciledMessageCount
{
  unsigned int *p_unreconciledMessageCount;
  unint64_t result;

  p_unreconciledMessageCount = &self->_unreconciledMessageCount;
  result = atomic_load(&self->_unreconciledMessageCount);
  if ((_DWORD)result == -1)
  {
    LODWORD(result) = +[MFLibraryMessageReconciler numberOfUnreconciledMessagesWithLibrary:](MFLibraryMessageReconciler, "numberOfUnreconciledMessagesWithLibrary:", self);
    atomic_store(result, p_unreconciledMessageCount);
    return result;
  }
  return result;
}

- (void)setFlags:(unint64_t)a3 forMessage:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  v7 = objc_msgSend(v6, "messageFlags");
  if (v7 != a3)
    objc_msgSend(v6, "setMessageFlagsWithoutCommitting:", a3);
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setFlags:forMessage:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__MFMailMessageLibrary_setFlags_forMessage___block_invoke;
  v11[3] = &unk_1E4E89F38;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v13 = a3;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v11);

  -[MFMailMessageLibrary postOldFlags:newFlags:forMessage:](self, "postOldFlags:newFlags:forMessage:", v7, a3, v10);
}

uint64_t __44__MFMailMessageLibrary_setFlags_forMessage___block_invoke(uint64_t a1, void *a2)
{
  setFlagsForMessage(a2, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
  return 1;
}

- (void)postOldFlags:(unint64_t)a3 newFlags:(unint64_t)a4 forMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a3 == a4)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    if (!v9)
      goto LABEL_80;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v10;
    if ((a3 & 1) != (a4 & 1))
    {
      if ((a4 & 1) != 0)
        v12 = MEMORY[0x1E0C9AAB0];
      else
        v12 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("MessageIsRead"));
    }
    v13 = a4 ^ a3;
    if ((a4 ^ a3) < 2)
      goto LABEL_77;
    if (((a3 >> 1) & 1) != ((a4 >> 1) & 1))
    {
      if ((a4 & 2) != 0)
        v14 = MEMORY[0x1E0C9AAB0];
      else
        v14 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("MessageIsDeleted"));
    }
    if (v13 < 4)
      goto LABEL_77;
    if (((a3 >> 2) & 1) != ((a4 >> 2) & 1))
    {
      if ((a4 & 4) != 0)
        v15 = MEMORY[0x1E0C9AAB0];
      else
        v15 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("MessageWasRepliedTo"));
    }
    if (v13 < 8)
      goto LABEL_77;
    if (((a3 >> 3) & 1) != ((a4 >> 3) & 1))
    {
      if ((a4 & 8) != 0)
        v16 = MEMORY[0x1E0C9AAB0];
      else
        v16 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("MessageIsEncrypted"));
    }
    if (v13 < 0x10)
      goto LABEL_77;
    if (((a3 >> 23) & 1) != ((a4 >> 23) & 1))
    {
      if ((a4 & 0x800000) != 0)
        v17 = MEMORY[0x1E0C9AAB0];
      else
        v17 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("MessageIsSigned"));
    }
    if ((v13 & 0xFFFFFFFFFF7FFFF0) == 0)
      goto LABEL_77;
    if (((a3 >> 24) & 1) != ((a4 >> 24) & 1))
    {
      if ((a4 & 0x1000000) != 0)
        v18 = MEMORY[0x1E0C9AAB0];
      else
        v18 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("MessageSenderIsVIP"));
    }
    if ((v13 & 0xFFFFFFFFFE7FFFF0) == 0)
      goto LABEL_77;
    if (((a3 >> 8) & 1) != ((a4 >> 8) & 1))
    {
      if ((a4 & 0x100) != 0)
        v19 = MEMORY[0x1E0C9AAB0];
      else
        v19 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("MessageWasForwarded"));
    }
    if ((v13 & 0xFFFFFFFFFE7FFEF0) == 0)
      goto LABEL_77;
    if (((a3 >> 9) & 1) != ((a4 >> 9) & 1))
    {
      if ((a4 & 0x200) != 0)
        v20 = MEMORY[0x1E0C9AAB0];
      else
        v20 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v20, CFSTR("MessageWasRedirected"));
    }
    if ((v13 & 0xFFFFFFFFFE7FFCF0) == 0)
      goto LABEL_77;
    if (((a3 >> 4) & 1) != ((a4 >> 4) & 1))
    {
      if ((a4 & 0x10) != 0)
        v21 = MEMORY[0x1E0C9AAB0];
      else
        v21 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("MessageIsFlagged"));
    }
    if ((v13 & 0xFFFFFFFFFE7FFCE0) == 0)
      goto LABEL_77;
    if (((a3 >> 30) & 1) != ((a4 >> 30) & 1))
    {
      if ((a4 & 0x40000000) != 0)
        v22 = MEMORY[0x1E0C9AAB0];
      else
        v22 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKey:", v22, CFSTR("MessageHighlightTextInTOC"));
    }
    if ((v13 & 0xFFFFFFFFBE7FFCE0) == 0)
      goto LABEL_77;
    if ((WORD1(a3) & 7) != (WORD1(a4) & 7))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v23, CFSTR("MessagePriorityLevel"));

    }
    if ((v13 & 0xFFFFFFFFBE78FCE0) == 0)
      goto LABEL_77;
    v24 = ((a3 >> 26) & 7) - 1;
    v25 = v24 > 6 ? 0 : dword_1A5999570[v24];
    v26 = ((a4 >> 26) & 7) - 1;
    v27 = v26 > 6 ? 0 : dword_1A5999570[v26];
    if (v25 != v27)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v28, CFSTR("MessageFontSizeDelta"));

    }
    if ((v13 & 0xFFFFFFFFA278FCE0) != 0)
      v9 = 0;
    else
LABEL_77:
      v9 = v11;

    if (!v9)
      goto LABEL_80;
  }
  if (objc_msgSend(v9, "count"))
  {
LABEL_80:
    v34[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3, v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary postFlagsChangedForMessages:flags:oldFlagsByMessage:](self, "postFlagsChangedForMessages:flags:oldFlagsByMessage:", v29, v9, v31);

  }
}

- (void)postFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("messages"));
    if (v9)
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("oldFlagsByMessage"));
    if (v8)
      objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("flags"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessageFlagsChanged"), self, v10);

  }
}

- (void)updateFlagsForMessagesInPlace:(id)a3 success:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v6 = a3;
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary updateFlagsForMessagesInPlace:success:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MFMailMessageLibrary_updateFlagsForMessagesInPlace_success___block_invoke;
  v12[3] = &unk_1E4E89F60;
  v10 = v7;
  v13 = v10;
  v11 = v6;
  v14 = v11;
  v15 = &v16;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

  if (a4)
    *a4 = *((_DWORD *)v17 + 6) == 101;

  _Block_object_dispose(&v16, 8);
}

uint64_t __62__MFMailMessageLibrary_updateFlagsForMessagesInPlace_success___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *i;
  void *v5;
  void *v6;
  sqlite3_int64 v7;
  id v8;
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  int v11;
  int v12;

  v3 = a2;
  for (i = 0; ; i = v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE messages SET flags = (flags|:flags) WHERE rowid = :rowid"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (sqlite3_stmt *)objc_msgSend(v8, "compiled");
    v10 = v9;
    if (v9)
    {
      v11 = sqlite3_bind_parameter_index(v9, ":flags");
      sqlite3_bind_int64(v10, v11, v7);
      v12 = sqlite3_bind_parameter_index(v10, ":rowid");
      sqlite3_bind_int64(v10, v12, objc_msgSend(v5, "libraryID"));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_step(v10);
      sqlite3_reset(v10);
      objc_msgSend(v3, "handleSQLResult:message:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), CFSTR("setting flags"));
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 101)
      {

        break;
      }
    }

  }
  return 1;
}

- (id)updateFlagsForMessages:(id)a3 changes:(id)a4 transformer:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  MFMailMessageLibrary *v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[3];
  int v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary updateFlagsForMessages:changes:transformer:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke;
  v21[3] = &unk_1E4E89F88;
  v15 = v8;
  v22 = v15;
  v27 = v28;
  v16 = v10;
  v26 = v16;
  v17 = v12;
  v23 = v17;
  v18 = v11;
  v24 = v18;
  v25 = self;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v21);

  -[MFMailMessageLibrary postFlagsChangedForMessages:flags:oldFlagsByMessage:](self, "postFlagsChangedForMessages:flags:oldFlagsByMessage:", v17, v9, v18);
  v19 = v17;

  _Block_object_dispose(v28, 8);
  return v19;
}

uint64_t __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  sqlite3_int64 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t v19;
  _BYTE v20[15];

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT flags FROM messages WHERE ROWID = ?;"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
  if (v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
          break;
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mf_lock");
        v9 = objc_msgSend(v8, "messageFlags");
        sqlite3_bind_int64(v5, 1, objc_msgSend(v8, "libraryID"));
        v10 = v9;
        if (sqlite3_step(v5) == 100)
        {
          v11 = sqlite3_column_int64(v5, 0);
          v10 = v9;
          if (v11 != v9)
          {
            MFLogGeneral();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke_cold_1(&v19, v20, v12);

            v10 = v11;
          }
        }
        sqlite3_reset(v5);
        v14 = *(_QWORD *)(a1 + 64);
        v15 = v10;
        if (v14)
        {
          v15 = (*(uint64_t (**)(uint64_t, unint64_t))(v14 + 16))(v14, v10);
          v16 = *(_QWORD *)(a1 + 64);
          if (v16)
          {
            v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v16, v9);
            if (v13 != v9)
              objc_msgSend(v8, "setMessageFlagsWithoutCommitting:", v13);
          }
        }
        objc_msgSend(v8, "mf_unlock", v13);
        if (v15 != v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v17, v8);

          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = setFlagsForMessage(v3, v8, v15);
        }

      }
    }
  }

  return 1;
}

- (id)setFlagsFromDictionary:(id)a3 forMessages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageIsDeleted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    -[MFMailMessageLibrary removeSearchableItemsForMessages:](self, "removeSearchableItemsForMessages:", v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MFMailMessageLibrary_setFlagsFromDictionary_forMessages___block_invoke;
  v13[3] = &unk_1E4E89FB0;
  v10 = v6;
  v14 = v10;
  -[MFMailMessageLibrary updateFlagsForMessages:changes:transformer:](self, "updateFlagsForMessages:changes:transformer:", v7, v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

unint64_t __59__MFMailMessageLibrary_setFlagsFromDictionary_forMessages___block_invoke(uint64_t a1, unint64_t a2)
{
  return MFMessageFlagsByApplyingDictionary(a2, *(void **)(a1 + 32));
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  MFMailMessageLibrary *v20;
  id v21;
  uint64_t *v22;
  unsigned int v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  -[MFMailMessageLibrary database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setNumberOfAttachments:isSigned:isEncrypted:forMessage:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke;
  v18[3] = &unk_1E4E8A000;
  v14 = v11;
  v19 = v14;
  v20 = self;
  v15 = v10;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v21 = v15;
  v22 = &v26;
  objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v18);

  if (*((_BYTE *)v27 + 24) && objc_msgSend(v15, "conformsToProtocol:", &unk_1EE809D80))
  {
    -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *MEMORY[0x1E0D1E640];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "persistenceDidUpdateProperties:message:generationWindow:", v17, v15, v14);

  }
  _Block_object_dispose(&v26, 8);

}

uint64_t __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  int v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  v4 = *(void **)(a1 + 40);
  v14[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MessageNumberOfAttachmentsChanged");
  v13 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke_2;
  v9[3] = &unk_1E4E89FD8;
  v10 = *(_DWORD *)(a1 + 64);
  v11 = *(_WORD *)(a1 + 68);
  v9[4] = *(_QWORD *)(a1 + 56);
  v7 = (id)objc_msgSend(v4, "updateFlagsForMessages:changes:transformer:", v5, v6, v9);

  return 1;
}

unint64_t __79__MFMailMessageLibrary_setNumberOfAttachments_isSigned_isEncrypted_forMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  result = _MFFlagsBySettingNumberOfAttachments(a2, *(_DWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45));
  if (result != a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (void)setMessage:(id)a3 isPartial:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  BOOL v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MFMailMessageLibrary_setMessage_isPartial___block_invoke;
  v9[3] = &__block_descriptor_33_e8_Q16__0Q8l;
  v10 = a4;
  v8 = -[MFMailMessageLibrary updateFlagsForMessages:changes:transformer:](self, "updateFlagsForMessages:changes:transformer:", v7, 0, v9);

}

unint64_t __45__MFMailMessageLibrary_setMessage_isPartial___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(a1 + 32) << 34);
}

- (BOOL)_fileType:(int64_t)a3 orHigherExistsAtDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (!a3)
    goto LABEL_8;
  if (a3 != 1)
  {
    if (a3 != 2)
      goto LABEL_11;
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("headers.emlx"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "fileExistsAtPath:", v8) & 1) != 0)
      goto LABEL_9;
    v7 = v8;
  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("partial.emlx"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "fileExistsAtPath:", v8) & 1) == 0)
  {
    v7 = v8;
LABEL_8:
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("full.emlx"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "fileExistsAtPath:", v8) & 1) != 0)
      goto LABEL_9;
    v7 = v8;
LABEL_11:
    v9 = 0;
    v8 = v7;
    goto LABEL_12;
  }
LABEL_9:
  v9 = 1;
LABEL_12:

  return v9;
}

- (void)_removeEmlxFilesOfTypeLessThanType:(int64_t)a3 inDirectory:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("headers.emlx"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  }
}

- (BOOL)_writeEmlxFileOfType:(int64_t)a3 forAccount:(id)a4 toDirectory:(id)a5 withData:(id)a6 protectionClass:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[MFMailMessageLibrary _fileType:orHigherExistsAtDirectory:](self, "_fileType:orHigherExistsAtDirectory:", a3, v13))
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v16 = CFSTR("full.emlx");
    if (a3 == 1)
      v16 = CFSTR("partial.emlx");
    if (a3 == 2)
      v17 = CFSTR("headers.emlx");
    else
      v17 = v16;
    objc_msgSend(v13, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MFMailMessageLibrary _writeEmlxFile:withData:protectionClass:purgeable:](self, "_writeEmlxFile:withData:protectionClass:purgeable:", v18, v14, a7, objc_msgSend(v12, "supportsPurge"));
    if (v15)
      -[MFMailMessageLibrary _removeEmlxFilesOfTypeLessThanType:inDirectory:](self, "_removeEmlxFilesOfTypeLessThanType:inDirectory:", a3, v13);

  }
  return v15;
}

- (BOOL)_writeEmlxFile:(id)a3 withData:(id)a4 protectionClass:(int64_t)a5 purgeable:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:](self, "_writeEmlxData:toFile:protectionClass:purgeable:", v12, v11, a5, v6);

  return v6;
}

- (BOOL)_writeEmlxData:(id)a3 toFile:(id)a4 protectionClass:(int64_t)a5 purgeable:(BOOL)a6
{
  _BOOL4 v6;
  int v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int *v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  const std::__fs::filesystem::path *v24;
  id v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  const std::__fs::filesystem::path *v32;
  const std::__fs::filesystem::path *v33;
  std::error_code *v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v38;
  char v39;
  BOOL v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  uint8_t buf[32];
  char __b[1032];
  uint64_t v57;

  v6 = a6;
  v7 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "temporaryDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("emlx.XXXXXXXXXXXXXXXX"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  memset(__b, 170, 0x401uLL);
  v14 = objc_retainAutorelease(v13);
  objc_msgSend(v14, "fileSystemRepresentation");
  if ((unint64_t)__strlcpy_chk() > 0x400)
    goto LABEL_22;
  v15 = mkstemp_dprotected_np(__b, v7, 0);
  v16 = __error();
  if ((v15 & 0x80000000) != 0)
  {
    v41 = *v16;
    EDLibraryLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", __b, 0, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    close(v15);
    EDLibraryLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.2();
LABEL_21:

LABEL_22:
    v17 = 0;
LABEL_23:
    v40 = 0;
    goto LABEL_24;
  }

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v15, 0);
  v54 = 0;
  v18 = objc_msgSend(v14, "writeData:error:", v9, &v54);
  v19 = v54;
  v20 = v19;
  if ((v18 & 1) == 0)
  {
    EDLibraryLog();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.6();

    close(v15);
    goto LABEL_23;
  }

  if (v6 && EFMarkFileAsPurgeableFD())
  {
    v21 = *__error();
    EDLibraryLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.5(v23, buf, v21, v22);
    }

  }
  close(v15);
  v17 = objc_retainAutorelease(v17);
  v24 = (const std::__fs::filesystem::path *)objc_msgSend(v17, "fileSystemRepresentation");
  v25 = objc_retainAutorelease(v10);
  v26 = (const std::__fs::filesystem::path *)objc_msgSend(v25, "fileSystemRepresentation");
  rename(v24, v26, v27);
  if (!v28)
  {
    v40 = 1;
    goto LABEL_25;
  }
  if (*__error() == 2)
  {
    objc_msgSend(v25, "URLByDeletingLastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v29, 1, 0, 0);

    v31 = objc_retainAutorelease(v17);
    v32 = (const std::__fs::filesystem::path *)objc_msgSend(v31, "fileSystemRepresentation");
    v33 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v25), "fileSystemRepresentation");
    rename(v32, v33, v34);
    LODWORD(v32) = v35;

    if (!(_DWORD)v32)
    {
      v40 = 1;
      v17 = v31;
      goto LABEL_25;
    }
  }
  v36 = *__error();
  EDLibraryLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.4(v36, v37);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v39 = objc_msgSend(v38, "moveItemAtURL:toURL:error:", v17, v25, &v53);
  v14 = v53;

  if ((v39 & 1) == 0)
  {
    EDLibraryLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v25, "path");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary _writeEmlxData:toFile:protectionClass:purgeable:].cold.3(v52, (uint64_t)v14, (uint64_t)__b);
    }

    goto LABEL_23;
  }
  v40 = 1;
LABEL_24:

LABEL_25:
  return v40;
}

- (id)referencesFromHeaders:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "references");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = MFStringHashForMessageIDHeader();
          if (v10)
            objc_msgSend(v4, "addIndex:", v10, v14);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(v3, "firstHeaderForKey:", *MEMORY[0x1E0D1E588], v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = MFStringHashForMessageIDHeader();
    if (v12)
      objc_msgSend(v4, "addIndex:", v12);
  }

  return v4;
}

- (id)_addThreadingInfoWithContext:(id)a3 usingDatabaseConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  MFThreadFuzzyMatcher *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = a4;
  v6 = objc_msgSend(v5, "mailboxID");
  objc_msgSend(v5, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subjectWithoutPrefix");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "messageIDsBySubject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "libraryID");
  objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "preparedStatementForQueryString:", CFSTR("SELECT messages.ROWID, messages.message_id, messages.conversation_id, messages.subject_prefix, subjects.subject, addresses.comment, addresses.address, messages.date_sent FROM messages JOIN subjects ON messages.subject = subjects.ROWID JOIN addresses ON messages.sender = addresses.ROWID WHERE subjects.subject = ? AND messages.mailbox = ?"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53[0] = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  v12 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke;
  v43[3] = &unk_1E4E8A048;
  v13 = v9;
  v44 = v13;
  v42 = 0;
  LOBYTE(v9) = objc_msgSend(v34, "executeWithIndexedBindings:usingBlock:error:", v11, v43, &v42);
  v32 = v42;

  if ((v9 & 1) == 0)
    objc_msgSend(v38, "handleError:message:", v32, CFSTR("querying subject references for threads"));
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary _recipientsForMessagesWithDatabaseIDs:includeTo:includeCC:includeBCC:](self, "_recipientsForMessagesWithDatabaseIDs:includeTo:includeCC:includeBCC:", v14, 1, 1, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = v12;
  v40[1] = 3221225472;
  v40[2] = __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke_2;
  v40[3] = &unk_1E4E8A070;
  v30 = v15;
  v41 = v30;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v40);
  v16 = objc_alloc_init(MFThreadFuzzyMatcher);
  objc_msgSend(v13, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFThreadFuzzyMatcher matchMessageReferenceContext:withCandidateMessageReferenceContexts:](v16, "matchMessageReferenceContext:withCandidateMessageReferenceContexts:", v5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v5, "messageIDHash");
      v21 = objc_msgSend(v18, "messageIDHash");
      v22 = objc_msgSend(v18, "conversationIDHash");
      objc_msgSend(v18, "subject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ef_publicDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v46 = v20;
      v47 = 2048;
      v48 = v21;
      v49 = 2048;
      v50 = v22;
      v51 = 2114;
      v52 = v24;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "Threading %lld: found conversation from fuzzy matching: messageID: %lld, conversationID: %lld, subject: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(v39, "addIndex:", objc_msgSend(v18, "messageIDHash"));
    objc_msgSend(v33, "addIndex:", objc_msgSend(v18, "conversationIDHash"));
  }
  MFLogGeneral();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v5, "messageIDHash");
    objc_msgSend(v36, "objectForKeyedSubscript:", v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v46 = v26;
    v47 = 2112;
    v48 = (uint64_t)v27;
    _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "Threading %lld: adding in previously tracked messages IDs with the same subject: %@", buf, 0x16u);

  }
  objc_msgSend(v36, "objectForKeyedSubscript:", v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addIndexes:", v28);

  -[MFMailMessageLibrary _insertThreadReferences:toMessageWithLibraryID:usingDatabaseConnection:](self, "_insertThreadReferences:toMessageWithLibraryID:usingDatabaseConnection:", v39, v31, v38);
  return v33;
}

void __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  MFMessageReferenceContext *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64Value");

  objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "int64Value");

  objc_msgSend(v26, "objectAtIndexedSubscript:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectAtIndexedSubscript:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectAtIndexedSubscript:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectAtIndexedSubscript:", 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectAtIndexedSubscript:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  if (v5 && v7 && v11)
  {
    v19 = objc_alloc_init(MFMessageReferenceContext);
    -[MFMessageReferenceContext setMessageIDHash:](v19, "setMessageIDHash:", v5);
    -[MFMessageReferenceContext setConversationIDHash:](v19, "setConversationIDHash:", v7);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E7A0]), "initWithPrefix:subjectWithoutPrefix:", v9, v11);
    -[MFMessageReferenceContext setSubject:](v19, "setSubject:", v20);
    v21 = (void *)MEMORY[0x1E0D1E6C0];
    objc_msgSend(v15, "emailAddressValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsWithEmailAddress:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setDisplayName:", v13);
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageReferenceContext setSender:](v19, "setSender:", v24);

    -[MFMessageReferenceContext setDateSentInterval:](v19, "setDateSentInterval:", (double)v18);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, v25);

  }
}

void __77__MFMailMessageLibrary__addThreadingInfoWithContext_usingDatabaseConnection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toRecipientStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MFDatabaseEncodedStringForAddressList(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTo:", v7);

  objc_msgSend(v5, "ccRecipientStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MFDatabaseEncodedStringForAddressList(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCc:", v9);

  objc_msgSend(v5, "bccRecipientStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MFDatabaseEncodedStringForAddressList(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBcc:", v11);

}

- (BOOL)_insertThreadReferences:(id)a3 toMessageWithLibraryID:(int64_t)a4 usingDatabaseConnection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("message_references"));
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__MFMailMessageLibrary__insertThreadReferences_toMessageWithLibraryID_usingDatabaseConnection___block_invoke;
    v16[3] = &unk_1E4E8A098;
    v10 = v9;
    v17 = v10;
    v18 = a4;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v16);
    v15 = 0;
    v11 = objc_msgSend(v8, "executeInsertStatement:error:", v10, &v15);
    v12 = v15;
    if ((v11 & 1) != 0)
    {
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v20 = a4;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Threading: inserted message references for message with databaseID %lld: %@", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v8, "handleError:message:", v12, CFSTR("inserting message_references"));
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __95__MFMailMessageLibrary__insertThreadReferences_toMessageWithLibraryID_usingDatabaseConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "addValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("message"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("reference"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E4F69C40, CFSTR("is_originator"));
}

- (int64_t)addReferenceForContext:(id)a3 usingDatabaseConnection:(id)a4 generationWindow:(id)a5 mergeHandler:(id)a6
{
  id v10;
  uint64_t v11;
  BOOL v12;
  double Current;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  sqlite3_int64 v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  int64_t v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  sqlite3_stmt *v47;
  unint64_t *v48;
  int v49;
  id v50;
  sqlite3_stmt *v51;
  int v52;
  id v53;
  sqlite3_stmt *v54;
  int v55;
  double v56;
  double v57;
  id v58;
  sqlite3_stmt *v59;
  NSObject *v60;
  char v61;
  unint64_t v62;
  int v63;
  sqlite3_int64 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  id v72;
  sqlite3_stmt *v73;
  int v74;
  id v75;
  sqlite3_stmt *v76;
  int v77;
  void *v78;
  MFMailMessageLibrary *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  char v84;
  NSObject *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  id v92;
  NSObject *v93;
  int64_t v94;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void (**v105)(id, sqlite3_int64, sqlite3_int64);
  unint64_t *v106;
  id v107;
  id v108;
  unint64_t v109;
  void *v110;
  id v111;
  id v112;
  _QWORD v113[4];
  id v114;
  MFMailMessageLibrary *v115;
  id v116;
  unint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t v122[128];
  uint8_t buf[4];
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v111 = a4;
  v96 = a5;
  v105 = (void (**)(id, sqlite3_int64, sqlite3_int64))a6;
  v102 = v10;
  objc_msgSend(v10, "message");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v10, "libraryID");
  v101 = objc_msgSend(v10, "messageIDHash");
  objc_msgSend(v10, "references");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageIDsBySubject");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conversationFlagsRef");
  v12 = -[MFMailMessageLibrary isProtectedDataAvailable:](self, "isProtectedDataAvailable:", v111);
  Current = CFAbsoluteTimeGetCurrent();
  MFLogGeneral();
  v14 = objc_claimAutoreleasedReturnValue();
  v106 = (unint64_t *)v11;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v10, "messageIDHash");
    v16 = objc_msgSend(v10, "mailboxID");
    objc_msgSend(v10, "subject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ef_publicDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v124 = v15;
    v125 = 2048;
    v126 = v100;
    v127 = 2048;
    v128 = v16;
    v129 = 2114;
    v130 = v18;
    v131 = 2112;
    v132 = v103;
    _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Threading %lld: resolving for message (database ID: %lld), mailbox: %lld, subject: %{public}@, explicitReferences: %@", buf, 0x34u);

  }
  -[MFMailMessageLibrary _insertThreadReferences:toMessageWithLibraryID:usingDatabaseConnection:](self, "_insertThreadReferences:toMessageWithLibraryID:usingDatabaseConnection:", v103, v100, v111);
  objc_msgSend(v102, "subject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "prefixLength");

  objc_msgSend(v102, "subject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subjectWithoutPrefix");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  if (!objc_msgSend(v103, "count") && v20)
  {
    if (v12)
    {
      -[MFMailMessageLibrary _addThreadingInfoWithContext:usingDatabaseConnection:](self, "_addThreadingInfoWithContext:usingDatabaseConnection:", v102, v111);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "addIndexes:", v22);

    }
    else
    {
      -[MFMailMessageLibrary _addMessageToThreadAtUnlock:](self, "_addMessageToThreadAtUnlock:", v100);
    }
  }
  if (v101 && objc_msgSend(v98, "length"))
  {
    objc_msgSend(v97, "objectForKeyedSubscript:", v98);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setObject:forKeyedSubscript:", v25, v98);

    }
    objc_msgSend(v97, "objectForKeyedSubscript:", v98);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addIndex:", v101);

  }
  -[MFMailMessageLibrary conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:messageIDHash:](self, "conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:messageIDHash:", v100, v101);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addIndexes:", v27);

  objc_msgSend(v99, "externalConversationID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MFStringHashForMessageID();

  if (v29)
  {
    MFLogGeneral();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v124 = v101;
      v125 = 2048;
      v126 = v29;
      _os_log_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_DEFAULT, "Threading %lld: adding external conversation ID to explicit references: %lld", buf, 0x16u);
    }

    objc_msgSend(v103, "addIndex:", v29);
  }
  if (!objc_msgSend(v108, "count"))
  {
    if (objc_msgSend(v103, "count"))
    {
      v37 = -[MFMailMessageLibrary _conversationIdForMessageIds:](self, "_conversationIdForMessageIds:", v103);
      if (v37)
      {
        MFLogGeneral();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v124 = v101;
          v125 = 2048;
          v126 = v37;
          _os_log_impl(&dword_1A4F90000, v38, OS_LOG_TYPE_DEFAULT, "Threading %lld: found conversation ID from explicit references: %lld", buf, 0x16u);
        }

        objc_msgSend(v108, "addIndex:", v37);
      }
    }
  }
  v107 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = objc_msgSend(v99, "conversationID");
  objc_msgSend(v108, "removeIndex:", v31);
  v32 = objc_msgSend(v108, "count");
  if (v31)
  {
    if (!v32)
    {
      MFLogGeneral();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v124 = v101;
        v125 = 2048;
        v126 = v31;
        _os_log_impl(&dword_1A4F90000, v43, OS_LOG_TYPE_DEFAULT, "Threading %lld: Using current conversation %lld", buf, 0x16u);
      }
      goto LABEL_44;
    }
    v29 = objc_msgSend(v108, "firstIndex");
    objc_msgSend(v108, "addIndex:", v31);
    MFLogGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 134218496;
    v124 = v101;
    v125 = 2048;
    v126 = v31;
    v127 = 2048;
    v128 = v29;
    v34 = "Threading %lld: Merging current conversation %lld with another conversation %lld";
    v35 = v33;
    v36 = 32;
    goto LABEL_39;
  }
  if (v29 && !v32)
  {
    MFLogGeneral();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
LABEL_32:

      goto LABEL_41;
    }
    *(_DWORD *)buf = 134218240;
    v124 = v101;
    v125 = 2048;
    v126 = v29;
    v40 = "Threading %lld: Using external conversation ID %lld";
    v41 = v39;
    v42 = 22;
LABEL_31:
    _os_log_impl(&dword_1A4F90000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
    goto LABEL_32;
  }
  if (v32)
  {
    v29 = objc_msgSend(v108, "firstIndex");
    MFLogGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 134218240;
    v124 = v101;
    v125 = 2048;
    v126 = v29;
    v34 = "Threading %lld: Merging with existing conversation %lld";
    goto LABEL_38;
  }
  if (v101)
  {
    MFLogGeneral();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v101;
      goto LABEL_32;
    }
    *(_DWORD *)buf = 134217984;
    v29 = v101;
    v124 = v101;
    v40 = "Threading %lld: Setting conversation ID to message ID";
    v41 = v39;
    v42 = 12;
    goto LABEL_31;
  }
  v29 = MFUniqueMessageIDHash();
  MFLogGeneral();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v124 = 0;
    v125 = 2048;
    v126 = v29;
    v34 = "Threading %lld: Using newly created conversation ID %lld";
LABEL_38:
    v35 = v33;
    v36 = 22;
LABEL_39:
    _os_log_impl(&dword_1A4F90000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
  }
LABEL_40:

  if (!v29)
  {
    v31 = 0;
LABEL_62:
    v61 = 0;
    v48 = v106;
    goto LABEL_64;
  }
LABEL_41:
  if (v29 == v31)
    goto LABEL_47;
  if (objc_msgSend(v99, "isLibraryMessage"))
  {
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v99, 0, v96);
    -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "persistenceWillChangeConversationID:messages:", v31, v43);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v31);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v43, v45);

    v31 = v29;
LABEL_44:

    goto LABEL_47;
  }
  v31 = v29;
LABEL_47:
  objc_msgSend(v111, "preparedStatementForQueryString:", CFSTR("UPDATE messages SET conversation_id = ?, content_index_transaction_id = NULL WHERE rowid = ?"));
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v47 = (sqlite3_stmt *)objc_msgSend(v46, "compiled");

  v48 = v106;
  if (v47)
  {
    sqlite3_bind_int64(v47, 1, v31);
    sqlite3_bind_int64(v47, 2, v100);
    v49 = sqlite3_step(v47);
    sqlite3_reset(v47);
    objc_msgSend(v111, "checkForConnectionErrorWithMessage:", CFSTR("inserting conversation id into message row"));
    if (v49 != 101)
      goto LABEL_63;
  }
  objc_msgSend(v111, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO conversations (conversation_id) VALUES (?)"));
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51 = (sqlite3_stmt *)objc_msgSend(v50, "compiled");

  v48 = v106;
  if (v51)
  {
    sqlite3_bind_int64(v51, 1, v31);
    v52 = sqlite3_step(v51);
    sqlite3_reset(v51);
    objc_msgSend(v111, "checkForConnectionErrorWithMessage:", CFSTR("inserting row into conversations table"));
    if (v52 != 101)
      goto LABEL_63;
  }
  objc_msgSend(v111, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO conversation_id_message_id (conversation_id, message_id) SELECT ?, reference FROM message_references WHERE message = ?"));
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54 = (sqlite3_stmt *)objc_msgSend(v53, "compiled");

  if (v54)
  {
    sqlite3_bind_int64(v54, 1, v31);
    v48 = v106;
    sqlite3_bind_int64(v54, 2, v100);
    v55 = sqlite3_step(v54);
    sqlite3_reset(v54);
    objc_msgSend(v111, "checkForConnectionErrorWithMessage:", CFSTR("inserting row into conversation_id_message_id table (1)"));
  }
  else
  {
    v55 = 101;
    v48 = v106;
  }
  if (!v101 || v55 != 101)
  {
LABEL_58:
    if (v55 == 101)
      goto LABEL_59;
LABEL_63:
    v61 = 1;
    goto LABEL_64;
  }
  objc_msgSend(v99, "dateSentAsTimeIntervalSince1970");
  v57 = v56;
  objc_msgSend(v111, "preparedStatementForQueryString:", CFSTR("INSERT OR REPLACE INTO conversation_id_message_id (conversation_id, message_id, date_sent) VALUES (?, ?, ?)"));
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v59 = (sqlite3_stmt *)objc_msgSend(v58, "compiled");

  v48 = v106;
  if (v59)
  {
    sqlite3_bind_int64(v59, 1, v31);
    sqlite3_bind_int64(v59, 2, v101);
    sqlite3_bind_int64(v59, 3, (uint64_t)v57);
    v55 = sqlite3_step(v59);
    sqlite3_reset(v59);
    objc_msgSend(v111, "checkForConnectionErrorWithMessage:", CFSTR("inserting row into conversation_id_message_id table (2)"));
    goto LABEL_58;
  }
LABEL_59:
  MFLogGeneral();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v124 = v101;
    v125 = 2048;
    v126 = v31;
    _os_log_impl(&dword_1A4F90000, v60, OS_LOG_TYPE_DEFAULT, "Threading %lld: Resolved message's conversation ID to %lld", buf, 0x16u);
  }

  if (v105)
    goto LABEL_62;
  objc_msgSend(v99, "setConversationID:", v31);
  v48 = v106;
  v61 = 0;
LABEL_64:
  v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v61 & 1) != 0)
  {
    v62 = 0;
    v63 = 1;
  }
  else
  {
    objc_msgSend(v108, "removeIndex:", v31);
    v62 = -[MFMailMessageLibrary flagsForConversationId:](self, "flagsForConversationId:", v31);
    v64 = objc_msgSend(v108, "firstIndex");
    if (v64 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v63 = 0;
    }
    else
    {
      do
      {
        +[MFMessageCriterion criterionForNotDeletedConversationID:](MFMessageCriterion, "criterionForNotDeletedConversationID:", v64);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailMessageLibrary messagesMatchingCriterion:options:](self, "messagesMatchingCriterion:options:", v110, 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v62;
        objc_msgSend(v66, "persistenceWillChangeConversationID:messages:", v64, v65);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "objectForKeyedSubscript:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          objc_msgSend(v68, "addObjectsFromArray:", v65);
        }
        else
        {
          v69 = (void *)objc_msgSend(v65, "mutableCopy");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v64);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "setObject:forKeyedSubscript:", v69, v70);

        }
        v71 = -[MFMailMessageLibrary flagsForConversationId:](self, "flagsForConversationId:", v64);
        objc_msgSend(v111, "preparedStatementForQueryString:", CFSTR("UPDATE messages SET conversation_id = ?, content_index_transaction_id = NULL WHERE conversation_id = ?"));
        v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v73 = (sqlite3_stmt *)objc_msgSend(v72, "compiled");

        if (v73)
        {
          sqlite3_bind_int64(v73, 1, v31);
          sqlite3_bind_int64(v73, 2, v64);
          v74 = sqlite3_step(v73);
          sqlite3_reset(v73);
          objc_msgSend(v111, "checkForConnectionErrorWithMessage:", CFSTR("udpating other conversations to point to this one"));
          if (v74 != 101)
            goto LABEL_85;
        }
        objc_msgSend(v111, "preparedStatementForQueryString:", CFSTR("UPDATE OR IGNORE conversation_id_message_id SET conversation_id = ? WHERE conversation_id = ?"));
        v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v76 = (sqlite3_stmt *)objc_msgSend(v75, "compiled");

        if (!v76)
          goto LABEL_75;
        sqlite3_bind_int64(v76, 1, v31);
        sqlite3_bind_int64(v76, 2, v64);
        v77 = sqlite3_step(v76);
        sqlite3_reset(v76);
        objc_msgSend(v111, "checkForConnectionErrorWithMessage:", CFSTR("udpating other conversations to point to this one"));
        if (v77 != 101)
        {
LABEL_85:
          v63 = 1;
        }
        else
        {
LABEL_75:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v64);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "addObject:", v78);

          if (v105)
            v105[2](v105, v64, v31);
          v79 = self;
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          v80 = v65;
          v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
          if (v81)
          {
            v82 = *(_QWORD *)v119;
            do
            {
              for (i = 0; i != v81; ++i)
              {
                if (*(_QWORD *)v119 != v82)
                  objc_enumerationMutation(v80);
                objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * i), "setConversationID:", v31);
              }
              v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
            }
            while (v81);
          }

          self = v79;
          v63 = 0;
        }
        v64 = objc_msgSend(v108, "indexGreaterThanIndex:", v64);

        v62 = v71 | v109;
        if (v64 == 0x7FFFFFFFFFFFFFFFLL)
          v84 = 1;
        else
          v84 = v63;
        v48 = v106;
      }
      while ((v84 & 1) == 0);
    }
    if ((v63 & 1) == 0 && v62)
      -[MFMailMessageLibrary setFlags:forConversationId:](self, "setFlags:forConversationId:", v62, v31);
    if (v48)
      *v48 = v62;
  }
  if (CFAbsoluteTimeGetCurrent() - Current > 0.05)
  {
    MFLogGeneral();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      -[MFMailMessageLibrary addReferenceForContext:usingDatabaseConnection:generationWindow:mergeHandler:].cold.1();

  }
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = __101__MFMailMessageLibrary_addReferenceForContext_usingDatabaseConnection_generationWindow_mergeHandler___block_invoke;
  v113[3] = &unk_1E4E8A0C0;
  v86 = v99;
  v117 = v62;
  v114 = v86;
  v115 = self;
  v87 = v96;
  v116 = v87;
  objc_msgSend(v107, "enumerateKeysAndObjectsUsingBlock:", v113);
  if (objc_msgSend(v104, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("conversation_id"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "in:", v104);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("conversations"), v89);
    v112 = 0;
    v91 = objc_msgSend(v111, "executeDeleteStatement:error:", v90, &v112);
    v92 = v112;
    if ((v91 & 1) != 0)
    {
      MFLogGeneral();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v124 = v101;
        v125 = 2112;
        v126 = (uint64_t)v104;
        _os_log_impl(&dword_1A4F90000, v93, OS_LOG_TYPE_DEFAULT, "Threading %lld: deleting merged conversations from table: %@", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v111, "handleError:message:", v92, CFSTR("deleting row from conversations table"));
    }

    v63 = v91 ^ 1;
  }
  if (v63)
    v94 = 0;
  else
    v94 = v31;

  return v94;
}

void __101__MFMailMessageLibrary_addReferenceForContext_usingDatabaseConnection_generationWindow_mergeHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setConversationFlags:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "hookRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceIsChangingConversationID:messages:generationWindow:", objc_msgSend(v7, "longLongValue"), v5, *(_QWORD *)(a1 + 48));

}

- (MFMailboxFrecencyController)mailboxFrecencyController
{
  EFAtomicSetOnceObjectLoad();
  return (MFMailboxFrecencyController *)(id)objc_claimAutoreleasedReturnValue();
}

MFMailboxFrecencyController *__49__MFMailMessageLibrary_mailboxFrecencyController__block_invoke(uint64_t a1)
{
  MFMailboxFrecencyController *v2;
  void *v3;
  MFMailboxFrecencyController *v4;

  v2 = [MFMailboxFrecencyController alloc];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFMailboxFrecencyController initWithDatabase:](v2, "initWithDatabase:", v3);

  return v4;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  void *v2;
  void *v3;

  -[MFMailMessageLibrary persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hookRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDPersistenceHookRegistry *)v3;
}

- (id)duplicateMessages:(id)a3 newRemoteIDs:(id)a4 forMailbox:(id)a5 setFlags:(unint64_t)a6 createNewCacheFiles:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MFMailMessageLibrary addMessages:withMailbox:newMessagesByOldMessage:remoteIDs:setFlags:addPOPUIDs:dataSectionsByMessage:generationWindow:](self, "addMessages:withMailbox:newMessagesByOldMessage:remoteIDs:setFlags:addPOPUIDs:dataSectionsByMessage:generationWindow:", v11, v13, v14, v12, a6, 0, 0, 0);

  return v14;
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 newMessagesByOldMessage:(id)a5 remoteIDs:(id)a6 setFlags:(unint64_t)a7 addPOPUIDs:(BOOL)a8 dataSectionsByMessage:(id)a9 generationWindow:(id)a10
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t i;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  char v27;
  char v28;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  unint64_t v59;
  unint64_t v60;
  char v61;
  BOOL v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[3];
  int v69;
  _QWORD v70[4];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;

  v39 = a3;
  v14 = a4;
  v38 = a5;
  v37 = a6;
  v36 = a9;
  v35 = a10;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  if (v14)
  {
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v17;
    objc_msgSend(v14, "account");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v34, "supportsRemoteAppend");
    -[MFMailMessageLibrary messageBasePathForAccount:](self, "messageBasePathForAccount:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v34, "supportsPurge");
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v69 = 0;
    v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v67 = 0;
    for (i = objc_msgSend(v39, "count"); v65[3] < i; v17 = v40)
    {
      if (*((_BYTE *)v72 + 24) || (objc_msgSend(v15, "shouldCancel") & 1) != 0)
        break;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[MFMailMessageLibrary database](self, "database");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary addMessages:withMailbox:newMessagesByOldMessage:remoteIDs:setFlags:addPOPUIDs:dataSectionsByMessage:generationWindow:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke;
      v41[3] = &unk_1E4E8A188;
      v41[4] = self;
      v42 = v35;
      v55 = &v64;
      v59 = i;
      v56 = &v71;
      v22 = v15;
      v43 = v22;
      v44 = v39;
      v23 = v16;
      v45 = v16;
      v46 = v32;
      v61 = v28;
      v47 = v37;
      v57 = v70;
      v62 = a8;
      v60 = a7;
      v58 = v68;
      v48 = v31;
      v24 = v19;
      v49 = v24;
      v25 = v40;
      v50 = v25;
      v51 = v33;
      v63 = v27;
      v52 = v36;
      v53 = v34;
      v54 = v38;
      objc_msgSend(v20, "__performWriteWithCaller:usingBlock:", v21, v41);

      if (!*((_BYTE *)v72 + 24))
        objc_msgSend(v25, "addObjectsFromArray:", v24);
      if (v65[3] < i && !*((_BYTE *)v72 + 24) && (objc_msgSend(v22, "shouldCancel") & 1) == 0)
        usleep(0x1388u);

      v16 = v23;
    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);

    _Block_object_dispose(&v71, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

BOOL __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  void *v21;
  _MFAddableMessage *v22;
  _MFAddableMessage *v23;
  void *v24;
  os_unfair_lock_s *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _MFAddableMessage *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _MFEmailAddress *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _MFRecipientCollection *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  BOOL v100;
  char v101;
  BOOL v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  unint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  unint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  id v131;
  NSObject *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  NSObject *v144;
  void *v145;
  unint64_t v146;
  id v147;
  sqlite3_stmt *v148;
  void *v149;
  double v150;
  int v151;
  uint64_t v152;
  void *v153;
  void *v154;
  MFMessageReferenceContext *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  NSObject *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  uint64_t i;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  uint64_t v177;
  int v178;
  void *v179;
  id v180;
  void *v181;
  int v182;
  void *v183;
  void *v184;
  char v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  uint64_t v196;
  unint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  int v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  int v206;
  uint64_t v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  id v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  void *v217;
  id v218;
  id v219;
  double v220;
  double v221;
  double v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  const __CFString *v227;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  _BOOL8 v236;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  const __CFString *v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  id v277;
  int v278;
  int v279;
  const char *v280;
  const char *v281;
  id v282;
  id v283;
  void *v284;
  uint64_t v285;
  unsigned int v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  id v290;
  id v291;
  id v292;
  void *v293;
  uint64_t v294;
  void *v295;
  void *v296;
  void *v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  uint64_t v301;
  void *context;
  void *v303;
  sqlite3_int64 RowidForMailbox;
  void *v305;
  uint64_t v306;
  void *v307;
  void *v308;
  id v309;
  void *v310;
  sqlite3_int64 v311;
  char isKindOfClass;
  uint64_t v313;
  void *v314;
  NSObject *log;
  id v316;
  id v317;
  id v318;
  void *v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  _QWORD v324[4];
  id v325;
  id v326;
  unint64_t v327;
  id v328;
  sqlite3_int64 v329;
  id obj;
  _QWORD v331[5];
  _QWORD v332[5];
  _QWORD v333[5];
  id v334;
  _QWORD v335[16];
  uint64_t v336;
  uint64_t *v337;
  uint64_t v338;
  uint64_t (*v339)(uint64_t, uint64_t);
  void (*v340)(uint64_t);
  id v341;
  uint64_t v342;
  uint64_t *v343;
  uint64_t v344;
  uint64_t (*v345)(uint64_t, uint64_t);
  void (*v346)(uint64_t);
  id v347;
  uint64_t v348;
  uint64_t *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t *v365;
  uint64_t v366;
  uint64_t (*v367)(uint64_t, uint64_t);
  void (*v368)(uint64_t);
  id v369;
  uint64_t v370;
  uint64_t *v371;
  uint64_t v372;
  uint64_t (*v373)(uint64_t, uint64_t);
  void (*v374)(uint64_t);
  id v375;
  uint64_t v376;
  uint64_t *v377;
  uint64_t v378;
  uint64_t (*v379)(uint64_t, uint64_t);
  void (*v380)(uint64_t);
  id v381;
  uint64_t v382;
  uint64_t *v383;
  uint64_t v384;
  uint64_t (*v385)(uint64_t, uint64_t);
  void (*v386)(uint64_t);
  id v387;
  uint64_t v388;
  id *v389;
  uint64_t v390;
  uint64_t (*v391)(uint64_t, uint64_t);
  void (*v392)(uint64_t);
  id v393;
  uint64_t v394;
  uint64_t *v395;
  uint64_t v396;
  uint64_t (*v397)(uint64_t, uint64_t);
  void (*v398)(uint64_t);
  id v399;
  uint64_t v400;
  uint64_t *v401;
  uint64_t v402;
  uint64_t (*v403)(uint64_t, uint64_t);
  void (*v404)(uint64_t);
  id v405;
  unsigned __int8 v406;
  uint8_t v407;
  char v408[7];
  uint64_t v409;
  uint8_t v410[4];
  uint64_t v411;
  uint8_t v412[128];
  uint8_t buf[4];
  uint64_t v414;
  __int16 v415;
  uint64_t v416;
  __int16 v417;
  id v418;
  __int16 v419;
  void *v420;
  __int16 v421;
  uint64_t v422;
  __int16 v423;
  void *v424;
  __int16 v425;
  uint64_t v426;
  __int16 v427;
  void *v428;
  __int16 v429;
  uint64_t v430;
  __int16 v431;
  uint64_t v432;
  __int16 v433;
  uint64_t v434;
  _QWORD v435[30];
  _QWORD v436[16];
  uint64_t v437;
  void *v438;
  void *v439;
  uint64_t v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  uint64_t v445;
  void *v446;
  void *v447;
  const __CFString *v448;
  void *v449;
  void *v450;
  _QWORD v451[4];

  v451[1] = *MEMORY[0x1E0C80C00];
  v318 = a2;
  v277 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v291 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v290 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v292 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v278 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v318);
  objc_msgSend(*(id *)(a1 + 40), "insertGeneration:", objc_msgSend(v318, "transactionGeneration"));
  v3 = mach_absolute_time();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
  v289 = *MEMORY[0x1E0D1E988] + v4;
  if (v4 < *(_QWORD *)(a1 + 176) && v4 < *MEMORY[0x1E0D1E988] + v4)
  {
    v240 = v3;
    v293 = 0;
    v242 = *MEMORY[0x1E0D1E5F8];
    v7 = CFSTR("1");
    v241 = *MEMORY[0x1E0D1E558];
    if (v278)
      v7 = CFSTR("0");
    v254 = v7;
    v256 = *MEMORY[0x1E0D1E590];
    v255 = *MEMORY[0x1E0D1E638];
    v238 = *MEMORY[0x1E0D1DB68];
    v239 = *MEMORY[0x1E0D1E5B0];
    v311 = *MEMORY[0x1E0D1DC08];
    while (1)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24)
        || (objc_msgSend(*(id *)(a1 + 48), "shouldCancel") & 1) != 0)
      {
        goto LABEL_7;
      }
      context = (void *)MEMORY[0x1A85B0E24]();
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24));
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      unlockedMailboxUidForMessage(*(void **)(a1 + 32), v319);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v308 = v8;
      if (!v8)
      {
        EDLibraryLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_3(&v407, v408, v9);

        v8 = 0;
      }
      objc_msgSend(v8, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "supportsRemoteAppend");

      v12 = v319;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (objc_msgSend(v319, "conformsToProtocol:", &unk_1EE818590))
        v309 = v319;
      else
        v309 = 0;
      v406 = 0;
      if ((isKindOfClass & 1) != 0)
      {
        v303 = 0;
        if ((v278 & 1) != 0)
        {
          v13 = 0;
          v286 = 0;
          log = 0;
          goto LABEL_29;
        }
        v14 = 1;
      }
      else
      {
        objc_msgSend(v319, "messageDataHolderIsComplete:downloadIfNecessary:", &v406, 0);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v278 ^ 1;
      }
      objc_msgSend(v319, "headersIfAvailable");
      v286 = v14;
      log = objc_claimAutoreleasedReturnValue();
      if (!log)
      {
        v25 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 208);
        os_unfair_lock_lock(v25);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectForKeyedSubscript:", v319);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(v25);
        if (!v26
          || (objc_msgSend(v26, "headersIfAvailable"),
              log = objc_claimAutoreleasedReturnValue(),
              v26,
              v12 = v319,
              !log))
        {
          EDLibraryLog();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "ef_publicDescription");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "messageStore");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "messageStore");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v414 = (uint64_t)v27;
            v415 = 2112;
            v416 = (uint64_t)v28;
            v417 = 2048;
            v418 = v29;
            _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Not copying message (couldn't get headers from source message) %{public}@ with store %@ (%p)", buf, 0x20u);

          }
          goto LABEL_213;
        }
      }
      v13 = 1;
LABEL_29:
      v400 = 0;
      v401 = &v400;
      v402 = 0x3032000000;
      v403 = __Block_byref_object_copy__6;
      v404 = __Block_byref_object_dispose__6;
      v405 = 0;
      v394 = 0;
      v395 = &v394;
      v396 = 0x3032000000;
      v397 = __Block_byref_object_copy__6;
      v398 = __Block_byref_object_dispose__6;
      v399 = 0;
      objc_msgSend(*(id *)(a1 + 64), "URLString");
      v313 = objc_claimAutoreleasedReturnValue();
      v388 = 0;
      v389 = (id *)&v388;
      v390 = 0x3032000000;
      v391 = __Block_byref_object_copy__6;
      v392 = __Block_byref_object_dispose__6;
      v393 = 0;
      v382 = 0;
      v383 = &v382;
      v384 = 0x3032000000;
      v385 = __Block_byref_object_copy__6;
      v386 = __Block_byref_object_dispose__6;
      v387 = 0;
      v376 = 0;
      v377 = &v376;
      v378 = 0x3032000000;
      v379 = __Block_byref_object_copy__6;
      v380 = __Block_byref_object_dispose__6;
      v381 = 0;
      v370 = 0;
      v371 = &v370;
      v372 = 0x3032000000;
      v373 = __Block_byref_object_copy__6;
      v374 = __Block_byref_object_dispose__6;
      v375 = 0;
      v364 = 0;
      v365 = &v364;
      v366 = 0x3032000000;
      v367 = __Block_byref_object_copy__6;
      v368 = __Block_byref_object_dispose__6;
      v369 = 0;
      v360 = 0;
      v361 = &v360;
      v362 = 0x2020000000;
      v363 = 0;
      v356 = 0;
      v357 = &v356;
      v358 = 0x2020000000;
      v359 = 0;
      v352 = 0;
      v353 = &v352;
      v354 = 0x2020000000;
      v355 = 0;
      v348 = 0;
      v349 = &v348;
      v350 = 0x2020000000;
      v351 = 0;
      v342 = 0;
      v343 = &v342;
      v344 = 0x3032000000;
      v345 = __Block_byref_object_copy__6;
      v346 = __Block_byref_object_dispose__6;
      v347 = 0;
      v336 = 0;
      v337 = &v336;
      v338 = 0x3032000000;
      v339 = __Block_byref_object_copy__6;
      v340 = __Block_byref_object_dispose__6;
      v341 = 0;
      if ((v13 & 1) != 0)
        goto LABEL_35;
      if (!v293)
      {
        objc_msgSend(v318, "preparedStatementForQueryString:", CFSTR("SELECT addresses.comment AS sender_comment, addresses.address AS sender_address, subjects.subject, messages.remote_mailbox, messages.original_mailbox, content_type, messages.message_id, messages.external_id, messages.unique_id, messages.list_id_hash, messages.document_id, messages.unsubscribe_type FROM messages LEFT OUTER JOIN addresses ON messages.sender = addresses.ROWID LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID WHERE messages.ROWID = ?"));
        v293 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_msgSend(v12, "libraryID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v451[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v451, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v335[0] = MEMORY[0x1E0C809B0];
      v335[1] = 3221225472;
      v335[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_585;
      v335[3] = &unk_1E4E8A110;
      v335[4] = &v382;
      v335[5] = &v388;
      v335[6] = &v400;
      v335[7] = &v394;
      v335[8] = &v348;
      v335[9] = &v342;
      v335[10] = &v360;
      v335[11] = &v370;
      v335[12] = &v352;
      v335[13] = &v356;
      v335[14] = &v364;
      v335[15] = &v336;
      v334 = 0;
      v18 = objc_msgSend(v293, "executeWithIndexedBindings:usingBlock:error:", v17, v335, &v334);
      v19 = v334;

      if ((v18 & 1) == 0)
        objc_msgSend(v318, "handleError:message:", v19, CFSTR("Fetching fields for message"));
      objc_msgSend(*(id *)(a1 + 32), "_recipientsForMessageWithDatabaseID:connection:recipientsCache:", v15, v318, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v377[5];
      v377[5] = v20;

      v12 = v319;
      if (!v361[3])
LABEL_35:
        v361[3] = MFMessageIDHashFromHeaders();
      if ((isKindOfClass & 1) != 0)
      {
        v22 = [_MFAddableMessage alloc];
        v23 = -[_MFAddableMessage initWithLibraryMessage:messageIDHash:mailboxURL:](v22, "initWithLibraryMessage:messageIDHash:mailboxURL:", v12, v361[3], v313);
        objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "persistenceWillAddMessage:fromExistingMessage:", v23, 1);
      }
      else
      {
        if (objc_msgSend(v12, "messageIDHash"))
        {
          objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
          v23 = (_MFAddableMessage *)objc_claimAutoreleasedReturnValue();
          -[_MFAddableMessage persistenceWillAddMessage:fromExistingMessage:](v23, "persistenceWillAddMessage:fromExistingMessage:", v12, 0);
          goto LABEL_46;
        }
        v30 = [_MFAddableMessage alloc];
        v23 = -[_MFAddableMessage initWithLibraryMessage:messageIDHash:mailboxURL:](v30, "initWithLibraryMessage:messageIDHash:mailboxURL:", v12, v361[3], 0);
        objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "persistenceWillAddMessage:fromExistingMessage:", v23, 0);
      }

LABEL_46:
      if (!v389[5])
      {
        objc_msgSend(v319, "subjectIfAvailable");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "subjectString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (!v32)
        {
          -[NSObject firstHeaderForKey:](log, "firstHeaderForKey:", v242);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "ef_UTF8ConvertibleString");
          v252 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v252;
        }
        objc_storeStrong(v389 + 5, v33);
        if (!v32)
        {

        }
      }
      v34 = v319;
      if (!v383[5])
      {
        v35 = (void *)-[NSObject copyAddressListForSender](log, "copyAddressListForSender");
        v36 = [_MFEmailAddress alloc];
        objc_msgSend(v35, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[_MFEmailAddress initWithAddress:](v36, "initWithAddress:", v37);
        v39 = (void *)v383[5];
        v383[5] = v38;

        v34 = v319;
      }
      if (!v377[5])
      {
        v40 = objc_alloc_init(_MFRecipientCollection);
        v41 = (void *)v377[5];
        v377[5] = (uint64_t)v40;

        v42 = (void *)-[NSObject copyAddressListForTo](log, "copyAddressListForTo");
        v333[0] = MEMORY[0x1E0C809B0];
        v333[1] = 3221225472;
        v333[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_2;
        v333[3] = &unk_1E4E8A138;
        v333[4] = &v376;
        objc_msgSend(v42, "enumerateObjectsUsingBlock:", v333);

        v43 = (void *)-[NSObject copyAddressListForCc](log, "copyAddressListForCc");
        v332[0] = MEMORY[0x1E0C809B0];
        v332[1] = 3221225472;
        v332[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_3;
        v332[3] = &unk_1E4E8A138;
        v332[4] = &v376;
        objc_msgSend(v43, "enumerateObjectsUsingBlock:", v332);

        v44 = (void *)-[NSObject copyAddressListForBcc](log, "copyAddressListForBcc");
        v331[0] = MEMORY[0x1E0C809B0];
        v331[1] = 3221225472;
        v331[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_4;
        v331[3] = &unk_1E4E8A138;
        v331[4] = &v376;
        objc_msgSend(v44, "enumerateObjectsUsingBlock:", v331);

        v34 = v319;
      }
      if (!v343[5] && !v349[3])
      {
        v45 = (void *)-[NSObject copyFirstStringValueForKey:](log, "copyFirstStringValueForKey:", v241);
        if (v45)
        {
          v46 = (id *)(v343 + 5);
          obj = (id)v343[5];
          +[MFMimePart parseContentTypeHeader:type:subtype:](MFMailMimePart, "parseContentTypeHeader:type:subtype:", v45, &obj, 0);
          objc_storeStrong(v46, obj);
        }
        v47 = (void *)v343[5];
        if (v47)
        {
          v48 = v47;
          if ((objc_msgSend(v48, "isEqualToString:", CFSTR("text")) & 1) != 0)
          {
            v49 = 1;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("audio")) & 1) != 0)
          {
            v49 = 2;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("video")) & 1) != 0)
          {
            v49 = 3;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("application")) & 1) != 0)
          {
            v49 = 4;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("message")) & 1) != 0)
          {
            v49 = 5;
          }
          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("multipart")))
          {
            v49 = 6;
          }
          else
          {
            v49 = 7;
          }

          v349[3] = v49;
        }

        v34 = v319;
      }
      v50 = (void *)v313;
      if (v313 || (objc_msgSend(v308, "URLString"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v314 = v50;
        RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 32), v318, v50, *(void **)(a1 + 72), *(void **)(a1 + 40));
        if (RowidForMailbox != v311)
          goto LABEL_84;
      }
      else
      {
        v314 = 0;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = 1;
      EDLibraryLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v319, "ef_publicDescription");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v308, "ef_publicDescription");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v414 = (uint64_t)v153;
        v415 = 2112;
        v416 = (uint64_t)v314;
        v417 = 2114;
        v418 = v154;
        _os_log_error_impl(&dword_1A4F90000, v51, OS_LOG_TYPE_ERROR, "failed to find mailbox row for message %{public}@: mailboxURL = %@ for %{public}@", buf, 0x20u);

      }
      RowidForMailbox = v311;
      v34 = v319;
LABEL_84:
      if (!v401[5])
      {
        objc_msgSend(v34, "remoteMailboxURL");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", createRowidForMailbox(*(void **)(a1 + 32), v318, v52, *(void **)(a1 + 72), *(void **)(a1 + 40)));
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v401[5];
          v401[5] = v53;

        }
        v34 = v319;
      }
      if (*(_BYTE *)(a1 + 192))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", RowidForMailbox);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = (void *)v401[5];
        v401[5] = v55;

        v34 = v319;
      }
      v57 = *(void **)(a1 + 80);
      if (v57)
        objc_msgSend(v57, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24));
      else
        objc_msgSend(v34, "remoteID");
      v316 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v59 = v316 == v58;

      if (v59)
      {

        v316 = 0;
      }
      v60 = v319;
      if (v11 && !*(_BYTE *)(a1 + 192))
      {

        v61 = (void *)v401[5];
        v401[5] = 0;

        v316 = 0;
        v60 = v319;
      }
      if (!v395[5])
      {
        objc_msgSend(v60, "originalMailboxURL");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", createRowidForMailbox(*(void **)(a1 + 32), v318, v62, *(void **)(a1 + 72), *(void **)(a1 + 40)));
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)v395[5];
          v395[5] = v63;

        }
        v60 = v319;
      }
      objc_msgSend(v60, "dateReceivedAsTimeIntervalSince1970");
      v66 = v65;
      objc_msgSend(v60, "dateSentAsTimeIntervalSince1970");
      v68 = v67;
      v287 = objc_msgSend(v60, "messageSize");
      if (!v371[5])
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = (void *)v371[5];
        v371[5] = v69;

        v60 = v319;
      }
      if (!v353[3] && ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
      {
        v71 = objc_msgSend(v60, "uniqueRemoteId");
        v353[3] = v71;
      }
      if (!v357[3])
      {
        -[NSObject firstHeaderForKey:](log, "firstHeaderForKey:", v256);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v357[3] = MFStringHashForMessageIDHeader();

        v60 = v319;
      }
      if (!v365[5])
      {
        -[NSObject firstHeaderForKey:](log, "firstHeaderForKey:", v255);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v365[5];
        v365[5] = v73;

        v60 = v319;
      }
      v75 = objc_msgSend(v60, "messageFlags");
      v76 = objc_msgSend(*(id *)(a1 + 64), "mailboxType");
      v77 = 0xFFFFFFFAFFFFFFFFLL;
      if (v76 == 3)
        v77 = 0xFFFFFFFAFFFFFFFDLL;
      v78 = *(_QWORD *)(a1 + 184) | v77 & v75;
      if ((v78 & 1) != 0)
        v79 = "1";
      else
        v79 = "0";
      if ((v78 & 0x10) != 0)
        v80 = "1";
      else
        v80 = "0";
      if ((v78 & 0x10) != 0)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v78 >> 41) & 7);
      else
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v78 & 0x1000000) != 0)
        v81 = "1";
      else
        v81 = "0";
      if ((v78 & 2) != 0)
        v82 = "1";
      else
        v82 = "0";
      v288 = v78;
      if ((v78 & 0x82) != 0)
        v83 = "0";
      else
        v83 = "1";
      objc_msgSend(*(id *)(a1 + 32), "referencesFromHeaders:", log);
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v317 = objc_retainAutorelease(v316);
      v84 = (const char *)objc_msgSend(v317, "UTF8String");
      v85 = v319;
      v280 = v84;
      if (v84)
        v279 = strlen(v84);
      else
        v279 = 0;
      v329 = v311;
      v86 = objc_msgSend(*(id *)(a1 + 32), "_findOrCreateDatabaseIDForAddress:cache:outBusinessID:connection:", v383[5], v292, &v329, v318);
      v87 = objc_alloc(MEMORY[0x1E0D1E7A0]);
      v297 = (void *)objc_msgSend(v87, "initWithString:", v389[5]);
      objc_msgSend(v297, "prefix");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "subjectWithoutPrefix");
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      v306 = v86;
      if ((isKindOfClass & 1) != 0)
      {
        v301 = objc_msgSend(v319, "globalMessageID");
      }
      else
      {
        v301 = objc_msgSend(*(id *)(a1 + 32), "_findOrCreateDatabaseIDForGlobalData:cache:connection:", v361[3], v277, v318);
        objc_msgSend(v309, "categorizationResult");
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          objc_msgSend(*(id *)(a1 + 32), "persistence");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "categoryPersistence");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "currentCategorizationVersion");

          objc_msgSend(*(id *)(a1 + 32), "persistence");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "categoryPersistence");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "categorizationResult");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "persistCategorizationResult:forGlobalID:categorizationVersion:connection:", v94, v301, v91, v318);

        }
        objc_msgSend(*(id *)(a1 + 32), "persistence");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "messagePersistence");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "persistMessageAuthenticationState:forMessageWithGlobalMessageID:", objc_msgSend(v309, "authenticationState"), v301);

        v85 = v319;
      }
      v298 = objc_msgSend(*(id *)(a1 + 32), "_findOrCreateDatabaseIDForSubject:cache:connection:", v307, v291, v318);
      objc_msgSend(v85, "summary");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "ef_UTF8ConvertibleString");
      v310 = (void *)objc_claimAutoreleasedReturnValue();

      v98 = objc_msgSend(*(id *)(a1 + 32), "_findOrCreateDatabaseIDForSummary:cache:connection:", v310, v290, v318);
      objc_msgSend((id)v383[5], "address");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v306 != v311 || v99 == 0;
      v101 = 1;
      if (v100 && v298 != v311)
      {
        if (v310)
          v102 = v98 == v311;
        else
          v102 = 0;
        v101 = v102;
      }
      v294 = v98;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = v101;

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
      {
LABEL_208:
        v143 = v319;
LABEL_209:
        v327 = 0xAAAAAAAAAAAAAAAALL;
        goto LABEL_210;
      }
      objc_msgSend(v318, "preparedStatementForQueryString:", CFSTR("INSERT INTO messages (remote_id, sender, subject_prefix, global_message_id, subject, summary, date_sent, date_received, display_date, mailbox, remote_mailbox, original_mailbox, flags, read, flagged, flag_color, deleted, sender_vip, visible, size, encoding, content_type, message_id, sequence_identifier, external_id, unique_id, list_id_hash, journaled, document_id, unsubscribe_type) values (:remote_id, :sender, :subject_prefix, :global_message_id, :subject, :summary, :date_sent, :date_received, :display_date, :mailbox, :remote_mailbox, :original_mailbox, :flags, :read, :flagged, :flag_color, :deleted, :sender_vip, :visible, :size, :encoding, :content_type, :message_id, :sequence_identifier, :external_id, :unique_id, :list_id_hash, :journaled, :document_id, :unsubscribe_type)"));
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = v80;
      if (v349[3] != 7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v104 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_157;
      }
      v103 = (void *)v343[5];
      if (v103)
      {
        v104 = v103;
LABEL_157:
        v105 = v104;
        goto LABEL_158;
      }
      v105 = 0;
LABEL_158:
      v435[0] = CFSTR(":remote_id");
      v106 = v317;
      v276 = v105;
      if (!v317)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v249;
      }
      v436[0] = v106;
      v435[1] = CFSTR(":sender");
      if (v306 == v311)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v107 = objc_claimAutoreleasedReturnValue();
        v258 = (void *)v107;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v107 = objc_claimAutoreleasedReturnValue();
        v257 = (void *)v107;
      }
      v436[1] = v107;
      v435[2] = CFSTR(":subject_prefix");
      v108 = v305;
      if (!v305)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v251;
      }
      v436[2] = v108;
      v435[3] = CFSTR(":global_message_id");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v301);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v436[3] = v268;
      v435[4] = CFSTR(":subject");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v298);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      v436[4] = v267;
      v435[5] = CFSTR(":summary");
      if (v98 == v311)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v109 = objc_claimAutoreleasedReturnValue();
        v110 = 0x1E0CB3000;
        v260 = (void *)v109;
      }
      else
      {
        v110 = 0x1E0CB3000uLL;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v109 = objc_claimAutoreleasedReturnValue();
        v259 = (void *)v109;
      }
      v436[5] = v109;
      v435[6] = CFSTR(":date_sent");
      objc_msgSend(*(id *)(v110 + 2024), "numberWithDouble:", v68);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      v436[6] = v266;
      v435[7] = CFSTR(":date_received");
      objc_msgSend(*(id *)(v110 + 2024), "numberWithDouble:", v66);
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      v436[7] = v265;
      v435[8] = CFSTR(":display_date");
      objc_msgSend(*(id *)(v110 + 2024), "numberWithDouble:", v66);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      v436[8] = v262;
      v435[9] = CFSTR(":mailbox");
      objc_msgSend(*(id *)(v110 + 2024), "numberWithLongLong:", RowidForMailbox);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      v436[9] = v261;
      v435[10] = CFSTR(":remote_mailbox");
      v111 = (void *)v401[5];
      v271 = v111;
      if (!v111)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v248;
      }
      v436[10] = v111;
      v435[11] = CFSTR(":original_mailbox");
      v112 = (void *)v395[5];
      v274 = v112;
      if (!v112)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v250;
      }
      v436[11] = v112;
      v435[12] = CFSTR(":flags");
      objc_msgSend(*(id *)(v110 + 2024), "numberWithUnsignedLongLong:", v288);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v436[12] = v264;
      v435[13] = CFSTR(":read");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v79);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v436[13] = v263;
      v435[14] = CFSTR(":flagged");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v281);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      v436[14] = v270;
      v436[15] = v300;
      v435[15] = CFSTR(":flag_color");
      v435[16] = CFSTR(":deleted");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v82);
      v437 = objc_claimAutoreleasedReturnValue();
      v435[17] = CFSTR(":sender_vip");
      v269 = (void *)v437;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v81);
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      v438 = v272;
      v435[18] = CFSTR(":visible");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v83);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v439 = v113;
      v435[19] = CFSTR(":size");
      objc_msgSend(*(id *)(v110 + 2024), "numberWithUnsignedInteger:", v287);
      v114 = objc_claimAutoreleasedReturnValue();
      v115 = v110;
      v116 = (void *)v114;
      v440 = v114;
      v435[20] = CFSTR(":encoding");
      objc_msgSend(*(id *)(v115 + 2024), "numberWithUnsignedInt:", objc_msgSend(v319, "preferredEncoding"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = v117;
      v435[21] = CFSTR(":content_type");
      v118 = v105;
      if (!v105)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v247;
      }
      v442 = v118;
      v435[22] = CFSTR(":message_id");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v361[3]);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v443 = v119;
      v435[23] = CFSTR(":sequence_identifier");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v319, "modSequenceNumber"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v444 = v120;
      v435[24] = CFSTR(":external_id");
      v445 = v371[5];
      v435[25] = CFSTR(":unique_id");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v353[3]);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v446 = v121;
      v435[26] = CFSTR(":list_id_hash");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v357[3]);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v447 = v122;
      v448 = v254;
      v435[27] = CFSTR(":journaled");
      v435[28] = CFSTR(":document_id");
      v123 = (void *)v365[5];
      v124 = v123;
      if (!v123)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = v246;
      }
      v449 = v124;
      v435[29] = CFSTR(":unsubscribe_type");
      v125 = (void *)v337[5];
      v126 = v125;
      if (!v125)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v245;
      }
      v450 = v126;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v436, v435, 30);
      v282 = (id)objc_claimAutoreleasedReturnValue();
      if (!v125)

      v127 = v276;
      if (!v123)

      if (!v276)
      if (!v274)

      if (!v271)
      v128 = v260;
      if (v294 != v311)
        v128 = v259;

      if (!v305)
      v129 = v258;
      if (v306 != v311)
        v129 = v257;

      if (!v317)
      v328 = 0;
      v130 = objc_msgSend(v284, "executeWithNamedBindings:usingBlock:error:", v282, 0, &v328);
      v131 = v328;
      if (v130)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) = objc_msgSend(v318, "lastInsertedDatabaseID");
      }
      else
      {
        objc_msgSend(v318, "handleError:message:", v131, CFSTR("Inserting message"));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = 1;
      }
      EDLibraryLog();
      v132 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v133 = v361[3];
        objc_msgSend(v297, "ef_publicDescription");
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v383[5], "address");
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v273, "emailAddressValue");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v319, "dateReceived");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = objc_msgSend(v136, "isInternal");
        if (v137)
        {
          objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForSubjectOrSummary:", v310);
          v138 = objc_claimAutoreleasedReturnValue();
          v139 = (void *)v138;
          v140 = v243;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v310);
          v138 = objc_claimAutoreleasedReturnValue();
          v140 = (void *)v138;
          v139 = v244;
        }
        v141 = v337[5];
        *(_DWORD *)buf = 134220546;
        v414 = v133;
        v415 = 2048;
        v416 = v301;
        v417 = 2114;
        v418 = v317;
        v419 = 2114;
        v420 = v275;
        v421 = 2048;
        v422 = v298;
        v423 = 2114;
        v424 = v134;
        v425 = 2048;
        v426 = v306;
        v427 = 2114;
        v428 = v135;
        v429 = 2114;
        v430 = v138;
        v431 = 2048;
        v432 = v294;
        v433 = 2114;
        v434 = v141;
        _os_log_impl(&dword_1A4F90000, v132, OS_LOG_TYPE_DEFAULT, "Adding message with message_id: %lld, globalMessageID: %lld, remote_id: %{public}@, subject: %{public}@ (subjectID = %lld), sender: %{public}@ (%lld), date: %{public}@, summary: %{public}@ (%lld), unsubscribeType: %{public}@", buf, 0x70u);
        v243 = v140;
        v244 = v139;
        if (v137)
          v142 = v139;
        else
          v142 = v140;

        v127 = v276;
      }

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
        goto LABEL_208;
      v143 = v319;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addRecipients:toMessageWithDatabaseID:cache:connection:", v377[5], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8)+ 24), v292, v318) ^ 1;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
        goto LABEL_209;
      if (*(_BYTE *)(a1 + 193) && v395[5])
      {
        objc_msgSend(v318, "preparedStatementForQueryString:", CFSTR("INSERT OR REPLACE INTO pop_uids (mailbox, uid, date_added) VALUES (?, ?, ?);"));
        v147 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v148 = (sqlite3_stmt *)objc_msgSend(v147, "compiled");

        if (v148)
        {
          sqlite3_bind_int64(v148, 1, objc_msgSend((id)v395[5], "longLongValue"));
          sqlite3_bind_text(v148, 2, v280, v279, 0);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "timeIntervalSinceReferenceDate");
          sqlite3_bind_int(v148, 3, (int)v150);

          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = sqlite3_step(v148);
          sqlite3_reset(v148);
          objc_msgSend(v318, "checkForConnectionErrorWithMessage:", CFSTR("inserting POP UID"));
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8)
                                                                                + 24) != 101;
        v151 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24);
        v152 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
        v327 = 0xAAAAAAAAAAAAAAAALL;
        v143 = v319;
        if (v151)
          goto LABEL_210;
        v299 = v152;
      }
      else
      {
        v299 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
        v327 = 0xAAAAAAAAAAAAAAAALL;
      }
      v155 = objc_alloc_init(MFMessageReferenceContext);
      -[MFMessageReferenceContext setMessage:](v155, "setMessage:", v143);
      -[MFMessageReferenceContext setLibraryID:](v155, "setLibraryID:", v299);
      -[MFMessageReferenceContext setMessageIDHash:](v155, "setMessageIDHash:", v361[3]);
      objc_msgSend(MEMORY[0x1E0D1E7A0], "subjectWithString:", v389[5]);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageReferenceContext setSubject:](v155, "setSubject:", v156);

      -[MFMessageReferenceContext setReferences:](v155, "setReferences:", v296);
      -[MFMessageReferenceContext setMessageIDsBySubject:](v155, "setMessageIDsBySubject:", *(_QWORD *)(a1 + 88));
      -[MFMessageReferenceContext setMailboxID:](v155, "setMailboxID:", RowidForMailbox);
      -[MFMessageReferenceContext setConversationFlagsRef:](v155, "setConversationFlagsRef:", &v327);
      -[MFMessageReferenceContext setDateSentInterval:](v155, "setDateSentInterval:", v68);
      objc_msgSend((id)v383[5], "fullAddress");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageReferenceContext setSender:](v155, "setSender:", v157);

      objc_msgSend((id)v377[5], "toRecipientStrings");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      MFDatabaseEncodedStringForAddressList(v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageReferenceContext setTo:](v155, "setTo:", v159);

      objc_msgSend((id)v377[5], "ccRecipientStrings");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      MFDatabaseEncodedStringForAddressList(v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageReferenceContext setCc:](v155, "setCc:", v161);

      objc_msgSend((id)v377[5], "bccRecipientStrings");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      MFDatabaseEncodedStringForAddressList(v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageReferenceContext setBcc:](v155, "setBcc:", v163);

      v164 = *(void **)(a1 + 32);
      v165 = *(_QWORD *)(a1 + 40);
      v324[0] = MEMORY[0x1E0C809B0];
      v324[1] = 3221225472;
      v324[2] = __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_672;
      v324[3] = &unk_1E4E8A160;
      v325 = *(id *)(a1 + 96);
      v326 = *(id *)(a1 + 104);
      v166 = objc_msgSend(v164, "addReferenceForContext:usingDatabaseConnection:generationWindow:mergeHandler:", v155, v318, v165, v324);
      if (!v166)
      {
        MFLogGeneral();
        v167 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v414 = v299;
          _os_log_error_impl(&dword_1A4F90000, v167, OS_LOG_TYPE_ERROR, "[addMessages] setting conversation id for message with library id %lld failed", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = 1;
      }

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
      {
        objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v301, *(_QWORD *)(a1 + 112), *(unsigned __int8 *)(a1 + 194));
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "path");
        v295 = (void *)objc_claimAutoreleasedReturnValue();

        v322 = 0u;
        v323 = 0u;
        v320 = 0u;
        v321 = 0u;
        objc_msgSend(*(id *)(a1 + 120), "objectForKeyedSubscript:", v319);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v283 = v169;
        v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v320, v412, 16);
        if (v170)
        {
          v285 = *(_QWORD *)v321;
          while (2)
          {
            for (i = 0; i != v170; ++i)
            {
              if (*(_QWORD *)v321 != v285)
                objc_enumerationMutation(v283);
              v172 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * i);
              objc_msgSend(v172, "partName");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              v174 = v166;
              objc_msgSend(v172, "dataHolder");
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              v176 = *(void **)(a1 + 32);
              v177 = objc_msgSend(v172, "isPartial");
              v178 = objc_msgSend(v172, "isComplete");
              objc_msgSend(v319, "account");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v176) = _writeDataHolderForMessageAndPart(v176, v318, v299, v295, v173, v175, v177, v178 ^ 1u, v179);

              v166 = v174;
              if ((v176 & 1) == 0)
              {
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = 1;

                v169 = v283;
                goto LABEL_245;
              }
              if (!v310)
              {
                if (objc_msgSend(v175, "length")
                  && objc_msgSend(v173, "isEqualToString:", CFSTR("summary")))
                {
                  v180 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v175, "data");
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  v310 = (void *)objc_msgSend(v180, "initWithData:encoding:", v181, 4);
                  v166 = v174;

                }
                else
                {
                  v310 = 0;
                  v166 = v174;
                }
              }

            }
            v169 = v283;
            v170 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v320, v412, 16);
            if (v170)
              continue;
            break;
          }
        }
LABEL_245:

        if (objc_msgSend(v303, "length"))
        {
          v182 = objc_msgSend(*(id *)(a1 + 64), "alwaysWriteFullMessageFile");
          v183 = *(void **)(a1 + 32);
          if (v182)
          {
            objc_msgSend(v319, "account");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = objc_msgSend(v183, "_writeEmlxFileOfType:forAccount:toDirectory:withData:protectionClass:", 0, v184, v295, v303, _protectionClassForMailbox(*(void **)(a1 + 64)));
          }
          else
          {
            v206 = v406;
            objc_msgSend(v319, "account");
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = _writeDataHolderForMessageAndPart(v183, v318, v299, v295, 0, v303, 0, v206 == 0, v184);
          }

          if ((v185 & 1) == 0)
            goto LABEL_263;
        }
        else if (log)
        {
          objc_msgSend(*(id *)(a1 + 128), "URL");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "scheme");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          v188 = objc_msgSend(v187, "isEqual:", v238);

          if (v188)
          {
            if ((objc_msgSend(*(id *)(a1 + 32), "_fileType:orHigherExistsAtDirectory:", 2, v295) & 1) == 0)
            {
              objc_msgSend(v295, "stringByAppendingPathComponent:", CFSTR("headers.emlx"));
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject data](log, "data");
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              v191 = (void *)objc_msgSend(v190, "mutableCopy");

              -[NSObject data](log, "data");
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              v193 = objc_msgSend(v192, "length");

              if (v193 && v287)
              {
                -[NSObject data](log, "data");
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v194, "mf_locationsOfUnixNewlinesNeedingConversion");
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                v196 = objc_msgSend(v195, "count");

                v197 = v287 - (v196 + v193);
                if (v287 < v196 + v193)
                  v197 = 0;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-Apple-Content-Length: %lu\n\n"), v197);
                v198 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v198, "dataUsingEncoding:", 1);
                v199 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)objc_msgSend(v191, "length") >= 2)
                {
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\n\n", 2);
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  v201 = objc_msgSend(v191, "ef_hasSuffix:", v200);

                  if (v201)
                    objc_msgSend(v191, "setLength:", objc_msgSend(v191, "length") - 1);
                }
                objc_msgSend(v191, "appendData:", v199);

              }
              v202 = *(void **)(a1 + 32);
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v189, 0);
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              v204 = _protectionClassForMailbox(*(void **)(a1 + 64));
              objc_msgSend(v319, "account");
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v202) = objc_msgSend(v202, "_writeEmlxData:toFile:protectionClass:purgeable:", v191, v203, v204, objc_msgSend(v205, "supportsPurge"));

              if ((v202 & 1) == 0)
LABEL_263:
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = 1;
            }
          }
        }

        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 32), "_libraryMessageWithLibraryID:wasCached:", v299, 0);
          v144 = objc_claimAutoreleasedReturnValue();
          -[NSObject setGenerationNumber:](v144, "setGenerationNumber:", v240);
          objc_msgSend((id)v383[5], "fullAddress");
          v207 = objc_claimAutoreleasedReturnValue();
          v208 = (void *)v207;
          if (v207)
          {
            v409 = v207;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v409, 1);
          }
          else
          {
            objc_msgSend(v319, "sendersIfCached");
          }
          v209 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v377[5], "toRecipientStrings");
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = v210;
          if (v210)
          {
            v212 = v210;
          }
          else
          {
            objc_msgSend(v319, "toIfCached");
            v212 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend((id)v377[5], "ccRecipientStrings");
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = v213;
          if (v213)
          {
            v215 = v213;
          }
          else
          {
            objc_msgSend(v319, "ccIfCached");
            v215 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend((id)v377[5], "bccRecipientStrings");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          v217 = v216;
          if (v216)
          {
            v218 = v216;
          }
          else
          {
            objc_msgSend(v319, "bccIfCached");
            v218 = (id)objc_claimAutoreleasedReturnValue();

          }
          v219 = v389[5];
          objc_msgSend(v319, "dateReceivedAsTimeIntervalSince1970");
          v221 = v220;
          objc_msgSend(v319, "dateSentAsTimeIntervalSince1970");
          -[NSObject setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:](v144, "setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:", v219, v212, v215, v218, v209, v310, v221, v222);
          -[NSObject setConversationID:](v144, "setConversationID:", v166);
          -[NSObject setMessageIDHash:](v144, "setMessageIDHash:", v361[3]);
          -[NSObject setGlobalMessageID:](v144, "setGlobalMessageID:", v301);
          -[NSObject setMessageSize:](v144, "setMessageSize:", objc_msgSend(v319, "messageSize"));
          -[NSObject setFlags:](v144, "setFlags:", v288);
          -[NSObject setMailboxID:](v144, "setMailboxID:", RowidForMailbox);
          -[NSObject setOriginalMailboxID:](v144, "setOriginalMailboxID:", objc_msgSend((id)v395[5], "longLongValue"));
          objc_msgSend(v319, "dateReceived");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setDisplayDate:](v144, "setDisplayDate:", v223);

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v319, "readLater");
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setReadLater:](v144, "setReadLater:", v224);

            objc_msgSend(v319, "followUp");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFollowUp:](v144, "setFollowUp:", v225);

            objc_msgSend(v319, "sendLaterDate");
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setSendLaterDate:](v144, "setSendLaterDate:", v226);

          }
          if (v317)
            -[NSObject setRemoteID:](v144, "setRemoteID:", v317);
          if (v343[5])
            v227 = (const __CFString *)v343[5];
          else
            v227 = &stru_1E4F1C8F8;
          -[NSObject setContentType:](v144, "setContentType:", v227);
          -[NSObject setExternalID:](v144, "setExternalID:", v371[5]);
          -[NSObject setUniqueRemoteId:](v144, "setUniqueRemoteId:", v353[3]);
          -[NSObject setConversationFlags:](v144, "setConversationFlags:", v327);
          v228 = objc_alloc(MEMORY[0x1E0D1E680]);
          v229 = (void *)objc_msgSend(v228, "initWithHash:", v357[3]);
          -[NSObject setListIDHash:](v144, "setListIDHash:", v229);

          objc_msgSend(v319, "references");
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setReferences:](v144, "setReferences:", v230);

          -[NSObject setIsJournaled:](v144, "setIsJournaled:", v286);
          -[NSObject firstHeaderForKey:](log, "firstHeaderForKey:", v239);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setMessageIDHeader:](v144, "setMessageIDHeader:", v231);
          if (objc_msgSend(v319, "conformsToProtocol:", &unk_1EE818590))
          {
            v232 = *(void **)(a1 + 32);
            objc_msgSend(v319, "categorizationResult");
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v232, "_categoryFromCategorizationResult:addressID:", v233, v306);
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setCategory:](v144, "setCategory:", v234);

            goto LABEL_289;
          }
          if (objc_msgSend(v319, "conformsToProtocol:", &unk_1EE809D80))
          {
            objc_msgSend(v319, "category");
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setCategory:](v144, "setCategory:", v233);
LABEL_289:

          }
          -[NSObject setBusinessID:](v144, "setBusinessID:", v329);
          objc_msgSend(*(id *)(a1 + 96), "addObject:", v144);
          v235 = *(void **)(a1 + 136);
          if (v235)
            objc_msgSend(v235, "setObject:forKeyedSubscript:", v144, v319);

          goto LABEL_212;
        }
      }
      v143 = v319;
LABEL_210:
      EDLibraryLog();
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v143, "ef_publicDescription");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_2(v145, v410, &v411, v144);
      }
LABEL_212:

      _Block_object_dispose(&v336, 8);
      _Block_object_dispose(&v342, 8);

      _Block_object_dispose(&v348, 8);
      _Block_object_dispose(&v352, 8);
      _Block_object_dispose(&v356, 8);
      _Block_object_dispose(&v360, 8);
      _Block_object_dispose(&v364, 8);

      _Block_object_dispose(&v370, 8);
      _Block_object_dispose(&v376, 8);

      _Block_object_dispose(&v382, 8);
      _Block_object_dispose(&v388, 8);

      _Block_object_dispose(&v394, 8);
      _Block_object_dispose(&v400, 8);

LABEL_213:
      objc_autoreleasePoolPop(context);
      v146 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
      if (v146 >= *(_QWORD *)(a1 + 176) || v146 >= v289)
        goto LABEL_7;
    }
  }
  v293 = 0;
LABEL_7:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
  {
    EDLibraryLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_1();
    goto LABEL_295;
  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject persistenceIsAddingMessages:journaled:generationWindow:](v6, "persistenceIsAddingMessages:journaled:generationWindow:", *(_QWORD *)(a1 + 96), v278 ^ 1u, *(_QWORD *)(a1 + 40));
LABEL_295:

  }
  v236 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) == 0;

  return v236;
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_585(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _MFEmailAddress *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;

  v42 = a2;
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("sender_address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("sender_comment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_MFEmailAddress initWithAddress:displayName:]([_MFEmailAddress alloc], "initWithAddress:displayName:", v4, v6);
  v8 = *(_QWORD *)(a1[4] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("subject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("remote_mailbox"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberValue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1[6] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("original_mailbox"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberValue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1[7] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("content_type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = (int)objc_msgSend(v23, "intValue");
  else
    objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), v23);
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("message_id"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = objc_msgSend(v25, "longLongValue");

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("external_id"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringValue");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(a1[11] + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("unique_id"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 24) = objc_msgSend(v31, "longLongValue");

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("list_id_hash"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "numberValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 24) = objc_msgSend(v33, "longLongValue");

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("document_id"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringValue");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = *(_QWORD *)(a1[14] + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v35;

  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("unsubscribe_type"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "numberValue");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = *(_QWORD *)(a1[15] + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v39;

}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _MFEmailAddress *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = -[_MFEmailAddress initWithAddress:]([_MFEmailAddress alloc], "initWithAddress:", v5);
  objc_msgSend(v3, "addToRecipient:", v4);

}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _MFEmailAddress *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = -[_MFEmailAddress initWithAddress:]([_MFEmailAddress alloc], "initWithAddress:", v5);
  objc_msgSend(v3, "addCCRecipient:", v4);

}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  _MFEmailAddress *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = -[_MFEmailAddress initWithAddress:]([_MFEmailAddress alloc], "initWithAddress:", v5);
  objc_msgSend(v3, "addBCCRecipient:", v4);

}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_672(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "conversationID") == a2)
          objc_msgSend(v10, "setConversationID:", a3);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v15, "conversationID", (_QWORD)v16) == a2)
          objc_msgSend(v15, "setConversationID:", a3);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (id)_categoryFromCategorizationResult:(id)a3 addressID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (!_os_feature_enabled_impl())
    goto LABEL_4;
  -[MFMailMessageLibrary persistence](self, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "businessPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "categoryTypeForAddressID:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D1E110]);
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v6, "category");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "subtype");
    objc_msgSend(v6, "category");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithType:subtype:isHighImpact:state:", v11, v13, objc_msgSend(v14, "isHighImpact"), 3);

  }
  else
  {
LABEL_4:
    objc_msgSend(v6, "category");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)willStartPersistenceDidAddMessages:(id)a3
{
  os_unfair_lock_s *p_addedMessagesMapLock;
  id v5;

  p_addedMessagesMapLock = &self->_addedMessagesMapLock;
  v5 = a3;
  os_unfair_lock_lock(p_addedMessagesMapLock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_currentAddedMessagesMap, "addEntriesFromDictionary:", v5);

  os_unfair_lock_unlock(p_addedMessagesMapLock);
}

- (void)didFinishPersistenceDidAddMessages:(id)a3
{
  os_unfair_lock_s *p_addedMessagesMapLock;
  NSMutableDictionary *currentAddedMessagesMap;
  void *v6;
  id v7;

  v7 = a3;
  p_addedMessagesMapLock = &self->_addedMessagesMapLock;
  os_unfair_lock_lock(&self->_addedMessagesMapLock);
  currentAddedMessagesMap = self->_currentAddedMessagesMap;
  objc_msgSend(v7, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](currentAddedMessagesMap, "removeObjectsForKeys:", v6);

  os_unfair_lock_unlock(p_addedMessagesMapLock);
}

- (void)persistenceIsAddingMessages:(id)a3 journaled:(BOOL)a4 generationWindow:(id)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "count") && v5)
    -[MFMailMessageLibrary _didAddUnreconciledMessages:](self, "_didAddUnreconciledMessages:", objc_msgSend(v7, "count"));

}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MFMailMessageLibrary *v11;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "ef_groupBy:", &__block_literal_global_684);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__MFMailMessageLibrary_persistenceDidAddMessages_generationWindow___block_invoke_2;
    v9[3] = &unk_1E4E8A1F0;
    v10 = v6;
    v11 = self;
    v7 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

id __67__MFMailMessageLibrary_persistenceDidAddMessages_generationWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __67__MFMailMessageLibrary_persistenceDidAddMessages_generationWindow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11[0] = v6;
  v10[0] = CFSTR("messages");
  v10[1] = CFSTR("mailboxes");
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:userInfo:", CFSTR("MailMessageStoreMessagesAdded"), *(_QWORD *)(a1 + 40), v8);
}

- (BOOL)_addRecipients:(id)a3 toMessageWithDatabaseID:(int64_t)a4 cache:(id)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t (**v15)(void *, void *, uint64_t);
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  MFMailMessageLibrary *v26;
  id v27;
  id v28;
  int64_t v29;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke;
  v25 = &unk_1E4E8A240;
  v26 = self;
  v13 = v11;
  v27 = v13;
  v14 = v12;
  v28 = v14;
  v29 = a4;
  v15 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(&v22);
  objc_msgSend(v10, "toRecipients", v22, v23, v24, v25, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v15[2](v15, v16, 1);

  if ((v12 & 1) != 0
    && (objc_msgSend(v10, "ccRecipients"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = v15[2](v15, v17, 2),
        v17,
        (v18 & 1) != 0))
  {
    objc_msgSend(v10, "bccRecipients");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15[2](v15, v19, 3);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v17 = 0x2020000000;
  v18 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke_2;
  v9[3] = &unk_1E4E8A218;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v16 = &v15;
  v9[1] = 3221225472;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v12 = &v15;
  v13 = *(_QWORD *)(a1 + 56);
  v14 = a3;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v9);
  v7 = *((unsigned __int8 *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __80__MFMailMessageLibrary__addRecipients_toMessageWithDatabaseID_cache_connection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  _BYTE *v16;
  void *v17;
  id v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_msgSend(*(id *)(a1 + 32), "_findOrCreateDatabaseIDForAddress:cache:outBusinessID:connection:", v7, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  if (v8 == *MEMORY[0x1E0D1DC08])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    v16 = a4;
    objc_msgSend(*(id *)(a1 + 48), "preparedStatementForQueryString:", CFSTR("INSERT INTO recipients (message, address, type, position) VALUES (?, ?, ?, ?)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v14 = objc_msgSend(v17, "executeWithIndexedBindings:usingBlock:error:", v13, 0, &v18);
    v15 = v18;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v14;

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 48), "handleError:message:", v15, CFSTR("Inserting address"));

    a4 = v16;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;

}

- (int64_t)_findOrCreateDatabaseIDForAddress:(id)a3 cache:(id)a4 outBusinessID:(int64_t *)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  char v21;
  id v22;
  uint64_t v23;
  char v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int64_t v30;
  char v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    objc_msgSend(v10, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v10, "fullAddress");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "longLongValue");
LABEL_31:

        goto LABEL_32;
      }
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v16 = *MEMORY[0x1E0D1DC08];
      v43 = *MEMORY[0x1E0D1DC08];
      objc_msgSend(v12, "preparedStatementForQueryString:", CFSTR("SELECT ROWID FROM addresses WHERE address = ? AND comment = ?"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v17;
      objc_msgSend(v10, "displayName");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = &stru_1E4F1C8F8;
      if (v18)
        v20 = (const __CFString *)v18;
      v44[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __89__MFMailMessageLibrary__findOrCreateDatabaseIDForAddress_cache_outBusinessID_connection___block_invoke;
      v39[3] = &unk_1E4E8A268;
      v39[4] = &v40;
      v21 = objc_msgSend(v34, "executeWithIndexedBindings:usingBlock:error:", v35, v39, &v38);
      v22 = v38;
      if ((v21 & 1) != 0)
      {
        v23 = v41[3];
        if (v23 != v16)
        {
          v24 = 1;
LABEL_16:
          if (v23 == v16 || !_os_feature_enabled_impl())
          {
            if (a5)
              *a5 = v16;
          }
          else
          {
            -[MFMailMessageLibrary persistence](self, "persistence");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "businessPersistence");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = objc_msgSend(v29, "findOrCreateBusinessIDForAddress:connection:", v36, v12);
            if (v30 == v16)
              v31 = 1;
            else
              v31 = v24;
            if ((v31 & 1) == 0)
              objc_msgSend(v29, "setBusiness:forAddress:connection:", v30, v41[3], v12);
            if (a5)
              *a5 = v30;

          }
          if (v41[3] != v16)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, v36);

            v16 = v41[3];
          }

          _Block_object_dispose(&v40, 8);
          goto LABEL_31;
        }
      }
      else
      {
        objc_msgSend(v12, "handleError:message:", v22, CFSTR("Looking up address ROWID"));
        v41[3] = v16;
      }
      objc_msgSend(v12, "preparedStatementForQueryString:", CFSTR("INSERT INTO addresses (address, comment) VALUES (?, ?)"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
      v26 = objc_msgSend(v25, "executeWithIndexedBindings:usingBlock:error:", v35, 0, &v37);
      v22 = v37;
      if (v26)
      {
        v27 = objc_msgSend(v12, "lastInsertedDatabaseID");
        v41[3] = v27;
      }
      else
      {
        objc_msgSend(v12, "handleError:message:", v22, CFSTR("Inserting address"));
      }

      v24 = v26 ^ 1;
      v23 = v41[3];
      goto LABEL_16;
    }
  }
  v16 = *MEMORY[0x1E0D1DC08];
LABEL_32:

  return v16;
}

void __89__MFMailMessageLibrary__findOrCreateDatabaseIDForAddress_cache_outBusinessID_connection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "longLongValue");

  *a4 = 1;
}

- (int64_t)_findOrCreateDatabaseIDForGlobalData:(int64_t)a3 cache:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  char v15;

  v8 = a4;
  v9 = a5;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MFMailMessageLibrary _findOrCreateDatabaseIDForValue:inTable:column:cache:connection:created:](self, "_findOrCreateDatabaseIDForValue:inTable:column:cache:connection:created:", v11, v12, CFSTR("message_id"), v8, v9, &v15);

  if (v15)
    -[MFMailMessageLibrary _removeDataFilesForGlobalID:](self, "_removeDataFilesForGlobalID:", v13);

  return v13;
}

- (int64_t)_findOrCreateDatabaseIDForSubject:(id)a3 cache:(id)a4 connection:(id)a5
{
  return -[MFMailMessageLibrary _findOrCreateDatabaseIDForValue:inTable:column:cache:connection:created:](self, "_findOrCreateDatabaseIDForValue:inTable:column:cache:connection:created:", a3, CFSTR("subjects"), CFSTR("subject"), a4, a5, 0);
}

- (int64_t)_findOrCreateDatabaseIDForSummary:(id)a3 cache:(id)a4 connection:(id)a5
{
  return -[MFMailMessageLibrary _findOrCreateDatabaseIDForValue:inTable:column:cache:connection:created:](self, "_findOrCreateDatabaseIDForValue:inTable:column:cache:connection:created:", a3, CFSTR("summaries"), CFSTR("summary"), a4, a5, 0);
}

- (int64_t)_findOrCreateDatabaseIDForValue:(id)a3 inTable:(id)a4 column:(id)a5 cache:(id)a6 connection:(id)a7 created:(BOOL *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  int64_t v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *log;
  int v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  _QWORD v42[5];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  id v49;
  id v50;
  _BYTE v51[24];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      EDLibraryLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v51 = 134218498;
        *(_QWORD *)&v51[4] = objc_msgSend(v18, "longLongValue");
        *(_WORD *)&v51[12] = 2114;
        *(_QWORD *)&v51[14] = v14;
        *(_WORD *)&v51[22] = 2114;
        v52 = v15;
        _os_log_debug_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEBUG, "Found database ID %lld in cache for table: %{public}@, column: %{public}@", v51, 0x20u);
      }

      v20 = objc_msgSend(v18, "longLongValue");
    }
    else
    {
      *(_QWORD *)v51 = 0;
      *(_QWORD *)&v51[8] = v51;
      *(_QWORD *)&v51[16] = 0x2020000000;
      v39 = *MEMORY[0x1E0D1DC08];
      v52 = (id)*MEMORY[0x1E0D1DC08];
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT ROWID FROM %@ WHERE %@ = ?"), v14, v15);
      objc_msgSend(v17, "preparedStatementForQueryString:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __96__MFMailMessageLibrary__findOrCreateDatabaseIDForValue_inTable_column_cache_connection_created___block_invoke;
      v42[3] = &unk_1E4E8A268;
      v42[4] = v51;
      v22 = objc_msgSend(v38, "executeWithIndexedBindings:usingBlock:error:", v21, v42, &v41);
      v23 = v41;

      if ((v22 & 1) == 0)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Looking up %@ ROWID"), v15);
        objc_msgSend(v17, "handleError:message:", v23, v24);
        *(_QWORD *)(*(_QWORD *)&v51[8] + 24) = v39;

      }
      if (*(_QWORD *)(*(_QWORD *)&v51[8] + 24) == v39)
      {
        log = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO %@ (%@) VALUES (?)"), v14, v15);
        objc_msgSend(v17, "preparedStatementForQueryString:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v23;
        v37 = objc_msgSend(v34, "executeWithIndexedBindings:usingBlock:error:", v25, 0, &v40);
        v26 = v40;

        if (v37)
        {
          v27 = objc_msgSend(v17, "lastInsertedDatabaseID");
          *(_QWORD *)(*(_QWORD *)&v51[8] + 24) = v27;
        }
        else
        {
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Inserting %@"), v15);
          objc_msgSend(v17, "handleError:message:", v26, v28);
          *(_QWORD *)(*(_QWORD *)&v51[8] + 24) = v39;

        }
        EDLibraryLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_QWORD *)(*(_QWORD *)&v51[8] + 24);
          *(_DWORD *)buf = 134218498;
          v44 = v30;
          v45 = 2114;
          v46 = v14;
          v47 = 2114;
          v48 = v15;
          _os_log_impl(&dword_1A4F90000, v29, OS_LOG_TYPE_DEFAULT, "Inserted new database ID %lld in database for table: %{public}@, column: %{public}@", buf, 0x20u);
        }

      }
      else
      {
        EDLibraryLog();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          v33 = *(_QWORD *)(*(_QWORD *)&v51[8] + 24);
          *(_DWORD *)buf = 134218498;
          v44 = v33;
          v45 = 2114;
          v46 = v14;
          v47 = 2114;
          v48 = v15;
          _os_log_debug_impl(&dword_1A4F90000, log, OS_LOG_TYPE_DEBUG, "Found database ID %lld in database for table: %{public}@, column: %{public}@", buf, 0x20u);
        }
        LOBYTE(v37) = 0;
        v26 = v23;
      }

      if (*(_QWORD *)(*(_QWORD *)&v51[8] + 24) != v39)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, v13);

      }
      if (a8)
        *a8 = v37;
      v20 = *(_QWORD *)(*(_QWORD *)&v51[8] + 24);

      _Block_object_dispose(v51, 8);
    }

  }
  else
  {
    v20 = *MEMORY[0x1E0D1DC08];
  }

  return v20;
}

void __96__MFMailMessageLibrary__findOrCreateDatabaseIDForValue_inTable_column_cache_connection_created___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "longLongValue");

  *a4 = 1;
}

- (void)_removeDataFilesForGlobalID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", a3, self->_path, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtURL:error:", v5, 0);

  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", a3, self->_path, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  +[MailAccount mailAccounts](MailAccount, "mailAccounts");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "personaIdentifier", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[MFMailMessageLibrary messageBasePathForAccount:](self, "messageBasePathForAccount:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", a3, v15, objc_msgSend(v13, "supportsPurge"));
          v16 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeItemAtURL:error:", v16, 0);

          v7 = (void *)v16;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)updateAdditionalThreadingInfoForSentMessageWithHeaders:(id)a3 externalConversationID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a3;
  -[MFMailMessageLibrary database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary updateAdditionalThreadingInfoForSentMessageWithHeaders:externalConversationID:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__MFMailMessageLibrary_updateAdditionalThreadingInfoForSentMessageWithHeaders_externalConversationID___block_invoke;
  v10[3] = &unk_1E4E8A290;
  v9 = v6;
  v11 = v9;
  v12 = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v10);

}

uint64_t __102__MFMailMessageLibrary_updateAdditionalThreadingInfoForSentMessageWithHeaders_externalConversationID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  sqlite3_int64 v4;
  id v5;
  sqlite3_stmt *v6;

  v3 = a2;
  v4 = MFMessageIDHashFromHeaders();
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT OR IGNORE INTO conversation_id_message_id (conversation_id, message_id) VALUES (?, ?)"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");

  if (v6)
  {
    sqlite3_bind_int64(v6, 1, v4);
    sqlite3_bind_int64(v6, 2, *(_QWORD *)(a1 + 40));
    sqlite3_step(v6);
    sqlite3_reset(v6);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("inserting row into conversation_id_message_id table (3)"));
  }

  return 1;
}

- (void)updateThreadingInfoForMessage:(id)a3 fromHeaders:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  MFMailMessageLibrary *v23;
  id v24;
  uint64_t *v25;
  SEL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[MFMailMessageLibrary referencesFromHeaders:](self, "referencesFromHeaders:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    v9 = objc_msgSend(v7, "conversationID");
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = *MEMORY[0x1E0D1DC08];
    v10 = v30;
    -[MFMailMessageLibrary database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary updateThreadingInfoForMessage:fromHeaders:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke;
    v19[3] = &unk_1E4E8A2E0;
    v20 = v8;
    v13 = v17;
    v21 = v13;
    v14 = v7;
    v22 = v14;
    v23 = self;
    v25 = &v27;
    v26 = a2;
    v15 = v18;
    v24 = v15;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v19);

    if (v28[3] != v10 || v9 != objc_msgSend(v14, "conversationID"))
    {
      -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "persistenceDidChangeGlobalMessageID:orConversationID:message:generationWindow:", v28[3], v9, v14, v13);

    }
    _Block_object_dispose(&v27, 8);

  }
}

uint64_t __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  sqlite3_stmt *v37;
  id v38;
  MFMessageReferenceContext *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[5];
  id v61;
  _BYTE v62[24];
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MFMessageIDHashFromHeaders();
  objc_msgSend(*(id *)(a1 + 40), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("ROWID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "libraryID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "equalTo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWhereClause:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("message_id"));

    objc_msgSend(v3, "executeUpdateStatement:error:", v5, 0);
    v10 = objc_alloc(MEMORY[0x1E0D1F058]);
    objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTable:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("ROWID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "globalMessageID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "equalTo:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWhereClause:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("message_id"));

    v61 = 0;
    LOBYTE(v16) = objc_msgSend(v3, "executeUpdateStatement:error:", v12, &v61);
    v17 = v61;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      objc_msgSend(v17, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
      {
        v20 = objc_msgSend(v18, "code") == 19;

        if (v20)
        {
          objc_msgSend(v18, "userInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE18]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "integerValue");

          if (v23 == 2067)
          {
            v64 = 0;
            v65 = &v64;
            v66 = 0x2020000000;
            v67 = 0;
            objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT ROWID FROM message_global_data WHERE message_id = ?"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_2;
            v60[3] = &unk_1E4E8A268;
            v60[4] = &v64;
            objc_msgSend(v54, "executeWithIndexedBindings:usingBlock:error:", v25, v60, 0);

            if (!v65[3])
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), CFSTR("MailMessageLibrary.m"), 2709, CFSTR("Got a confict trying to set global message ID %llu, but couldn't find conflicting row"), v4);

            }
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "globalMessageID");
            objc_msgSend(*(id *)(a1 + 48), "setGlobalMessageID:", v65[3]);
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));

            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("ROWID"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "libraryID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "equalTo:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setWhereClause:", v29);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v65[3]);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("global_message_id"));

            objc_msgSend(v3, "executeUpdateStatement:error:", v26, 0);
            v31 = objc_alloc(MEMORY[0x1E0D1EFE0]);
            objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFC0]), "initWithName:", CFSTR("ROWID"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "equalTo:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v31, "initWithTable:where:", v53, v34);

            objc_msgSend(v3, "executeDeleteStatement:error:", v35, 0);
            _Block_object_dispose(&v64, 8);
            v12 = v26;
          }
        }
      }
      else
      {

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setMessageIDHash:", v4);

  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT message_id FROM messages WHERE rowid = ?"));
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = (sqlite3_stmt *)objc_msgSend(v36, "compiled");

    if (v37)
    {
      sqlite3_bind_int64(v37, 1, objc_msgSend(*(id *)(a1 + 48), "libraryID"));
      if (sqlite3_step(v37) == 100)
        v4 = sqlite3_column_int64(v37, 0);
      else
        v4 = 0;
      sqlite3_reset(v37);
      objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("pulling out the faked message-id"));
    }
    else
    {
      v4 = 0;
    }
  }
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v59 = 0;
  v39 = objc_alloc_init(MFMessageReferenceContext);
  -[MFMessageReferenceContext setMessage:](v39, "setMessage:", *(_QWORD *)(a1 + 48));
  -[MFMessageReferenceContext setLibraryID:](v39, "setLibraryID:", objc_msgSend(*(id *)(a1 + 48), "libraryID"));
  -[MFMessageReferenceContext setMessageIDHash:](v39, "setMessageIDHash:", v4);
  objc_msgSend(*(id *)(a1 + 48), "subject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageReferenceContext setSubject:](v39, "setSubject:", v40);

  -[MFMessageReferenceContext setReferences:](v39, "setReferences:", *(_QWORD *)(a1 + 64));
  -[MFMessageReferenceContext setMessageIDsBySubject:](v39, "setMessageIDsBySubject:", v38);
  -[MFMessageReferenceContext setMailboxID:](v39, "setMailboxID:", objc_msgSend(*(id *)(a1 + 48), "mailboxID"));
  -[MFMessageReferenceContext setConversationFlagsRef:](v39, "setConversationFlagsRef:", &v59);
  objc_msgSend(*(id *)(a1 + 48), "senders");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageReferenceContext setSenderList:](v39, "setSenderList:", v41);

  objc_msgSend(*(id *)(a1 + 48), "to");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageReferenceContext setToList:](v39, "setToList:", v42);

  objc_msgSend(*(id *)(a1 + 48), "cc");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageReferenceContext setCcList:](v39, "setCcList:", v43);

  objc_msgSend(*(id *)(a1 + 48), "bcc");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageReferenceContext setBccList:](v39, "setBccList:", v44);

  objc_msgSend(*(id *)(a1 + 48), "dateSentAsTimeIntervalSince1970");
  -[MFMessageReferenceContext setDateSentInterval:](v39, "setDateSentInterval:");
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_3;
  v55[3] = &unk_1E4E8A2B8;
  v45 = *(_QWORD *)(a1 + 40);
  v46 = *(void **)(a1 + 56);
  v56 = *(id *)(a1 + 48);
  v57 = v4;
  v58 = v59;
  v47 = objc_msgSend(v46, "addReferenceForContext:usingDatabaseConnection:generationWindow:mergeHandler:", v39, v3, v45, v55);
  if (objc_msgSend(*(id *)(a1 + 48), "conversationID") != v47)
  {
    MFLogGeneral();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_2((uint64_t)&v64, objc_msgSend(*(id *)(a1 + 48), "conversationID"), v47, v48);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), CFSTR("MailMessageLibrary.m"), 2767, CFSTR("The message didn't get updated"));

  }
  if (!v47)
  {
    MFLogGeneral();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_1((uint64_t)v62, objc_msgSend(*(id *)(a1 + 48), "libraryID"), v50);

  }
  return 1;
}

void __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

uint64_t __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "conversationID");
  if (result == a2)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 134218496;
      v10 = v8;
      v11 = 2048;
      v12 = a2;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Threading %lld: updating message's conversationID from %lld to %lld", (uint8_t *)&v9, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setConversationID:", a3);
    return objc_msgSend(*(id *)(a1 + 32), "setConversationFlags:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

void __95__MFMailMessageLibrary__iterateStatement_connection_withProgressMonitor_andRowHandler_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldCancel") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    v6 = (*(uint64_t (**)(id, _QWORD, _QWORD, _QWORD))(a1 + 72))(v7, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    *a4 = v6 ^ 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6 ^ 1;
  }

}

- (void)iterateStatement:(sqlite3_stmt *)a3 connection:(id)a4 withProgressMonitor:(id)a5 andRowHandler:(void *)a6 context:(void *)a7
{
  id v11;
  id v12;
  sqlite3 *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  sqlite3 *v18;
  id v19;

  v11 = a4;
  v12 = a5;
  v13 = (sqlite3 *)objc_msgSend(v11, "sqlDB");
  v18 = v13;
  v14 = v12;
  v19 = v14;
  sqlite3_progress_handler(v13, 200, (int (__cdecl *)(void *))progressHandler, &v18);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    if (sqlite3_step(a3) != 100)
      break;
    v16 = (void *)MEMORY[0x1A85B0E24]();
    v17 = objc_msgSend(v15, "shouldCancel");
    if ((v17 & 1) == 0)
      ((void (*)(sqlite3_stmt *, void *))a6)(a3, a7);
    objc_autoreleasePoolPop(v16);
  }
  while (!v17);
  sqlite3_progress_handler(v13, 0, 0, 0);
  sqlite3_reset(a3);
  if ((objc_msgSend(v14, "shouldCancel") & 1) == 0)
    objc_msgSend(v11, "checkForConnectionErrorWithMessage:", CFSTR("loading messages"));

}

- (id)messagesForMailbox:(id)a3 limit:(unint64_t)a4
{
  -[MFMailMessageLibrary _messagesForMailbox:olderThanNumberOfDays:limit:](self, "_messagesForMailbox:olderThanNumberOfDays:limit:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rangesOfIndexedUIDsInRange:(_NSRange)a3 forMailbox:(id)a4 limit:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  int64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  int64_t v20;
  int64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = -[MFMailMessageLibrary mailboxIDForURLString:](self, "mailboxIDForURLString:", v9);
  if (v10 == *MEMORY[0x1E0D1DC08])
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    -[MFMailMessageLibrary database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary rangesOfIndexedUIDsInRange:forMailbox:limit:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_forMailbox_limit___block_invoke;
    v17[3] = &unk_1E4E8A330;
    v20 = v10;
    v21 = a5;
    v22 = location;
    v23 = length;
    v15 = v12;
    v18 = v15;
    v19 = &v24;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v17);

    v11 = -[MFMailMessageLibraryIndexedUIDRangesAndMessageCount initWithRanges:messageCount:]([MFMailMessageLibraryIndexedUIDRangesAndMessageCount alloc], v15, v25[3]);
    _Block_object_dispose(&v24, 8);

  }
  return v11;
}

uint64_t __68__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_forMailbox_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[4];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x1E0C80C00];
  v17 = a2;
  objc_msgSend(v17, "preparedStatementForQueryString:", CFSTR(" WITH index_status AS(  SELECT server_messages.remote_id,     (NOT(      messages.searchable_message IS NULL    )) as done_indexing   FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message   WHERE messages.mailbox == :mailbox     AND server_messages.remote_id >= :min_uid     AND server_messages.remote_id <= :max_uid), marked AS(  SELECT *,          (done_indexing AND           (done_indexing != LAG(done_indexing) OVER (ORDER BY remote_id DESC) OR            LAG(done_indexing) OVER (ORDER BY remote_id DESC) IS NULL)) as is_start,          (done_indexing AND           (done_indexing != LEAD(done_indexing) OVER (ORDER BY remote_id DESC) OR            LEAD(done_indexing) OVER (ORDER BY remote_id DESC) IS NULL)) as is_end   FROM index_status), ranges AS(  SELECT *,          SUM(is_start) OVER (ORDER BY remote_id DESC) as group_id   FROM marked) SELECT MIN(remote_id), MAX(remote_id), count(), done_indexing   FROM ranges   GROUP BY group_id   ORDER BY MIN(remote_id) DESC   LIMIT :limit;"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preparedStatementForQueryString:", CFSTR("SELECT COUNT(*)  FROM server_messages WHERE server_messages.mailbox == :mailbox   AND remote_id IS NOT NULL   AND remote_id >= :min_uid   AND remote_id <= :max_uid;"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR(":mailbox");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v3;
  v28[1] = CFSTR(":limit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v4;
  v28[2] = CFSTR(":min_uid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v5;
  v28[3] = CFSTR(":max_uid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = CFSTR(":mailbox");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v26[1] = CFSTR(":min_uid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v8;
  v26[2] = CFSTR(":max_uid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __68__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_forMailbox_limit___block_invoke_2;
  v24[3] = &unk_1E4E8A048;
  v25 = *(id *)(a1 + 32);
  v23 = 0;
  LODWORD(v8) = objc_msgSend(v20, "executeWithNamedBindings:usingBlock:error:", v19, v24, &v23);
  v12 = v23;
  v13 = v12;
  if ((_DWORD)v8)
  {
    v21 = v12;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __68__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_forMailbox_limit___block_invoke_3;
    v22[3] = &unk_1E4E8A268;
    v22[4] = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(v18, "executeWithNamedBindings:usingBlock:error:", v10, v22, &v21);
    v15 = v21;

    v13 = v15;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __68__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_forMailbox_limit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  int64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int32x2_t v18;
  int v19;
  char v20;
  __int16 v21;
  char v22;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64Value");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "int64Value");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "int64Value");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12.i64[0] = v5;
  v12.i64[1] = v7;
  v13.i64[0] = 0xFFFFFFFFLL;
  v13.i64[1] = 0xFFFFFFFFLL;
  v14 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  v15 = 0xFFFFFFFFLL;
  if (v9 < 0xFFFFFFFFLL)
    v15 = v9;
  v16 = *(void **)(a1 + 32);
  v18 = vmovn_s64((int64x2_t)vandq_s8((int8x16_t)v14, (int8x16_t)vcgtzq_s64(v14)));
  v19 = v15 & ~(v15 >> 63);
  v20 = v11;
  v21 = -21846;
  v22 = -86;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v18, "{?=IIIB}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

}

void __68__MFMailMessageLibrary_rangesOfIndexedUIDsInRange_forMailbox_limit___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64Value");

}

- (id)newestUIDsForMailbox:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__MFMailMessageLibrary_newestUIDsForMailbox_limit___block_invoke;
  v10[3] = &unk_1E4E8A358;
  v10[4] = v7;
  -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:block:](self, "_enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:block:", v6, v8, a4, v10);

  return v7;
}

uint64_t __51__MFMailMessageLibrary_newestUIDsForMailbox_limit___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v2 = a2[2];
  v6[0] = a2[1];
  v6[1] = *a2;
  v6[2] = v2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v6, "{?=qIIq}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

- (id)newestUIDsMissingBodyDataForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 limit:(int64_t)a6 maximumMessagesToScan:(int64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  MFMessagesMissingBodyData *v19;
  _QWORD *v20;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t *v31;
  _QWORD *v32;
  int64_t v33;
  _QWORD v34[4];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v12 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURLString:](MailAccount, "accountWithURLString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary messageBasePathForAccount:](self, "messageBasePathForAccount:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsPurge");
  objc_msgSend(MEMORY[0x1E0D1EB20], "rootMessageDataDirectoryForBasePath:purgeable:", v22, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByResolvingSymlinksInPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = a7;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __107__MFMailMessageLibrary_newestUIDsMissingBodyDataForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke;
  v26[3] = &unk_1E4E8A380;
  v18 = v17;
  v27 = v18;
  v28 = v24;
  v29 = v13;
  v30 = v25;
  v31 = &v35;
  v32 = v34;
  v33 = a6;
  -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:](self, "_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:", v12, v23, a5, 1, v26);
  v19 = [MFMessagesMissingBodyData alloc];
  v20 = -[MFMessagesMissingBodyData initWithMessagesMissingBodyData:messagesNotMissingBodyData:fragmentedMessages:messagesScannedInFilesystemCount:](v19, v25, v24, v13, v36[3]);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

BOOL __107__MFMailMessageLibrary_newestUIDsMissingBodyDataForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke(uint64_t a1, unsigned int *a2)
{
  void *v4;
  id v5;
  int v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v14[3];

  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:rootMessageDataDirectory:", *((_QWORD *)a2 + 1), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("full.emlx"), 0, v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = access((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("partial.emlx"), 0, v4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = access((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);

    if (v8)
    {
      v9 = *((_QWORD *)a2 + 2);
      v14[0] = *((_QWORD *)a2 + 1);
      v14[1] = *(_QWORD *)a2;
      v14[2] = v9;
      v10 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v14, "{?=qIIq}");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", *a2);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", *a2);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v12 = (uint64_t)--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) >= 1
     && (unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") < *(_QWORD *)(a1 + 80);

  return v12;
}

- (id)newestUIDsMissingPartsForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 limit:(int64_t)a6 maximumMessagesToScan:(int64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  MFMessagesMissingParts *v19;
  id *v20;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  _QWORD *v31;
  int64_t v32;
  _QWORD v33[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v12 = a3;
  v23 = a4;
  v24 = v12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURLString:](MailAccount, "accountWithURLString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary messageBasePathForAccount:](self, "messageBasePathForAccount:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsPurge");
  objc_msgSend(MEMORY[0x1E0D1EB20], "rootMessageDataDirectoryForBasePath:purgeable:", v22, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByResolvingSymlinksInPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = a7;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke;
  v26[3] = &unk_1E4E8A3D0;
  v18 = v17;
  v27 = v18;
  v28 = v13;
  v29 = v25;
  v30 = &v34;
  v31 = v33;
  v32 = a6;
  -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:](self, "_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:", v24, v23, a5, 2, v26);
  v19 = [MFMessagesMissingParts alloc];
  v20 = -[MFMessagesMissingParts initWithFragmentedMessages:nonFragmentedMessages:messagesScannedInFilesystemCount:]((id *)&v19->super.isa, v25, v13, (void *)v35[3]);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

BOOL __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke(uint64_t a1, unsigned int *a2)
{
  id v2;
  int v3;
  id v4;
  _QWORD *v5;
  int v6;
  __int128 v7;
  int v8;
  int v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  MFFragmentedMessage *v26;
  void *v27;
  void *v28;
  id *v29;
  _BOOL8 v30;
  id v33;
  void *v35;
  _QWORD v36[2];
  void (*v37)(_QWORD *, void *);
  void *v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:rootMessageDataDirectory:", *((_QWORD *)a2 + 1), *(_QWORD *)(a1 + 32));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("full.emlx"), 0, v35);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = access((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0);

  if (v3)
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__6;
    v52 = __Block_byref_object_dispose__6;
    v53 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__6;
    v46 = __Block_byref_object_dispose__6;
    v47 = 0;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v37 = __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_2;
    v38 = &unk_1E4E8A3A8;
    v40 = &v42;
    v39 = v35;
    v41 = &v48;
    v4 = v39;
    v5 = v36;
    v33 = objc_retainAutorelease(v4);
    v6 = open((const char *)objc_msgSend(v33, "fileSystemRepresentation"), 0, 0);
    if ((v6 & 0x80000000) == 0)
    {
      while (1)
      {
        v55 = 0;
        v54 = xmmword_1A5999558;
        *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v70 = v7;
        v71 = v7;
        v68 = v7;
        v69 = v7;
        v66 = v7;
        v67 = v7;
        v64 = v7;
        v65 = v7;
        v62 = v7;
        v63 = v7;
        v60 = v7;
        v61 = v7;
        v58 = v7;
        v59 = v7;
        v56 = v7;
        v57 = v7;
        v8 = getattrlistbulk(v6, &v54, &v56, 0x100uLL, 0);
        v9 = v8;
        if (v8 == -1)
          break;
        if (!v8)
          goto LABEL_18;
        if (v8 >= 1)
        {
          v10 = &v56;
          do
          {
            v11 = *(unsigned int *)v10;
            if ((*((_BYTE *)v10 + 4) & 1) != 0)
            {
              v12 = *((unsigned int *)v10 + 7);
              if (v12 >= 2)
              {
                v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", (char *)v10 + *((int *)v10 + 6) + 24, v12 - 1, 4);
                if (v13)
                  v37(v5, v13);

              }
            }
            v10 = (__int128 *)((char *)v10 + v11);
            --v9;
          }
          while (v9);
        }
      }
      v15 = *__error();
      EDLibraryLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);

LABEL_18:
      close(v6);
    }

    if (v43[5])
    {
      v23 = *(_QWORD *)a2;
      v25 = *((_QWORD *)a2 + 1);
      v24 = *((_QWORD *)a2 + 2);
      v26 = [MFFragmentedMessage alloc];
      v27 = (void *)v43[5];
      v28 = (void *)v49[5];
      *(_QWORD *)&v56 = v25;
      *((_QWORD *)&v56 + 1) = v23;
      *(_QWORD *)&v57 = v24;
      v29 = -[MFFragmentedMessage initWithUIDAndSize:mainFile:existingParts:]((id *)&v26->super.isa, &v56, v27, v28);
      if (v29)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);

    }
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(&v48, 8);
    v14 = a1;
  }
  else
  {
    v14 = a1;
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", *a2);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 56) + 8) + 24);
  v30 = (uint64_t)--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 64) + 8) + 24) >= 1
     && (unint64_t)objc_msgSend(*(id *)(v14 + 48), "count") < *(_QWORD *)(v14 + 72);

  return v30;
}

void __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("partial.emlx")))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v10, 0, a1[4]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    mimePartFromFilename(v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (v6)
      {
        objc_msgSend(v6, "addObject:", v5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1[6] + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

      }
    }
  }

}

- (void)_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 kind:(unint64_t)a6 block:(id)a7
{
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  void *v21;
  uint64_t (*v22)(_QWORD *, _BYTE *);
  __int128 v23;
  char v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  void *v29;
  double v30;
  double v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  void *v36;
  int64_t v37;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE buf[24];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v41 = a4;
  v10 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 > 1023)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 24576);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v35, "mutableBytes");
    v37 = a5;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v14 = (void *)MEMORY[0x1A85B0E24]();
      v45[3] = 0;
      v15 = (void *)objc_msgSend(v41, "mutableCopy");
      objc_msgSend(v15, "addIndexes:", v12);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __111__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox_excluding_inLatest_kind_block___block_invoke;
      v43[3] = &unk_1E4E8A3F8;
      v43[4] = &v44;
      v43[5] = v11;
      v16 = -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:](self, "_enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:", v40, v15, v37, v13, 1024, a6, v43);
      if (v45[3])
      {
        v17 = 0;
        v18 = v11;
        while (1)
        {
          v19 = v45;
          v20 = v45[3];
          if (v17 >= v20)
            break;
          v21 = (void *)MEMORY[0x1A85B0E24](v16);
          v22 = (uint64_t (*)(_QWORD *, _BYTE *))v10[2];
          v23 = *(_OWORD *)v18;
          *(_QWORD *)&buf[16] = *(_QWORD *)(v18 + 16);
          *(_OWORD *)buf = v23;
          v24 = v22(v10, buf);
          objc_autoreleasePoolPop(v21);
          ++v17;
          v18 += 24;
          if ((v24 & 1) == 0)
          {
            v25 = 0;
            v42 += v17;
            goto LABEL_18;
          }
        }
        v26 = *(_QWORD *)(v11 + 24 * v20 - 8);
        if (v26 != v13)
        {
          objc_msgSend(v12, "removeAllIndexes");
          v19 = v45;
          v20 = v45[3];
        }
        v42 += v17;
        if (v20)
        {
          v27 = 0;
          v28 = (_QWORD *)(v11 + 16);
          do
          {
            if (*v28 == v26)
            {
              objc_msgSend(v12, "addIndex:", *((unsigned int *)v28 - 4));
              v19 = v45;
            }
            ++v27;
            v28 += 3;
          }
          while (v27 < v19[3]);
        }
        v25 = 1;
        v13 = v26;
      }
      else
      {
        v25 = 0;
      }
LABEL_18:

      objc_autoreleasePoolPop(v14);
    }
    while ((v25 & 1) != 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceDate:", v36);
    v31 = v30;

    if (v31 > 20.0)
    {
      EDLibraryLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:].cold.1();
      goto LABEL_28;
    }
    if (v31 <= 2.0)
    {
      EDLibraryLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v42;
        v33 = v32;
        v34 = OS_LOG_TYPE_INFO;
        goto LABEL_27;
      }
    }
    else
    {
      EDLibraryLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v42;
        v33 = v32;
        v34 = OS_LOG_TYPE_DEFAULT;
LABEL_27:
        _os_log_impl(&dword_1A4F90000, v33, v34, "_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox took %.3g s (%zi iterations)", buf, 0x16u);
      }
    }
LABEL_28:

    _Block_object_dispose(&v44, 8);
    goto LABEL_29;
  }
  -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:](self, "_enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:", v40, v41, a5, 0x7FFFFFFFFFFFFFFFLL, -1, a6, v10);
LABEL_29:

}

BOOL __111__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox_excluding_inLatest_kind_block___block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v3;

  v2 = *(_QWORD *)(a1 + 40) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *a2;
  *(_QWORD *)(v2 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)v2 = v3;
  return ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < 0x400uLL;
}

- (void)_enumerateMessageRemoteIDAndGlobalForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 block:(id)a6
{
  -[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:](self, "_enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:", a3, a4, a5, 0x7FFFFFFFFFFFFFFFLL, -1, 0, a6);
}

- (void)_enumerateMessageRemoteIDAndGlobalForMailbox:(id)a3 excluding:(id)a4 inLatest:(int64_t)a5 dateReceivedMax:(int64_t)a6 limit:(unint64_t)a7 kind:(unint64_t)a8 block:(id)a9
{
  id v15;
  id v16;
  int64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;

  v20 = a3;
  v15 = a4;
  v16 = a9;
  v17 = -[MFMailMessageLibrary mailboxIDForURLString:](self, "mailboxIDForURLString:", v20);
  if (v17 != *MEMORY[0x1E0D1DC08])
  {
    -[MFMailMessageLibrary database](self, "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _enumerateMessageRemoteIDAndGlobalForMailbox:excluding:inLatest:dateReceivedMax:limit:kind:block:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke;
    v21[3] = &unk_1E4E8A498;
    v22 = v15;
    v24 = a6;
    v25 = a8;
    v26 = a5;
    v27 = v17;
    v28 = a7;
    v23 = v16;
    objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v21);

  }
}

uint64_t __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85B0E24]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_2;
  v28[3] = &unk_1E4E8A420;
  v9 = v5;
  v29 = v9;
  v10 = v6;
  v30 = v10;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v28);
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_3;
  v26[3] = &unk_1E4E8A448;
  v11 = (id)objc_msgSend(CFSTR("0"), "mutableCopy");
  v27 = v11;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v26);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("server_messages.remote_id NOT IN (%@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  if (*(_QWORD *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" messages.date_received <= %llu"), *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  objc_msgSend(v10, "addObject:", CFSTR("messages.deleted = '0'"));
  v14 = *(_QWORD *)(a1 + 56);
  if (v14 == 2)
  {
    objc_msgSend(v10, "addObject:", CFSTR("(  messages.searchable_message IS NULL OR   messages.global_message_id IN   (SELECT global_message_id    FROM message_attachments LEFT OUTER    JOIN searchable_attachments       ON(message_attachments.rowid = searchable_attachments.attachment_id)    WHERE searchable_attachments.attachment_id IS NULL           AND message_attachments.attachment IS NOT NULL  ))"));
  }
  else if (v14 == 1)
  {
    objc_msgSend(v10, "addObject:", CFSTR("messages.searchable_message IS NULL"));
  }
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" AND "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 64) == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT messages.global_message_id, server_messages.remote_id, messages.size, messages.date_received FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message WHERE messages.mailbox == %llu AND %@ ORDER BY messages.date_received DESC"), *(_QWORD *)(a1 + 72), v15);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT messages.global_message_id, server_messages.remote_id, messages.size, messages.date_received FROM messages INNER JOIN server_messages ON messages.ROWID = server_messages.message WHERE messages.rowid IN (SELECT rowid FROM messages WHERE mailbox == %llu ORDER BY date_received DESC LIMIT %llu) AND %@ ORDER BY messages.date_received DESC"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (*(_QWORD *)(a1 + 80) != -1)
  {
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" LIMIT %llu"), *(_QWORD *)(a1 + 80));
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  objc_msgSend(v3, "preparedStatementForQueryString:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_4;
  v24[3] = &unk_1E4E8A470;
  v25 = *(id *)(a1 + 40);
  v23 = 0;
  objc_msgSend(v19, "executeUsingBlock:error:", v24, &v23);
  v20 = v23;
  if (v20)
  {
    EDLibraryLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_cold_1();

  }
  return 1;
}

void __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  id v7;

  if (a3 >= 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(server_messages.remote_id < %llu OR %llu <= server_messages.remote_id)"), a2, a2 + a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:");

  }
}

uint64_t __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(",%llu"), a2);
}

void __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "int64Value");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "int64Value");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "int64Value");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "int64Value");

  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFE)
  {
    v15 = 0xFFFFFFFFLL;
    if (v12 < 0xFFFFFFFFLL)
      v15 = v12;
    v16 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    v17 = v10;
    v18 = v15 & ~(v15 >> 63);
    v19 = v8;
    v20 = v14;
    if ((v16() & 1) == 0)
      *a4 = 1;
  }

}

- (id)messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4
{
  -[MFMailMessageLibrary _messagesForMailbox:olderThanNumberOfDays:limit:](self, "_messagesForMailbox:olderThanNumberOfDays:limit:", a3, *(_QWORD *)&a4, 0x7FFFFFFFFFFFFFFFLL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messagesForMailbox:(id)a3 olderThanNumberOfDays:(int)a4 limit:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  MFMessageCriterion *v11;
  void *v12;
  MFMessageCriterion *v13;
  void *v14;
  _MFMessageCollector *v15;
  void *v16;
  _QWORD v18[3];

  v6 = *(_QWORD *)&a4;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((int)v6 >= 1)
  {
    v11 = [MFMessageCriterion alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MFMessageCriterion initWithType:qualifier:expression:](v11, "initWithType:qualifier:expression:", 11, 6, v12);

    -[MFMessageCriterion setDateUnits:](v13, "setDateUnits:", 1);
    -[MFMessageCriterion setDateIsRelative:](v13, "setDateIsRelative:", 1);
    v18[0] = v9;
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:", v10, v15, 0, 16, 0, a5);
  -[_MFMessageCollector messages](v15, "messages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)serverSearchResultMessagesForMailbox:(id)a3
{
  id v4;
  void *v5;
  MFMessageCriterion *v6;
  void *v7;
  void *v8;
  _MFMessageCollector *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 27, 3, CFSTR("MessageIsServerSearchResult"));
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:](self, "sendMessagesMatchingCriterion:to:options:baseTable:", v8, v9, 0, 16);
  -[_MFMessageCollector messages](v9, "messages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dateOfOldestNonIndexedNonSearchResultMessageInMailbox:(id)a3
{
  -[MFMailMessageLibrary _firstDateForQuery:inMailbox:](self, "_firstDateForQuery:inMailbox:", CFSTR("SELECT date_received FROM messages JOIN searchable_messages ON messages.ROWID = searchable_messages.message_id WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND flags & 128 = 0 AND searchable_messages.transaction_id != 0 ORDER BY date_received ASC LIMIT 1"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)countMessagesMatchingCriterion:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[MFMailMessageLibrary groupedMessagesCountForCriterion:groupBy:](self, "groupedMessagesCountForCriterion:groupBy:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", &stru_1E4F1C8F8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)groupedMessagesCountForCriterion:(id)a3 groupBy:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  MFMailMessageLibrary *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary groupedMessagesCountForCriterion:groupBy:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke;
  v12[3] = &unk_1E4E8A510;
  v9 = v6;
  v13 = v9;
  v14 = self;
  v15 = &v17;
  v16 = a4;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v12);

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  unsigned int v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  _QWORD v25[6];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = addOptionsForCriterion(0x10000u, *(void **)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 56);
  v6 = CFSTR("SELECT mailboxes.url, COUNT(DISTINCT(messages.message_id)) %@ GROUP BY 1;");
  if (v5 == 1)
    v7 = 16;
  else
    v7 = 0;
  if (v5 != 1)
    v6 = 0;
  if (v5)
    v8 = v7;
  else
    v8 = 0;
  if (v5)
    v9 = v6;
  else
    v9 = CFSTR("SELECT COUNT() %@;");
  objc_msgSend(*(id *)(a1 + 40), "queryForCriterion:connection:options:baseTable:isSubquery:", *(_QWORD *)(a1 + 32), v3, v4, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preparedStatementForQueryString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowedExecutionTime:", 0.05);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v24 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke_2;
    v25[3] = &unk_1E4E8A4E8;
    v16 = *(_QWORD *)(a1 + 56);
    v25[4] = *(_QWORD *)(a1 + 48);
    v25[5] = v16;
    objc_msgSend(v12, "executeUsingBlock:error:", v25, &v24);
    v17 = v24;
    if (v17)
    {
      EDLibraryLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_cold_1();

    }
  }
  else
  {
    v19 = objc_msgSend(*(id *)(a1 + 40), "isProtectedDataAvailable:", v3);
    EDLibraryLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(*(id *)(a1 + 32), "criterionType");
      v22 = objc_msgSend(v3, "sqlDB");
      v23 = CFSTR("not attached");
      *(_DWORD *)buf = 134218498;
      v27 = v21;
      if (v19)
        v23 = CFSTR("attached");
      v28 = 2048;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_error_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_ERROR, "criterion %ld couldn't be turned into a query, <db:%p, protected %@>", buf, 0x20u);
    }
  }

  return 1;
}

void __65__MFMailMessageLibrary_groupedMessagesCountForCriterion_groupBy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v7, v5);

  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v6, &stru_1E4F1C8F8);
  }

}

- (id)messagesWithSummariesForMailbox:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _MFMessageCollector *v8;
  void *v9;
  void *v10;
  id v11;
  _MFMessageCollector *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  MFMailMessageLibrary *v17;
  _MFMessageCollector *v18;
  NSUInteger v19;
  NSUInteger v20;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary messagesWithSummariesForMailbox:range:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__MFMailMessageLibrary_messagesWithSummariesForMailbox_range___block_invoke;
  v15[3] = &unk_1E4E8A538;
  v11 = v7;
  v19 = location;
  v20 = length;
  v16 = v11;
  v17 = self;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  -[_MFMessageCollector messages](v12, "messages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __62__MFMailMessageLibrary_messagesWithSummariesForMailbox_range___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  sqlite3_stmt *v6;
  int v7;
  int v8;
  void *v9;
  id v10;
  sqlite3_stmt *v11;
  uint64_t v12;

  v3 = a2;
  v4 = mach_absolute_time();
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO temp_selected_messages SELECT rowid FROM messages WHERE mailbox = ifnull((SELECT rowid FROM mailboxes WHERE url = :url), -1) AND deleted = '0' ORDER BY date_received DESC, ROWID DESC LIMIT :limit OFFSET :offset;"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");

  LODWORD(v5) = sqlite3_bind_parameter_index(v6, ":url");
  sqlite3_bind_text(v6, (int)v5, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
  v7 = sqlite3_bind_parameter_index(v6, ":limit");
  sqlite3_bind_int(v6, v7, *(_DWORD *)(a1 + 64));
  v8 = sqlite3_bind_parameter_index(v6, ":offset");
  sqlite3_bind_int(v6, v8, *(_DWORD *)(a1 + 56));
  LODWORD(v5) = sqlite3_step(v6);
  sqlite3_reset(v6);
  if ((_DWORD)v5 == 101)
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT messages.ROWID, remote_id, date_received, date_sent, display_date, flags, size, messages.subject_prefix, subjects.subject, sender.comment AS sender_comment, sender.address AS sender_address, mailbox, original_mailbox, content_type, summaries.summary, encoding FROM temp_selected_messages AS selection LEFT OUTER JOIN messages ON selection.message_id = messages.rowid LEFT OUTER JOIN addresses AS sender ON messages.sender = sender.ROWID LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID LEFT OUTER JOIN summaries ON messages.summary = summaries.ROWID;"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_sendMessagesForStatement:connection:to:options:timestamp:", v9, v3, *(_QWORD *)(a1 + 48), 6297663, v4);

  }
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM temp_selected_messages;"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (sqlite3_stmt *)objc_msgSend(v10, "compiled");

  sqlite3_step(v11);
  sqlite3_reset(v11);
  v12 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("messagesWithSummariesForMailbox"));

  return v12;
}

- (id)orderedBatchOfMessagesEndingAtRowId:(int64_t)a3 limit:(unsigned int)a4 success:(BOOL *)a5
{
  _MFMessageCollector *v9;
  void *v10;
  void *v11;
  _MFMessageCollector *v12;
  void *v13;
  _QWORD v15[5];
  _MFMessageCollector *v16;
  int64_t v17;
  BOOL *v18;
  unsigned int v19;

  v9 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary orderedBatchOfMessagesEndingAtRowId:limit:success:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__MFMailMessageLibrary_orderedBatchOfMessagesEndingAtRowId_limit_success___block_invoke;
  v15[3] = &unk_1E4E8A560;
  v19 = a4;
  v17 = a3;
  v15[4] = self;
  v12 = v9;
  v16 = v12;
  v18 = a5;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v15);

  -[_MFMessageCollector messages](v12, "messages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __74__MFMailMessageLibrary_orderedBatchOfMessagesEndingAtRowId_limit_success___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  sqlite3_stmt *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  sqlite3_stmt *v13;
  uint64_t v14;

  v3 = a2;
  v4 = mach_absolute_time();
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT INTO temp_selected_messages SELECT rowid FROM messages WHERE rowid >= 0 AND rowid <= :maxRowId ORDER BY rowid DESC LIMIT :limit;"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");

  v7 = sqlite3_bind_parameter_index(v6, ":maxRowId");
  sqlite3_bind_int64(v6, v7, *(_QWORD *)(a1 + 48));
  v8 = sqlite3_bind_parameter_index(v6, ":limit");
  sqlite3_bind_int(v6, v8, *(_DWORD *)(a1 + 64));
  LODWORD(v5) = sqlite3_step(v6);
  sqlite3_reset(v6);
  if ((_DWORD)v5 == 101)
  {
    objc_msgSend(*(id *)(a1 + 32), "_selectExpressionForMessageWithAvailableTables:", 544);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(" FROM temp_selected_messages AS selection LEFT OUTER JOIN messages ON selection.message_id = messages.rowid LEFT OUTER JOIN addresses AS sender ON messages.sender = sender.ROWID LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID;"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preparedStatementForQueryString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendMessagesForStatement:connection:to:options:timestamp:", v11, v3, *(_QWORD *)(a1 + 40), 6297663, v4);

  }
  if (*(_QWORD *)(a1 + 56))
    **(_BYTE **)(a1 + 56) = sqlite3_errcode((sqlite3 *)objc_msgSend(v3, "sqlDB")) == 0;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM temp_selected_messages;"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (sqlite3_stmt *)objc_msgSend(v12, "compiled");

  sqlite3_step(v13);
  sqlite3_reset(v13);
  v14 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("orderedBatchOfMessagesEndingAtRowId"));

  return v14;
}

- (id)_queryForMailboxesIDsFromMailboxes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_816);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" OR "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ROWID FROM mailboxes WHERE %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __59__MFMailMessageLibrary__queryForMailboxesIDsFromMailboxes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char *v3;
  void *v4;

  v2 = objc_retainAutorelease(a2);
  v3 = sqlite3_mprintf("url = %Q", objc_msgSend(v2, "UTF8String"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_free(v3);

  return v4;
}

- (unsigned)unreadCountForMailbox:(id)a3
{
  int v3;

  v3 = -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", CFSTR("SELECT unread_count FROM mailboxes WHERE url = ?"), a3);
  return v3 & ~(v3 >> 31);
}

- (unsigned)attachmentCountForMailboxes:(id)a3
{
  void *v4;
  void *v5;

  -[MFMailMessageLibrary _queryForMailboxesIDsFromMailboxes:](self, "_queryForMailboxesIDsFromMailboxes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(DISTINCT(message_id)) FROM messages WHERE (((flags&(63<<10))>>10) BETWEEN 1 AND 62) AND mailbox IN (%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", v5, 0);
  return v4;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3 includeServerSearchResults:(BOOL)a4 includeThreadSearchResults:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  _QWORD v22[3];

  v5 = a5;
  v6 = a4;
  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MFMailMessageLibrary countMessagesMatchingCriterion:](self, "countMessagesMatchingCriterion:", v12);

  v14 = !v6;
  if (!v6 || !v5)
  {
    if ((v14 | v5) == 1)
    {
      v15 = (v5 & v14) == 0;
      v16 = 128;
      if (v15)
        v16 = 0;
      v17 = 1048704;
      if (v5)
        v17 = 0;
      if (!v6 && !v5)
        v16 = v17;
    }
    else
    {
      v16 = 0x100000;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(messages.rowid) FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.rowid WHERE url = ? AND flags & %llu AND deleted = '0'"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", v18, v8);
    if (v13 <= v19)
      v20 = 0;
    else
      v20 = v19;

    LODWORD(v13) = v13 - v20;
  }

  return v13;
}

- (unsigned)nonDeletedCountForMailbox:(id)a3
{
  return -[MFMailMessageLibrary nonDeletedCountForMailbox:includeServerSearchResults:includeThreadSearchResults:](self, "nonDeletedCountForMailbox:includeServerSearchResults:includeThreadSearchResults:", a3, 1, 1);
}

- (unsigned)totalCountForMailbox:(id)a3
{
  void *v4;

  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[MFMailMessageLibrary countMessagesMatchingCriterion:](self, "countMessagesMatchingCriterion:", v4);

  return self;
}

- (unint64_t)serverUnreadOnlyOnServerCountForMailbox:(id)a3
{
  return -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", CFSTR("SELECT server_unread_count FROM mailboxes WHERE url = ?"), a3);
}

- (void)setServerUnreadOnlyOnServerCount:(unint64_t)a3 forMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setServerUnreadOnlyOnServerCount:forMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __68__MFMailMessageLibrary_setServerUnreadOnlyOnServerCount_forMailbox___block_invoke;
  v19 = &unk_1E4E8A510;
  v10 = v7;
  v20 = v10;
  v23 = a3;
  v11 = v6;
  v21 = v11;
  v22 = &v24;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, &v16);

  if (*((_BYTE *)v25 + 24))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99E98]);
    v13 = (void *)objc_msgSend(v12, "initWithString:", v11, v16, v17, v18, v19, v20);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v13);
    -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "persistenceDidUpdateServerCount:forMailboxWithObjectID:generationWindow:", a3, v14, v10);

  }
  _Block_object_dispose(&v24, 8);

}

uint64_t __68__MFMailMessageLibrary_setServerUnreadOnlyOnServerCount_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE mailboxes SET server_unread_count = :count WHERE url = :url AND server_unread_count IS NOT :count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR(":count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR(":url");
  v21[0] = v5;
  v21[1] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = 0;
  v7 = objc_msgSend(v4, "executeWithNamedBindings:rowsChanged:error:", v6, &v15, &v14);
  v8 = v14;
  if (v15)
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    EDLibraryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Did update unread-only-on-server count to %llu for mailbox %@", buf, 0x16u);
    }

  }
  return v7;
}

- (void)setLastSyncAndMostRecentStatusCount:(int64_t)a3 forMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MFMailMessageLibrary *v17;
  id v18;
  int64_t v19;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setLastSyncAndMostRecentStatusCount:forMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__MFMailMessageLibrary_setLastSyncAndMostRecentStatusCount_forMailbox___block_invoke;
  v15[3] = &unk_1E4E8A5D0;
  v10 = v7;
  v16 = v10;
  v17 = self;
  v14 = v6;
  v18 = v14;
  v19 = a3;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v15);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v11);
  -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceDidUpdateLastSyncAndMostRecentStatusCount:forMailboxWithObjectID:generationWindow:", a3, v12, v10);

}

uint64_t __71__MFMailMessageLibrary_setLastSyncAndMostRecentStatusCount_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  sqlite3_int64 RowidForMailbox;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("mailboxes"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("last_sync_status_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("most_recent_status_count"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", RowidForMailbox);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "equalTo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhereClause:", v10);

  v11 = objc_msgSend(v3, "executeUpdateStatement:error:", v5, 0);
  return v11;
}

- (void)increaseProtectionOnFileForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "mf_protectFileAtPath:withClass:error:", v5, 2, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    MFLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "#Warning Error setting the protection class on \"%@\": %@", buf, 0x16u);
    }

  }
}

- (unint64_t)mostRecentStatusCountForMailbox:(id)a3
{
  return -[MFMailMessageLibrary _integerForQuery:withTextArgument:](self, "_integerForQuery:withTextArgument:", CFSTR("SELECT most_recent_status_count FROM mailboxes WHERE url = ?"), a3);
}

- (void)setMostRecentStatusCount:(unint64_t)a3 forMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MFMailMessageLibrary *v17;
  id v18;
  unint64_t v19;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setMostRecentStatusCount:forMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__MFMailMessageLibrary_setMostRecentStatusCount_forMailbox___block_invoke;
  v15[3] = &unk_1E4E8A5D0;
  v10 = v7;
  v16 = v10;
  v17 = self;
  v14 = v6;
  v18 = v14;
  v19 = a3;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v15);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v11);
  -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceDidUpdateMostRecentStatusCount:forMailboxWithObjectID:generationWindow:", a3, v12, v10);

}

BOOL __60__MFMailMessageLibrary_setMostRecentStatusCount_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  sqlite3_int64 RowidForMailbox;
  id v5;
  sqlite3_stmt *v6;
  int v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE mailboxes SET most_recent_status_count = ? WHERE rowid = ?"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");

  if (v6)
  {
    sqlite3_bind_int(v6, 1, *(_DWORD *)(a1 + 56));
    sqlite3_bind_int64(v6, 2, RowidForMailbox);
    v7 = sqlite3_step(v6);
    sqlite3_reset(v6);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("setting unseen count"));
    v8 = v7 == 101;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)messageWithRemoteID:(id)a3 inRemoteMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary messageWithRemoteID:inRemoteMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke;
  v14[3] = &unk_1E4E8A620;
  v14[4] = self;
  v10 = v7;
  v15 = v10;
  v11 = v6;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  char v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
  if (!sSharedInstance_block_invoke_sql)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "_selectClauseForOptions:protectedDataAvailable:", 0, v4);
    _MFLockGlobalLock();
    if (!sSharedInstance_block_invoke_sql)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ FROM messages WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND messages.remote_id = ? LIMIT 1"), v5);
      v7 = (void *)sSharedInstance_block_invoke_sql;
      sSharedInstance_block_invoke_sql = v6;

    }
    _MFUnlockGlobalLock();

  }
  objc_msgSend(v3, "preparedStatementForQueryString:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_2((uint64_t)v8, *(void **)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_2((uint64_t)v9, *(void **)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_3;
  v18[3] = &unk_1E4E8A5F8;
  v12 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 56);
  v18[4] = v12;
  v13 = v3;
  v19 = v13;
  v21 = v4;
  v17 = 0;
  v14 = objc_msgSend(v8, "executeWithIndexedBindings:usingBlock:error:", v11, v18, &v17);
  v15 = v17;

  if ((v14 & 1) == 0)
    objc_msgSend(v13, "handleError:message:", v15, CFSTR("finding message for UID"));

  return v14;
}

id __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __60__MFMailMessageLibrary_messageWithRemoteID_inRemoteMailbox___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:", v6, 0, mach_absolute_time(), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)searchResultsWithRemoteIDs:(id)a3 inRemoteMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = (id)MEMORY[0x1E0C9AA60];
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary searchResultsWithRemoteIDs:inRemoteMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__MFMailMessageLibrary_searchResultsWithRemoteIDs_inRemoteMailbox___block_invoke;
  v14[3] = &unk_1E4E8A648;
  v14[4] = self;
  v18 = 6293567;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = &v19;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v14);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

uint64_t __67__MFMailMessageLibrary_searchResultsWithRemoteIDs_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _MFMessageCollector *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canSelectMessagesWithOptions:connection:", *(unsigned int *)(a1 + 64), v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
    v5 = v4;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_selectClauseForOptions:protectedDataAvailable:", *(unsigned int *)(a1 + 64), v4);
    v7 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 64), 0, v5);
    v8 = joinsForTables(v7);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_remoteIDsStringForRemoteIDs:inMailbox:", v10, *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 48), "ef_quotedSQLEscapedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ FROM messages %s WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = %@) AND messages.remote_id IN (%@) AND messages.searchable_message IS NULL"), v6, v8, v13, v11);

    free(v8);
    v15 = objc_alloc_init(_MFMessageCollector);
    objc_msgSend(v3, "preparedStatementForQueryString:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendMessagesForStatement:connection:to:options:timestamp:", v16, v3, v15, *(unsigned int *)(a1 + 64), mach_absolute_time());
    v17 = -[_MFMessageCollector copyMessages](v15, "copyMessages");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  return 1;
}

- (id)copyMessagesWithRemoteIDs:(id)a3 options:(unsigned int)a4 inRemoteMailbox:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary copyMessagesWithRemoteIDs:options:inRemoteMailbox:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MFMailMessageLibrary_copyMessagesWithRemoteIDs_options_inRemoteMailbox___block_invoke;
  v16[3] = &unk_1E4E8A648;
  v16[4] = self;
  v20 = a4;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = &v21;
  objc_msgSend(v10, "__performReadWithCaller:usingBlock:", v11, v16);

  v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __74__MFMailMessageLibrary_copyMessagesWithRemoteIDs_options_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _MFMessageCollector *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canSelectMessagesWithOptions:connection:", *(unsigned int *)(a1 + 64), v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
    v5 = v4;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_selectClauseForOptions:protectedDataAvailable:", *(unsigned int *)(a1 + 64), v4);
    v7 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 64), 0, v5);
    v8 = joinsForTables(v7);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_remoteIDsStringForRemoteIDs:inMailbox:", v10, *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 48), "ef_quotedSQLEscapedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ FROM messages %s WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = %@) AND messages.remote_id IN (%@)"), v6, v8, v13, v11);

    free(v8);
    v15 = objc_alloc_init(_MFMessageCollector);
    objc_msgSend(v3, "preparedStatementForQueryString:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendMessagesForStatement:connection:to:options:timestamp:", v16, v3, v15, *(unsigned int *)(a1 + 64), mach_absolute_time());
    v17 = -[_MFMessageCollector copyMessages](v15, "copyMessages");
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  return 1;
}

- (id)flagsForRemoteIDs:(id)a3 inRemoteMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  -[MFMailMessageLibrary database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary flagsForRemoteIDs:inRemoteMailbox:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke;
  v17[3] = &unk_1E4E8A670;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  v12 = v7;
  v19 = v12;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v9, "__performReadWithCaller:usingBlock:", v10, v17);

  v14 = v20;
  v15 = v13;

  return v15;
}

uint64_t __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_remoteIDsStringForRemoteIDs:inMailbox:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 48), "ef_quotedSQLEscapedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("SELECT remote_id, flags FROM messages WHERE remote_mailbox = (SELECT ROWID FROM mailboxes WHERE url = %@) AND messages.remote_id IN (%@)"), v6, v4);

  objc_msgSend(v3, "preparedStatementForQueryString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke_2;
  v12[3] = &unk_1E4E8A048;
  v13 = *(id *)(a1 + 56);
  v11 = 0;
  objc_msgSend(v8, "executeUsingBlock:error:", v12, &v11);
  v9 = v11;
  objc_msgSend(v3, "handleError:message:", v9, CFSTR("Getting flags for remote IDs"));

  return 1;
}

void __58__MFMailMessageLibrary_flagsForRemoteIDs_inRemoteMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("remote_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("flags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  MFFlagsObjectForFlags(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v4);

}

- (id)_remoteIDsStringForRemoteIDs:(id)a3 inMailbox:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DB68]);

  if (v9)
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_msgSend(v5, "count");
    if (v11)
    {
      if (v11 == 1)
      {
        objc_msgSend(v5, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ef_quotedSQLEscapedString");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v13 = v5;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v21;
          v16 = 1;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "ef_quotedSQLEscapedString");
              if ((v16 & 1) != 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString appendString:](v10, "appendString:", v18);
              }
              else
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString appendFormat:](v10, "appendFormat:", CFSTR(",%@"), v18);
              }

              v16 = 0;
              ++v17;
            }
            while (v14 != v17);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            v16 = 0;
          }
          while (v14);
        }

      }
    }
    else
    {
      v10 = &stru_1E4F1C8F8;
    }
  }

  return v10;
}

- (id)sequenceIdentifierForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  if (v4)
  {
    -[MFMailMessageLibrary database](self, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary sequenceIdentifierForMailbox:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__MFMailMessageLibrary_sequenceIdentifierForMailbox___block_invoke;
    v10[3] = &unk_1E4E8A698;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __53__MFMailMessageLibrary_sequenceIdentifierForMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  const unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT sequence_identifier FROM mailboxes WHERE url = ?"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
    if (sqlite3_step(v5) == 100)
    {
      v6 = sqlite3_column_text(v5, 0);
      if (v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

      }
    }
    sqlite3_reset(v5);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("loading mailbox sequence identifier"));
  }

  return 1;
}

- (void)setSequenceIdentifier:(id)a3 forMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MFMailMessageLibrary *v14;
  id v15;
  id v16;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    -[MFMailMessageLibrary database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setSequenceIdentifier:forMailbox:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke;
    v12[3] = &unk_1E4E8A670;
    v10 = v7;
    v13 = v10;
    v14 = self;
    v15 = v6;
    v16 = v11;
    objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

  }
}

uint64_t __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  sqlite3_int64 RowidForMailbox;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  sqlite3_stmt *v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  RowidForMailbox = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));
  if (RowidForMailbox == *MEMORY[0x1E0D1DC08])
  {
    EDLibraryLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke_cold_1(a1 + 48, v5, v6, v7, v8, v9, v10, v11);

  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE mailboxes SET sequence_identifier = ? WHERE ROWID = ?"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (sqlite3_stmt *)objc_msgSend(v12, "compiled");

    if (v13)
    {
      v14 = *(void **)(a1 + 56);
      if (v14)
        sqlite3_bind_text(v13, 1, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), -1, 0);
      else
        sqlite3_bind_null(v13, 1);
      sqlite3_bind_int64(v13, 2, RowidForMailbox);
      sqlite3_step(v13);
      sqlite3_reset(v13);
    }
  }
  v15 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("setting mailbox sequence identifier"));

  return v15;
}

- (id)sequenceIdentifierForMessagesWithRemoteIDs:(id)a3 inMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  if (v7 && objc_msgSend(v6, "count"))
  {
    -[MFMailMessageLibrary database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary sequenceIdentifierForMessagesWithRemoteIDs:inMailbox:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__MFMailMessageLibrary_sequenceIdentifierForMessagesWithRemoteIDs_inMailbox___block_invoke;
    v12[3] = &unk_1E4E89F60;
    v13 = v6;
    v14 = v7;
    v15 = &v16;
    objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);

  }
  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __77__MFMailMessageLibrary_sequenceIdentifierForMessagesWithRemoteIDs_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(CFSTR("SELECT MIN(messages.sequence_identifier) FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.rowid WHERE url = ? AND remote_id IN (?"), "mutableCopy");
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v5 >= 2)
  {
    v6 = v5 - 1;
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR(", ?"));
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (sqlite3_stmt *)objc_msgSend(v7, "compiled");

  if (v8)
  {
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      v12 = 2;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          sqlite3_bind_int(v8, v12 + i, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedIntValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v12 += i;
      }
      while (v10);
    }

    if (sqlite3_step(v8) == 100)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), sqlite3_column_int64(v8, 0));
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
    sqlite3_reset(v8);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("loading per-message minimum sequence identifier"));
  }

  return 1;
}

- (void)setSequenceIdentifier:(id)a3 forMessageWithLibraryID:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    -[MFMailMessageLibrary database](self, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setSequenceIdentifier:forMessageWithLibraryID:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__MFMailMessageLibrary_setSequenceIdentifier_forMessageWithLibraryID___block_invoke;
    v9[3] = &unk_1E4E8A290;
    v10 = v8;
    v11 = a4;
    objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v9);

  }
}

uint64_t __70__MFMailMessageLibrary_setSequenceIdentifier_forMessageWithLibraryID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE messages SET sequence_identifier = ? WHERE ROWID = ?"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
    sqlite3_bind_int64(v5, 2, *(_QWORD *)(a1 + 40));
    sqlite3_step(v5);
    sqlite3_reset(v5);
  }
  v6 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("setting per-message sequence identifier"));

  return v6;
}

- (void)setSequenceIdentifier:(id)a3 forMessagesWithRemoteIDs:(id)a4 inMailbox:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v12, "length") && objc_msgSend(v8, "count"))
  {
    -[MFMailMessageLibrary database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setSequenceIdentifier:forMessagesWithRemoteIDs:inMailbox:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__MFMailMessageLibrary_setSequenceIdentifier_forMessagesWithRemoteIDs_inMailbox___block_invoke;
    v13[3] = &unk_1E4E8A6C0;
    v14 = v8;
    v15 = v12;
    v16 = v9;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v13);

  }
}

uint64_t __81__MFMailMessageLibrary_setSequenceIdentifier_forMessagesWithRemoteIDs_inMailbox___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(CFSTR("UPDATE messages SET sequence_identifier = ? WHERE MAILBOX = (SELECT ROWID FROM mailboxes WHERE url = ?) AND remote_id IN(?"), "mutableCopy");
  v5 = objc_msgSend(a1[4], "count");
  if (v5 >= 2)
  {
    v6 = v5 - 1;
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR(", ?"));
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (sqlite3_stmt *)objc_msgSend(v7, "compiled");

  if (v8)
  {
    sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String"), -1, 0);
    sqlite3_bind_text(v8, 2, (const char *)objc_msgSend(objc_retainAutorelease(a1[6]), "UTF8String"), -1, 0);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = a1[4];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      v12 = 3;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          sqlite3_bind_int(v8, v12 + i, objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "unsignedIntValue", (_QWORD)v16));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v12 += i;
      }
      while (v10);
    }

    sqlite3_step(v8);
    sqlite3_reset(v8);
  }
  v14 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("setting en masse per-message sequence identifier"), (_QWORD)v16);

  return v14;
}

- (id)messageWithMessageID:(id)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v11;

  v7 = a3;
  v8 = a5;
  v11 = -1;
  if (!v7 || (sscanf((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), "%d", &v11), v11 < 0))
  {
    v9 = 0;
  }
  else
  {
    -[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:](self, "messageWithLibraryID:options:inMailbox:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)messagesWithMessageIDHeader:(id)a3
{
  id v4;
  MFMessageCriterion *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MFMessageCriterion initWithType:qualifier:expression:]([MFMessageCriterion alloc], "initWithType:qualifier:expression:", 1, 3, v4);
  -[MFMessageCriterion setCriterionIdentifier:](v5, "setCriterionIdentifier:", *MEMORY[0x1E0D1E5B0]);
  -[MFMailMessageLibrary messagesMatchingCriterion:options:](self, "messagesMatchingCriterion:options:", v5, 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "mailbox", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "store");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMessageStore:", v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)_keyForOptions:(unsigned int)a3 protectedDataAvailable:(BOOL)a4 mailboxAvailable:(BOOL)a5 mailboxCached:(BOOL)a6
{
  unsigned int v6;
  uint64_t v7;

  v6 = a3 | 0x20000;
  if (!a4)
    v6 = a3;
  if (a5)
    v6 |= 0x40000u;
  if (a6)
    v7 = v6 | 0x20000000;
  else
    v7 = v6;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
}

- (id)messageWithLibraryID:(int64_t)a3 options:(unsigned int)a4 inMailbox:(id)a5
{
  -[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:temporarilyUnavailable:](self, "messageWithLibraryID:options:inMailbox:temporarilyUnavailable:", a3, *(_QWORD *)&a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)messageWithLibraryID:(int64_t)a3 options:(unsigned int)a4 inMailbox:(id)a5 temporarilyUnavailable:(BOOL *)a6
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  MFMailMessageLibrary *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  int64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  v11 = a5;
  if ((a4 & 0xFC8F6040) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 4442, CFSTR("Unsupported option for fetching message"));

  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__6;
  v44 = __Block_byref_object_dispose__6;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:temporarilyUnavailable:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke;
  v21 = &unk_1E4E8A710;
  v29 = a4;
  v22 = self;
  v24 = &v46;
  v28 = a3;
  v25 = &v40;
  v14 = v11;
  v23 = v14;
  v26 = &v36;
  v27 = &v30;
  objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, &v18);

  if (*((_BYTE *)v37 + 24) && v41[5])
  {
    os_unfair_lock_lock(&self->_mailboxLock);
    -[NSCache setObject:forKey:](self->_mailboxURLsToMailboxIDs, "setObject:forKey:", v41[5], v14, v18, v19, v20, v21, v22);
    os_unfair_lock_unlock(&self->_mailboxLock);
  }
  if (a6)
    *a6 = *((_BYTE *)v47 + 24);
  v15 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v15;
}

uint64_t __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  int8x16_t v40;
  int v41;
  char v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_canSelectMessagesWithOptions:connection:", *(unsigned int *)(a1 + 88), v3) & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
    v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 204);
    os_unfair_lock_lock(v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "_keyForOptions:protectedDataAvailable:mailboxAvailable:mailboxCached:", *(unsigned int *)(a1 + 88), v4, *(_QWORD *)(a1 + 40) != 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "_selectClauseForOptions:protectedDataAvailable:", *(unsigned int *)(a1 + 88), v4);
      v12 = tablesForOptionsAndCriterion(*(_DWORD *)(a1 + 88), 0, v4);
      v13 = joinsForTables(v12);
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        v15 = CFSTR(", messages.mailbox ");
      else
        v15 = &stru_1E4F1C8F8;
      v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@FROM messages%s"), v15, v13);
      free(v13);
      if (*(_QWORD *)(a1 + 40))
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v17 = objc_alloc(MEMORY[0x1E0CB3940]);
          v18 = CFSTR(" AND mailbox = ?");
        }
        else
        {
          v17 = objc_alloc(MEMORY[0x1E0CB3940]);
          v18 = CFSTR(" AND mailbox IN (SELECT ROWID FROM mailboxes WHERE url = ?)");
        }
        v23 = objc_msgSend(v17, "initWithFormat:", CFSTR("%@ %@ WHERE messages.ROWID = ?%@ LIMIT 1"), v11, v16, v18);
      }
      else
      {
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@ WHERE messages.ROWID = ? LIMIT 1"), v11, v16);
      }
      v10 = (void *)v23;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setObject:forKey:", v23, v9);

    }
    os_unfair_lock_unlock(v5);
    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
      LOBYTE(v24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) == 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v24;
    if (*(_QWORD *)(a1 + 40))
    {
      v25 = *(_QWORD *)(a1 + 80);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v45[0] = v26;
        v45[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        v44[0] = v26;
        v44[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v28 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 80));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v28;

    objc_msgSend(v3, "preparedStatementForQueryString:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke_911;
    v37[3] = &unk_1E4E8A6E8;
    v32 = *(_QWORD *)(a1 + 32);
    v39 = *(_QWORD *)(a1 + 72);
    v37[4] = v32;
    v41 = *(_DWORD *)(a1 + 88);
    v33 = v3;
    v38 = v33;
    v42 = v4;
    v40 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    v36 = 0;
    v22 = objc_msgSend(v31, "executeWithIndexedBindings:usingBlock:error:", v30, v37, &v36);
    v34 = v36;
    if ((v22 & 1) == 0)
      objc_msgSend(v33, "handleError:message:", v34, CFSTR("Fetching message for library ID"));

  }
  else
  {
    EDLibraryLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134217984;
      v47 = v20;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_INFO, "couldn't load message with libraryID %lld because protected data is unavailable", buf, 0xCu);
    }

    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = 1;
    *(_BYTE *)(v21 + 24) = 1;
  }

  return v22;
}

void __86__MFMailMessageLibrary_messageWithLibraryID_options_inMailbox_temporarilyUnavailable___block_invoke_911(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:", v10, *(unsigned int *)(a1 + 72), mach_absolute_time(), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 76), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("mailbox"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberValue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:(int64_t)a3 messageIDHash:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  int64_t v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID:messageIDHash:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__MFMailMessageLibrary_conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID_messageIDHash___block_invoke;
  v13[3] = &unk_1E4E8A738;
  v15 = a3;
  v10 = v7;
  v14 = v10;
  v16 = a4;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v13);

  MFLogGeneral();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = a4;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Threading %lld: conversation IDs of messages in the same thread: %@", buf, 0x16u);
  }

  return v10;
}

uint64_t __98__MFMailMessageLibrary_conversationIDsOfMessagesInSameThreadAsMessageWithLibraryID_messageIDHash___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  sqlite3_int64 v6;
  id v7;
  sqlite3_stmt *v8;
  sqlite3_int64 v9;
  id v10;
  sqlite3_stmt *v11;
  sqlite3_int64 v12;
  id v13;
  sqlite3_stmt *v14;
  sqlite3_int64 v15;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT conversation_id FROM messages WHERE rowid IN (SELECT message FROM message_references WHERE reference IN (SELECT reference FROM message_references WHERE message = ?));"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, *(_QWORD *)(a1 + 40));
    while (sqlite3_step(v5) == 100)
    {
      v6 = sqlite3_column_int64(v5, 0);
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", v6);
    }
    sqlite3_reset(v5);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("Ref Ref Error! Ref!"));
  }
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT conversation_id FROM messages WHERE message_id IN (SELECT reference FROM message_references WHERE message = ?);"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (sqlite3_stmt *)objc_msgSend(v7, "compiled");

  if (v8)
  {
    sqlite3_bind_int64(v8, 1, *(_QWORD *)(a1 + 40));
    while (sqlite3_step(v8) == 100)
    {
      v9 = sqlite3_column_int64(v8, 0);
      if (v9)
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", v9);
    }
    sqlite3_reset(v8);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("Ref Error!"));
  }
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT messages.conversation_id FROM message_references, messages WHERE reference IN (SELECT message_id FROM messages WHERE rowid = ?) AND messages.rowid = message_references.message;"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (sqlite3_stmt *)objc_msgSend(v10, "compiled");

  if (v11)
  {
    sqlite3_bind_int64(v11, 1, *(_QWORD *)(a1 + 40));
    while (sqlite3_step(v11) == 100)
    {
      v12 = sqlite3_column_int64(v11, 0);
      if (v12)
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", v12);
    }
    sqlite3_reset(v11);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("Deref error!"));
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT conversation_id FROM messages WHERE message_id = ? AND rowid != ?;"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (sqlite3_stmt *)objc_msgSend(v13, "compiled");

    if (v14)
    {
      sqlite3_bind_int64(v14, 1, *(_QWORD *)(a1 + 48));
      sqlite3_bind_int64(v14, 2, *(_QWORD *)(a1 + 40));
      while (sqlite3_step(v14) == 100)
      {
        v15 = sqlite3_column_int64(v14, 0);
        if (v15)
          objc_msgSend(*(id *)(a1 + 32), "addIndex:", v15);
      }
      sqlite3_reset(v14);
      objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("Message error!"));
    }
  }

  return 1;
}

- (id)_copyReferenceHashesWithoutMessagesForMessageWithConversation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFMailMessageLibrary database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _copyReferenceHashesWithoutMessagesForMessageWithConversation:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__MFMailMessageLibrary__copyReferenceHashesWithoutMessagesForMessageWithConversation___block_invoke;
  v13[3] = &unk_1E4E8A760;
  v8 = v4;
  v14 = v8;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  v10 = v15;
  v11 = v9;

  return v11;
}

uint64_t __86__MFMailMessageLibrary__copyReferenceHashesWithoutMessagesForMessageWithConversation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  void *v6;
  sqlite3_int64 v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT message_references.message, reference FROM message_references LEFT OUTER JOIN messages ON reference = messages.message_id WHERE message_references.message IN (SELECT rowid FROM messages WHERE conversation_id in (SELECT conversation_id FROM messages WHERE rowid = ?)) AND messages.rowid IS NULL"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, objc_msgSend(*(id *)(a1 + 32), "libraryID"));
    while (sqlite3_step(v5) == 100)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(v5, 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = sqlite3_column_int64(v5, 1);
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
        }
        objc_msgSend(v8, "addIndex:", v7);

      }
    }
    sqlite3_reset(v5);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("Getting references that do not exist in the DB in this conversation."));
  }

  return 1;
}

- (id)_getReferencesForHashesWithOwners:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__MFMailMessageLibrary__getReferencesForHashesWithOwners___block_invoke;
  v10[3] = &unk_1E4E8A788;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __58__MFMailMessageLibrary__getReferencesForHashesWithOwners___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "messageWithLibraryID:options:inMailbox:", objc_msgSend(a2, "longLongValue"), 6297663, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v16, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "references");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v15);
  objc_msgSend(v7, "firstHeaderForKey:", *MEMORY[0x1E0D1E588]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v6, "addObject:", v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = MFStringHashForMessageIDHeader();
        if (v14 && objc_msgSend(v5, "containsIndex:", v14))
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (int64_t)loadMoreMessagesForThreadContainingMessage:(id)a3 hasNoMoreMessages:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v6 = a3;
  -[MFMailMessageLibrary remoteStoreForMessage:](self, "remoteStoreForMessage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canFetchMessageIDs"))
  {
    v8 = -1;
    v9 = 6;
    while (1)
    {
      if (!--v9)
      {
        v12 = v8;
        goto LABEL_19;
      }
      v10 = -[MFMailMessageLibrary _copyReferenceHashesWithoutMessagesForMessageWithConversation:](self, "_copyReferenceHashesWithoutMessagesForMessageWithConversation:", v6);
      v11 = objc_msgSend(v10, "count");
      v12 = v8;
      if (v11)
      {
        -[MFMailMessageLibrary _getReferencesForHashesWithOwners:](self, "_getReferencesForHashesWithOwners:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "fetchMessagesWithMessageIDs:andSetFlags:", v13, 0x100000);
        if (v14 <= 0)
          v12 = v8;
        else
          v12 = v14 + (v8 & ~(v8 >> 63));

      }
      if (v8 == v12 && a4)
        break;

      if (v11)
      {
        if (v12 <= 49)
        {
          v15 = v8 == v12;
          v8 = v12;
          if (!v15)
            continue;
        }
      }
      goto LABEL_19;
    }
    *a4 = 1;

  }
  else
  {
    v12 = -1;
  }
LABEL_19:

  return v12;
}

- (id)urlForMailboxID:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  NSMutableDictionary *mailboxCache;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  if (*MEMORY[0x1E0D1DC08] == a3)
    goto LABEL_2;
  if (!self->_mailboxCache)
    goto LABEL_11;
  _MFLockGlobalLock();
  mailboxCache = self->_mailboxCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mailboxCache, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v17[5];
  v17[5] = v9;

  _MFUnlockGlobalLock();
  v5 = (void *)v17[5];
  if (!v5)
  {
LABEL_11:
    -[MFMailMessageLibrary database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary urlForMailboxID:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__MFMailMessageLibrary_urlForMailboxID___block_invoke;
    v15[3] = &unk_1E4E8A7B0;
    v15[5] = &v16;
    v15[6] = a3;
    v15[4] = self;
    objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v15);

    v5 = (void *)v17[5];
    if (!v5)
    {
LABEL_2:
      EDLibraryLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[MFMailMessageLibrary urlForMailboxID:].cold.1();

      v5 = (void *)v17[5];
    }
  }
  v13 = v5;
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __40__MFMailMessageLibrary_urlForMailboxID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  const unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT url FROM mailboxes WHERE ROWID = ?;"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, a1[6]);
    if (sqlite3_step(v5) == 100)
    {
      v6 = sqlite3_column_text(v5, 0);
      if (v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
        v8 = *(_QWORD *)(a1[5] + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
        {
          _MFLockGlobalLock();
          v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
          v11 = *(void **)(a1[4] + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

          _MFUnlockGlobalLock();
        }
      }
    }
    sqlite3_reset(v5);
  }

  return 1;
}

- (id)mailboxURLsForIDs:(id)a3
{
  void *v4;
  MFMailMessageLibrary *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[4];
  id v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  v44 = v42;
  v45 = v4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "count"))
  {
    if (v5->_mailboxCache)
    {
      _MFLockGlobalLock();
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v7 = v44;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v55 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](v5->_mailboxCache, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v11);

            }
            else
            {
              objc_msgSend(v45, "addObject:", v11);
            }

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        }
        while (v8);
      }

      _MFUnlockGlobalLock();
    }
    else
    {
      objc_msgSend(v45, "addObjectsFromArray:", v44);
    }
  }

  if (objc_msgSend(v45, "count"))
  {
    v14 = v5;
    v43 = v45;
    objc_msgSend(v43, "ef_map:", &__block_literal_global_2147);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("SELECT ROWID, url FROM mailboxes WHERE ROWID IN (%@);"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "readMailboxURLStringsFromDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __readMailboxURLStringsFromDatabase_block_invoke_2;
    v60[3] = &unk_1E4E8A760;
    v22 = v18;
    v61 = v22;
    v23 = v19;
    v62 = v23;
    objc_msgSend(v20, "__performReadWithCaller:usingBlock:", v21, v60);

    v24 = v62;
    v25 = v23;

    if (objc_msgSend(v25, "count"))
    {
      if (v14[4])
      {
        _MFLockGlobalLock();
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v51 != v28)
                objc_enumerationMutation(v26);
              v30 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
              objc_msgSend(v26, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14[4], "setObject:forKeyedSubscript:", v31, v30);

            }
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v27);
        }

        _MFUnlockGlobalLock();
      }
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v32 = v25;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v47 != v34)
              objc_enumerationMutation(v32);
            v36 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
            v37 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v32, "objectForKeyedSubscript:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "URLWithString:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, v36);

          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v33);
      }

    }
  }
  else
  {
    v40 = objc_msgSend(v6, "count");
    if (v40 != objc_msgSend(v44, "count"))
      __assert_rtn("-[MFMailMessageLibrary mailboxURLsForIDs:]", "MailMessageLibrary.m", 4829, "urlsByID.count == mailboxIDs.count");
  }

  return v6;
}

uint64_t __64__MFMailMessageLibrary_mailboxIDForURLString_createIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = createRowidForMailbox(*(void **)(a1 + 40), v3, *(void **)(a1 + 48), 0, *(void **)(a1 + 32));

  return 1;
}

uint64_t __46__MFMailMessageLibrary_mailboxIDForURLString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT rowid FROM mailboxes WHERE url = ?;"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
    if (sqlite3_step(v5) == 100)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v5, 0);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
      {
        _MFLockGlobalLock();
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

        _MFUnlockGlobalLock();
      }
    }
    sqlite3_reset(v5);
  }

  return 1;
}

- (id)mailboxURLForMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "mailboxID") == -1)
  {
    EDLibraryLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary mailboxURLForMessage:].cold.1((uint64_t)v8, objc_msgSend(v4, "libraryID"), v5);

  }
  -[MFMailMessageLibrary urlForMailboxID:](self, "urlForMailboxID:", objc_msgSend(v4, "mailboxID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mailboxUidForMessage:(id)a3
{
  void *v3;
  void *v4;

  -[MFMailMessageLibrary mailboxURLForMessage:](self, "mailboxURLForMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)remoteStoreForMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMailMessageLibrary mailboxUidForMessage:](self, "mailboxUidForMessage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeForMailboxUid:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accountForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMailMessageLibrary urlForMailboxID:](self, "urlForMailboxID:", objc_msgSend(v4, "mailboxID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount accountWithURLString:](MailAccount, "accountWithURLString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldCancel
{
  return 0;
}

- (void)clearServerSearchFlagsForMessagesWithLibraryIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  MFMailMessageLibrary *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[MFMailMessageLibrary database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary clearServerSearchFlagsForMessagesWithLibraryIDs:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke;
  v15 = &unk_1E4E8A6C0;
  v8 = v4;
  v16 = v8;
  v9 = v5;
  v17 = v9;
  v18 = self;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, &v12);

  if (objc_msgSend(v9, "count", v12, v13, v14, v15))
  {
    v19[0] = CFSTR("MessageIsServerSearchResult");
    v19[1] = CFSTR("MessageIsThreadSearchResult");
    v20[0] = CFSTR("NO");
    v20[1] = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MFMailMessageLibrary setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", v10, v9);

  }
}

uint64_t __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT ROWID FROM messages WHERE (ROWID IN (%@)) AND (flags & %llu != 0)"), v4, 1048704);
  objc_msgSend(v3, "preparedStatementForQueryString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke_2;
  v10[3] = &unk_1E4E8A828;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  objc_msgSend(v6, "executeUsingBlock:error:", v10, 0);

  return 1;
}

void __72__MFMailMessageLibrary_clearServerSearchFlagsForMessagesWithLibraryIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithLibraryID:options:inMailbox:", objc_msgSend(v5, "databaseIDValue"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (void)scheduleRecurringActivity
{
  -[MFMailMessageLibrary _schedulePeriodicStatisticsLogging](self, "_schedulePeriodicStatisticsLogging");
  -[MFMailMessageLibrary _scheduleIncrementalVacuum](self, "_scheduleIncrementalVacuum");
}

- (void)addPostMigrationStep:(Class)a3
{
  id v4;

  -[MFMailMessageLibrary database](self, "database");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPostMigrationStep:", a3);

}

- (unint64_t)flagsForConversationId:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary flagsForConversationId:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__MFMailMessageLibrary_flagsForConversationId___block_invoke;
  v8[3] = &unk_1E4E8A850;
  v8[4] = &v9;
  v8[5] = a3;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__MFMailMessageLibrary_flagsForConversationId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT flags FROM conversations WHERE conversation_id = ?"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, *(_QWORD *)(a1 + 40));
    if (sqlite3_step(v5) == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(v5, 0);
    sqlite3_reset(v5);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("fetching conversation flags"));
  }

  return 1;
}

- (void)setFlags:(unint64_t)a3 forConversationId:(int64_t)a4
{
  void *v6;
  id v7;
  _QWORD v8[6];

  -[MFMailMessageLibrary database](self, "database");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setFlags:forConversationId:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MFMailMessageLibrary_setFlags_forConversationId___block_invoke;
  v8[3] = &__block_descriptor_48_e41_B16__0__EDPersistenceDatabaseConnection_8l;
  v8[4] = a3;
  v8[5] = a4;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v6, v8);

}

uint64_t __51__MFMailMessageLibrary_setFlags_forConversationId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE conversations SET flags = ? WHERE conversation_id = ?"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, *(_QWORD *)(a1 + 32));
    sqlite3_bind_int64(v5, 2, *(_QWORD *)(a1 + 40));
    sqlite3_step(v5);
    sqlite3_reset(v5);
  }
  v6 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("setting conversation flags"));

  return v6;
}

- (int64_t)_conversationIdForMessageIds:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int64_t v10;
  __CFString *i;
  uint64_t v13;
  _QWORD v14[4];
  __CFString *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = &stru_1E4F1C8F8;
  v6 = objc_msgSend(v4, "firstIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = &stru_1E4F1C8F8; ; i = (__CFString *)v13)
    {
      -[__CFString stringByAppendingFormat:](i, "stringByAppendingFormat:", CFSTR("%lld"), v6);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v4, "indexGreaterThanIndex:", v6);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(","));
      v13 = objc_claimAutoreleasedReturnValue();

    }
  }
  -[MFMailMessageLibrary database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _conversationIdForMessageIds:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__MFMailMessageLibrary__conversationIdForMessageIds___block_invoke;
  v14[3] = &unk_1E4E8A698;
  v9 = v5;
  v15 = v9;
  v16 = &v17;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v14);

  v10 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __53__MFMailMessageLibrary__conversationIdForMessageIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  sqlite3_stmt *v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT DISTINCT(conversation_id) FROM conversation_id_message_id WHERE message_id IN (%@)"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");

  if (v6)
  {
    if (sqlite3_step(v6) == 100)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_column_int64(v6, 0);
    sqlite3_reset(v6);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("finding conversation id"));
  }

  return 1;
}

- (void)setStoredIntegerPropertyWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setStoredIntegerPropertyWithName:value:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__MFMailMessageLibrary_setStoredIntegerPropertyWithName_value___block_invoke;
  v12[3] = &unk_1E4E8A760;
  v10 = v7;
  v13 = v10;
  v11 = v6;
  v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

}

uint64_t __63__MFMailMessageLibrary_setStoredIntegerPropertyWithName_value___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  sqlite3_stmt *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("INSERT OR REPLACE INTO properties (key, value) VALUES (?,?)"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (sqlite3_stmt *)objc_msgSend(v5, "compiled");

    sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    sqlite3_bind_int(v6, 2, objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue"));
  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("DELETE FROM properties WHERE key = ?"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (sqlite3_stmt *)objc_msgSend(v7, "compiled");

    sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
  }
  sqlite3_step(v6);
  sqlite3_reset(v6);
  v8 = CFSTR("updating");
  if (!*(_QWORD *)(a1 + 32))
    v8 = CFSTR("deleting");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ property %@"), v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "checkForConnectionErrorWithMessage:", v9);

  return v10;
}

- (void)_notifyDidCompact:(BOOL)a3 messages:(id)a4 mailboxes:(id)a5
{
  _BOOL4 v6;
  id v8;
  __CFString **v9;
  __CFString *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v13 = a4;
  v8 = a5;
  v9 = &MailMessageStoreMessagesCompacted;
  if (!v6)
    v9 = MailMessageStoreMessagesWillBeCompacted;
  v10 = *v9;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v13)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("messages"));
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("mailboxes"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", v10, self, v11);

}

- (void)compactMessages:(id)a3
{
  -[MFMailMessageLibrary compactMessages:permanently:notifyPersistence:](self, "compactMessages:permanently:notifyPersistence:", a3, 1, 1);
}

- (void)compactMessages:(id)a3 permanently:(BOOL)a4
{
  -[MFMailMessageLibrary compactMessages:permanently:notifyPersistence:](self, "compactMessages:permanently:notifyPersistence:", a3, a4, 0);
}

- (void)compactMessages:(id)a3 permanently:(BOOL)a4 notifyPersistence:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  double Current;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  CFAbsoluteTime v23;
  _BOOL4 v24;
  id v25;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  MFMailMessageLibrary *v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[4];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  CFAbsoluteTime v61;
  _BYTE v62[128];
  uint64_t v63;

  v5 = a5;
  v63 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addReason:", CFSTR("MonitoredActivityReasonCompacting"));

  Current = CFAbsoluteTimeGetCurrent();
  v28 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = v25;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  v24 = v5;
  v11 = 0;
  if (v10)
  {
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1A85B0E24]();
        -[MFMailMessageLibrary mailboxUidForMessage:](self, "mailboxUidForMessage:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v11, "ef_addObjectIfAbsent:", v16);
        }

        objc_autoreleasePoolPop(v15);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v10);
  }

  -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 0, v9, v11);
  -[MFMailMessageLibrary removeSearchableItemsForMessages:](self, "removeSearchableItemsForMessages:", v9);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0xAAAAAAAAAAAAAAAALL;
  v49 = objc_msgSend(v9, "count");
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0xAAAAAAAAAAAAAAAALL;
  v29 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  while (v51[3] < (unint64_t)v47[3])
  {
    -[MFMailMessageLibrary database](self, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary compactMessages:permanently:notifyPersistence:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __70__MFMailMessageLibrary_compactMessages_permanently_notifyPersistence___block_invoke;
    v30[3] = &unk_1E4E8A898;
    v40 = a4;
    v31 = v28;
    v36 = v45;
    v37 = &v41;
    v38 = &v50;
    v39 = &v46;
    v32 = v9;
    v19 = v27;
    v33 = v19;
    v34 = v29;
    v35 = self;
    objc_msgSend(v17, "__performWriteWithCaller:usingBlock:", v18, v30);

    objc_msgSend(v19, "removeAllObjects");
    if (!*((_BYTE *)v42 + 24))
      goto LABEL_19;
  }
  if (v24)
  {
    -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "persistenceDidDeleteMessages:generationWindow:", v9, v28);

  }
  -[MFMailMessageLibrary _removeSearchableItemsWithLibraryIDs:](self, "_removeSearchableItemsWithLibraryIDs:", v29);
  -[MFMailMessageLibrary cleanupProtectedTables](self, "cleanupProtectedTables");
  -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 1, v9, v11);
LABEL_19:
  EDLibraryLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v47[3];
    v23 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134218240;
    v59 = v22;
    v60 = 2048;
    v61 = v23 - Current;
    _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "Compacted %lu messages (%f seconds)", buf, 0x16u);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

}

BOOL __70__MFMailMessageLibrary_compactMessages_permanently_notifyPersistence___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v27;
  void *v28;
  unint64_t v29;
  id v30;
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v27 = v3;
  if (*(_BYTE *)(a1 + 104))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE pop_uids SET flags = ? WHERE mailbox = ? AND uid = ?"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v4, "transactionGeneration"));
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v5 = 0;
    v6 = 0;
    v29 = *MEMORY[0x1E0D1E988];
    while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96)
                                                                                                + 8)
                                                                                    + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v7);
      v8 = objc_msgSend(v7, "libraryID");
      v9 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      objc_msgSend(*(id *)(a1 + 56), "addIndex:", v8);
      if (!v5)
      {
        objc_msgSend(v7, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "personaIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
        {
          v5 = 0;
        }
        else
        {
          objc_msgSend(v7, "account");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "personaIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      if (*(_BYTE *)(a1 + 104))
      {
        v16 = v6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "messageFlags"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v17;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "originalMailboxID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v18;
        objc_msgSend(v7, "remoteID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v6;
        v21 = objc_msgSend(v28, "executeWithIndexedBindings:usingBlock:error:", v20, 0, &v31);
        v16 = v31;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v21;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
          objc_msgSend(v27, "handleError:message:", v16, CFSTR("Clearing flags in pop_uids"));
      }
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) < v29;

      if (v22)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v6 = v16;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
          continue;
      }
      goto LABEL_20;
    }
    v16 = v6;
  }
  else
  {
    v16 = 0;
    v5 = 0;
  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 64), "hookRegistry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "persistenceWillDeleteMessages:", v30);

  objc_msgSend(*(id *)(a1 + 64), "_deleteMessages:connection:", v30, v27);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 64), "hookRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistenceIsDeletingMessages:generationWindow:", v30, *(_QWORD *)(a1 + 32));

    v25 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 0;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_deleteMessages:(id)a3 connection:(id)a4
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  MFMailMessageLibrary *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  MFMailMessageLibrary *v19;
  MFMailMessageLibrary *v20;
  void *v21;
  BOOL v22;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;

  v7 = a3;
  v30 = v7;
  v31 = a4;
  v8 = objc_msgSend(v7, "count");
  if (v8 > *MEMORY[0x1E0D1E988])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 5177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messages.count <= EDMessageBatchSize"));

  }
  objc_msgSend(v7, "ef_map:", &__block_literal_global_984);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT sender, subject, summary, brand_indicator FROM messages WHERE ROWID IN (%@)"), v9);
  v11 = self;
  objc_msgSend(v31, "preparedStatementForQueryString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __51__MFMailMessageLibrary__deleteMessages_connection___block_invoke_2;
  v33[3] = &unk_1E4E8A900;
  v13 = v27;
  v34 = v13;
  v14 = v26;
  v35 = v14;
  v15 = v25;
  v36 = v15;
  v16 = v28;
  v37 = v16;
  v32 = 0;
  v17 = objc_msgSend(v12, "executeUsingBlock:error:", v33, &v32);
  v18 = v32;
  if ((v17 & 1) == 0)
  {
    v21 = v31;
    objc_msgSend(v31, "handleError:message:", v18, CFSTR("Fetching messages to delete"));
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  v19 = v11;
  v20 = v11;
  v21 = v31;
  if (!-[MFMailMessageLibrary _addAddressesFromRecipientsForMessages:toSet:connection:](v20, "_addAddressesFromRecipientsForMessages:toSet:connection:", v9, v13, v31)|| !-[MFMailMessageLibrary _deleteMessages:andCleanUpAddresses:subjects:summaries:brandIndicators:connection:](v19, "_deleteMessages:andCleanUpAddresses:subjects:summaries:brandIndicators:connection:", v9, v13, v14, v15, v16, v31))
  {
    goto LABEL_8;
  }
  -[MFMailMessageLibrary _removeGlobalDataForMessagesIfNecessary:connection:](v19, "_removeGlobalDataForMessagesIfNecessary:connection:", v30, v31);
  v22 = 1;
LABEL_9:

  return v22;
}

id __51__MFMailMessageLibrary__deleteMessages_connection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "libraryID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__MFMailMessageLibrary__deleteMessages_connection___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(a1[4], "addObject:", v4);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(a1[5], "addObject:", v6);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(a1[6], "addObject:", v8);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(a1[7], "addObject:", v10);

}

- (BOOL)_addAddressesFromRecipientsForMessages:(id)a3 toSet:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT DISTINCT address FROM recipients WHERE message IN (%@)"), v7);
    objc_msgSend(v9, "preparedStatementForQueryString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__MFMailMessageLibrary__addAddressesFromRecipientsForMessages_toSet_connection___block_invoke;
    v16[3] = &unk_1E4E8A048;
    v17 = v8;
    v15 = 0;
    v12 = objc_msgSend(v11, "executeUsingBlock:error:", v16, &v15);
    v13 = v15;
    if ((v12 & 1) == 0)
      objc_msgSend(v9, "handleError:message:", v13, CFSTR("Fetching recipient addresses for messages"));

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

void __80__MFMailMessageLibrary__addAddressesFromRecipientsForMessages_toSet_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)_deleteMessages:(id)a3 andCleanUpAddresses:(id)a4 subjects:(id)a5 summaries:(id)a6 brandIndicators:(id)a7 connection:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v33 = a6;
  v17 = a7;
  v18 = a8;
  v32 = v14;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM messages WHERE ROWID IN (%@)"), v14);
  if (objc_msgSend(v18, "executeStatementString:errorMessage:", v19, CFSTR("Deleting messages")))
  {
    -[MFMailMessageLibrary _existingValuesForColumn:table:fromValues:connection:](self, "_existingValuesForColumn:table:fromValues:connection:", CFSTR("sender"), CFSTR("messages"), v15, v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minusSet:");
    -[MFMailMessageLibrary _existingValuesForColumn:table:fromValues:connection:](self, "_existingValuesForColumn:table:fromValues:connection:", CFSTR("address"), CFSTR("recipients"), v15, v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minusSet:");
    v28 = -[MFMailMessageLibrary _deleteRows:fromTable:connection:](self, "_deleteRows:fromTable:connection:", v15, CFSTR("addresses"), v18);
    -[MFMailMessageLibrary _existingValuesForColumn:table:fromValues:connection:](self, "_existingValuesForColumn:table:fromValues:connection:", CFSTR("subject"), CFSTR("messages"), v16, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minusSet:");
    MFLogGeneral();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "Deleting subjectID set: %{public}@", buf, 0xCu);
    }

    v21 = -[MFMailMessageLibrary _deleteRows:fromTable:connection:](self, "_deleteRows:fromTable:connection:", v16, CFSTR("subjects"), v18);
    -[MFMailMessageLibrary _existingValuesForColumn:table:fromValues:connection:](self, "_existingValuesForColumn:table:fromValues:connection:", CFSTR("summary"), CFSTR("messages"), v33, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "minusSet:", v22);
    v23 = -[MFMailMessageLibrary _deleteRows:fromTable:connection:](self, "_deleteRows:fromTable:connection:", v33, CFSTR("summaries"), v18);
    -[MFMailMessageLibrary _existingValuesForColumn:table:fromValues:connection:](self, "_existingValuesForColumn:table:fromValues:connection:", CFSTR("brand_indicator"), CFSTR("messages"), v17, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "minusSet:", v24);
    v25 = -[MFMailMessageLibrary _deleteRows:fromTable:connection:](self, "_deleteRows:fromTable:connection:", v17, CFSTR("brand_indicators"), v18);

    v26 = v25 && v23 && v21 && v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)_removeGlobalDataForMessagesIfNecessary:(id)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSString *v30;
  EFScheduler *fileRemovalAfterCompactionScheduler;
  id v32;
  id v33;
  id v34;
  id v35;
  NSString *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  id obj;
  _QWORD v46[4];
  id v47;
  NSString *v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  MFMailMessageLibrary *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = a4;
  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("Transaction for removing files after compaction"), v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v43 = (void *)objc_opt_new();
  v44 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v11, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "globalMessageID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        objc_msgSend(v12, "personaIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v12);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v17);

        }
        else if (objc_msgSend(v12, "supportsPurge"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v16);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_opt_new();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke;
  v54[3] = &unk_1E4E8A978;
  v19 = v39;
  v55 = v19;
  v56 = self;
  v20 = v7;
  v57 = v20;
  v21 = v43;
  v58 = v21;
  v22 = v44;
  v59 = v22;
  v23 = v18;
  v60 = v23;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v54);
  v38 = v20;
  if (objc_msgSend(v23, "count"))
  {
    v37 = (void *)objc_opt_new();
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("generated_summary"), CFSTR("message_global_data"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "in:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setWhere:", v26);

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_5;
    v52[3] = &unk_1E4E8A048;
    v27 = v37;
    v53 = v27;
    objc_msgSend(v19, "executeSelectStatement:withBlock:error:", v41, v52, 0);
    objc_msgSend(MEMORY[0x1E0D1EB30], "generatedSummariesTableName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary _deleteRows:fromTable:connection:](self, "_deleteRows:fromTable:connection:", v27, v28, v19);

    objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataTableName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary _deleteRows:fromTable:connection:](self, "_deleteRows:fromTable:connection:", v23, v29, v19);

  }
  v30 = self->_path;
  fileRemovalAfterCompactionScheduler = self->_fileRemovalAfterCompactionScheduler;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_6;
  v46[3] = &unk_1E4E8AA30;
  v32 = v21;
  v47 = v32;
  v48 = v30;
  v33 = v22;
  v49 = v33;
  v34 = v38;
  v50 = v34;
  v35 = v40;
  v51 = v35;
  v36 = v30;
  -[EFScheduler performBlock:](fileRemovalAfterCompactionScheduler, "performBlock:", v46);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("mailbox"), CFSTR("messages"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("global_message_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "equalTo:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWhere:", v6);

  v7 = (void *)objc_opt_new();
  v8 = *(void **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_2;
  v21[3] = &unk_1E4E8A048;
  v10 = v7;
  v22 = v10;
  objc_msgSend(v8, "executeSelectStatement:withBlock:error:", v4, v21, 0);
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_opt_new();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_3;
    v19[3] = &unk_1E4E8A928;
    v19[4] = *(_QWORD *)(a1 + 40);
    v12 = v11;
    v20 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_4;
    v14[3] = &unk_1E4E8A950;
    v15 = *(id *)(a1 + 48);
    v16 = v3;
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

  }
  else
  {
    v13 = *(void **)(a1 + 72);
    objc_msgSend(v3, "stringValue");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v12);
  }

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "urlForMailboxID:", objc_msgSend(v6, "longLongValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v5 = objc_msgSend(v7, "supportsPurge");
    v6 = 56;
    if (v5)
      v6 = 48;
    objc_msgSend(*(id *)(a1 + v6), "removeObject:", *(_QWORD *)(a1 + 40));
  }

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_7;
  v10[3] = &unk_1E4E8A9A0;
  v3 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  v5 = v2;
  v6 = 3221225472;
  v7 = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_8;
  v8 = &unk_1E4E8A9A0;
  v4 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v5);
  objc_msgSend(*(id *)(a1 + 56), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1009, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 64), "invalidate");

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v5, "longLongValue"), *(_QWORD *)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v5, "longLongValue"), *(_QWORD *)(a1 + 32), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "supportsPurge");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_10;
  v8[3] = &unk_1E4E8AA08;
  v7 = v4;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __75__MFMailMessageLibrary__removeGlobalDataForMessagesIfNecessary_connection___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1EB20];
  v9 = v3;
  v5 = objc_msgSend(v3, "longLongValue");
  objc_msgSend(*(id *)(a1 + 32), "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v5, v6, *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

}

- (id)_existingValuesForColumn:(id)a3 table:(id)a4 fromValues:(id)a5 connection:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  id v25;
  _QWORD v26[4];
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@ WHERE %@ IN (%@)"), v9, v10, v9, v16);

    objc_msgSend(v12, "preparedStatementForQueryString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __77__MFMailMessageLibrary__existingValuesForColumn_table_fromValues_connection___block_invoke;
    v26[3] = &unk_1E4E8A048;
    v19 = v13;
    v27 = v19;
    v25 = 0;
    v20 = objc_msgSend(v18, "executeUsingBlock:error:", v26, &v25);
    v21 = v25;
    if ((v20 & 1) == 0)
      objc_msgSend(v12, "handleError:message:", v21, CFSTR("Fetching value"));
    v22 = v27;
    v23 = v19;

  }
  return v13;
}

void __77__MFMailMessageLibrary__existingValuesForColumn_table_fromValues_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (int64_t)_maxRowIDInSet:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    v6 = 0x8000000000000000;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "longLongValue", (_QWORD)v10);
        if (v8 > v6)
          v6 = v8;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0x8000000000000000;
  }

  return v6;
}

- (BOOL)_deleteRows:(id)a3 fromTable:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  NSObject *v16;
  char v17;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE ROWID IN (%@)"), v9, v13);

    objc_msgSend(v10, "executeStatementString:errorMessage:", v14, CFSTR("Deleting rows"));
    v15 = -[MFMailMessageLibrary _maxRowIDInSet:](self, "_maxRowIDInSet:", v8);
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2048;
      v22 = v15;
      _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_INFO, "Update largest_deleted_rowid for %{public}@ to %lld", buf, 0x16u);
    }

    v17 = objc_msgSend(MEMORY[0x1E0D1EC70], "updateLargestDeletedRowID:forTableName:withConnection:", v15, v9, v10);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void)compactMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addReason:", CFSTR("MonitoredActivityReasonCompacting"));

  +[MFMessageCriterion messageIsDeletedCriterion:](MFMessageCriterion, "messageIsDeletedCriterion:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailMessageLibrary messagesMatchingCriterion:options:](self, "messagesMatchingCriterion:options:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v24 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v10, "count"))
  {
    -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 0, v10, v13);
    -[MFMailMessageLibrary removeSearchableItemsForMessages:](self, "removeSearchableItemsForMessages:", v10);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v14 = (void *)objc_opt_new();
    v15 = *MEMORY[0x1E0D1E988];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __39__MFMailMessageLibrary_compactMailbox___block_invoke;
    v17[3] = &unk_1E4E8AA80;
    v17[4] = self;
    v19 = &v20;
    v16 = v14;
    v18 = v16;
    objc_msgSend(v10, "ef_enumerateObjectsInBatchesOfSize:block:", v15, v17);
    if (*((_BYTE *)v21 + 24))
    {
      -[MFMailMessageLibrary cleanupProtectedTables](self, "cleanupProtectedTables");
      -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 1, v16, v13);
    }

    _Block_object_dispose(&v20, 8);
  }

}

void __39__MFMailMessageLibrary_compactMailbox___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary compactMailbox:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__MFMailMessageLibrary_compactMailbox___block_invoke_2;
  v10[3] = &unk_1E4E8AA58;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 48);
  v10[4] = v8;
  v9 = v5;
  v11 = v9;
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v10);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);
  else
    *a3 = 1;

}

uint64_t __39__MFMailMessageLibrary_compactMailbox___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_deleteMessages:connection:", *(_QWORD *)(a1 + 40), v3);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v4;
}

- (BOOL)renameMailboxes:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  BOOL (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  MFMailMessageLibrary *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v9 = objc_msgSend(v6, "count");
  if (v9 == objc_msgSend(v7, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MFMailMessageLibrary database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary renameMailboxes:to:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __43__MFMailMessageLibrary_renameMailboxes_to___block_invoke;
    v21 = &unk_1E4E8AAA8;
    v13 = v8;
    v22 = v13;
    v23 = v6;
    v27 = &v28;
    v24 = v7;
    v25 = self;
    v14 = v10;
    v26 = v14;
    objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, &v18);

    if (objc_msgSend(v14, "count", v18, v19, v20, v21))
    {
      -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistenceDidDeleteAllMessagesInMailboxesWithURLs:generationWindow:", v14, v13);

    }
    v16 = *((_DWORD *)v29 + 6) == 0;
  }
  else
  {
    v16 = 0;
    *((_DWORD *)v29 + 6) = 1;
  }
  _Block_object_dispose(&v28, 8);

  return v16;
}

BOOL __43__MFMailMessageLibrary_renameMailboxes_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  sqlite3 *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  v4 = (sqlite3 *)objc_msgSend(v3, "sqlDB");
  v5 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        break;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v6);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "UTF8String");
      v10 = objc_retainAutorelease(v7);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = sqlite3_exec_printf(v4, "UPDATE mailboxes SET url = '%q' WHERE url = '%q';",
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      v9,
                                                                      objc_msgSend(v10, "UTF8String"));
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 19)
      {
        v11 = objc_retainAutorelease(v8);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = sqlite3_exec_printf(v4, "DELETE FROM mailboxes WHERE url = '%q'", 0, 0, 0, objc_msgSend(v11, "UTF8String"));
        objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("deleting mailbox URL"));
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v11);
          objc_msgSend(*(id *)(a1 + 56), "hookRegistry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "persistenceIsDeletingAllMessagesInMailboxWithURL:generationWindow:", v12, *(_QWORD *)(a1 + 32));

          objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = sqlite3_exec_printf(v4, "UPDATE mailboxes SET url = '%q' WHERE url = '%q';",
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
          objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("renaming mailbox"));

        }
      }
      else
      {
        objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("renaming mailbox"));
      }

      --v6;
    }
    while (v6 != -1);
  }
  objc_msgSend(*(id *)(a1 + 56), "reloadMailboxCacheWithConnection:", v3);
  v14 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 0;

  return v14;
}

- (void)deleteMailboxes:(id)a3 account:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        -[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:](self, "removeAllMessagesFromMailbox:removeMailbox:andNotify:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1, 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeAllMessagesFromMailbox:(id)a3 removeMailbox:(BOOL)a4 andNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD v37[4];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  id v42;
  _QWORD v43[3];

  v5 = a5;
  v6 = a4;
  v43[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addReason:", CFSTR("MonitoredActivityReasonCompacting"));

  +[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary messagesMatchingCriterion:options:](self, "messagesMatchingCriterion:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
  +[MailAccount mailboxUidFromActiveAccountsForURL:](MailAccount, "mailboxUidFromActiveAccountsForURL:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[MFMailMessageLibrary removeSearchableItemsForMailbox:](self, "removeSearchableItemsForMailbox:", v12);
  if (objc_msgSend(v11, "count"))
  {
    if (v12)
    {
      v43[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 0, v11);
    }
    else
    {
      v26 = 0;
    }
    v23 = v5;
    -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v24 = v10;
    v14 = objc_msgSend(v11, "count");
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v15 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    v16 = *MEMORY[0x1E0D1E988];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke;
    v30[3] = &unk_1E4E8AAF8;
    v30[4] = self;
    v17 = v15;
    v31 = v17;
    v34 = &v38;
    v35 = v37;
    v36 = v14;
    v18 = v25;
    v32 = v18;
    v19 = v27;
    v33 = v19;
    objc_msgSend(v11, "ef_enumerateObjectsInBatchesOfSize:block:", v16, v30);
    v10 = v24;
    if (*((_BYTE *)v39 + 24))
    {
      v42 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "persistenceDidDeleteAllMessagesInMailboxesWithURLs:generationWindow:", v20, v17);

      -[MFMailMessageLibrary _removeSearchableItemsWithLibraryIDs:](self, "_removeSearchableItemsWithLibraryIDs:", v13);
      -[MFMailMessageLibrary cleanupProtectedTables](self, "cleanupProtectedTables");
      if (v12)
      {
        if (*((_BYTE *)v39 + 24) && v23)
          -[MFMailMessageLibrary _notifyDidCompact:messages:mailboxes:](self, "_notifyDidCompact:messages:mailboxes:", 1, v11, v26);
      }
    }

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v38, 8);

  }
  if (v6)
  {
    -[MFMailMessageLibrary database](self, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_3;
    v28[3] = &unk_1E4E8AB20;
    v29 = v8;
    objc_msgSend(v21, "__performWriteWithCaller:usingBlock:", v22, v28);

  }
}

void __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary removeAllMessagesFromMailbox:removeMailbox:andNotify:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_2;
  v14[3] = &unk_1E4E8AAD0;
  v8 = *(id *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 80);
  v13 = v10;
  v17 = v10;
  v21 = v11;
  v22 = v12;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, v14);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a3 = 1;

}

BOOL __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_deleteMessages:connection:", *(_QWORD *)(a1 + 48), v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += objc_msgSend(*(id *)(a1 + 48), "count");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == *(_QWORD *)(a1 + 88))
    {
      objc_msgSend(*(id *)(a1 + 56), "persistenceIsDeletingAllMessagesInMailboxWithURL:generationWindow:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
      v4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 0;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __77__MFMailMessageLibrary_removeAllMessagesFromMailbox_removeMailbox_andNotify___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  sqlite3_exec_printf((sqlite3 *)objc_msgSend(v3, "sqlDB"), "DELETE FROM mailboxes WHERE url = '%q'", 0, 0, 0, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  v4 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("deleting mailbox"));

  return v4;
}

- (id)dataPathForMessage:(id)a3 type:(int64_t)a4
{
  void *v4;
  void *v5;

  -[MFMailMessageLibrary dataFileURLForMessage:type:](self, "dataFileURLForMessage:type:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataFileURLForMessage:(id)a3 type:(int64_t)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v6 = CFSTR("full.emlx");
  if (a4 == 1)
    v6 = CFSTR("partial.emlx");
  if (a4 == 2)
    v6 = CFSTR("headers.emlx");
  v7 = v6;
  -[MFMailMessageLibrary dataDirectoryURLForMessage:](self, "dataDirectoryURLForMessage:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dataDirectoryURLForMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[MFMailMessageLibrary bodyMigrator](self, "bodyMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "migrateBodyForMessageIfNecessary:", v4);

  v6 = objc_msgSend(v4, "globalMessageID");
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary messageBasePathForAccount:](self, "messageBasePathForAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EB20], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v6, v8, objc_msgSend(v7, "supportsPurge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dataPathForMessage:(id)a3
{
  -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataPathForMessage:(id)a3 part:(id)a4
{
  _dataPathForMessageAndPart(self, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)deleteAttachmentsForMessage:(id)a3 inMailboxFileURL:(id)a4
{
  id v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attachmentsForMessage:withSchemes:", v4, 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(v4, "storageLocationForAttachment:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_msgSend(v11, "fileSize");
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeItemAtPath:error:", v9, 0);

          v5 += v12;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }

  EDLibraryLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v24 = v5;
    v25 = 2114;
    v26 = v15;
    _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Deleted %lld bytes of attachments for message %{public}@", buf, 0x16u);

  }
  return v5;
}

- (id)fileAttributesForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v6;
  }
  else
  {
    -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "attributesOfItemAtPath:error:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

- (void)fileURLForAttachmentPersistentID:(id)a3 messageID:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFMailMessageLibrary messageWithLibraryID:options:inMailbox:](self, "messageWithLibraryID:options:inMailbox:", (int)objc_msgSend(v9, "intValue"), 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v11, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary messageBasePathForAccount:](self, "messageBasePathForAccount:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistenceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attachmentURLForMessageAttachmentID:basePath:", v8, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 || !v11)
  {
LABEL_8:
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isReadableFileAtPath:", v20);

  if (!v21)
  {
    EDLibraryLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Unable to read attachment at URL %@", (uint8_t *)&v23, 0xCu);
    }

    goto LABEL_8;
  }
  (*((void (**)(id, void *, void *))v10 + 2))(v10, v18, v11);
LABEL_9:

}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4
{
  id v6;
  id v7;
  _MFDataCollector *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[_MFDataCollector initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:]([_MFDataCollector alloc], "initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:", self, v6, v7, 0, 0, 0, 0);

  return v8;
}

- (id)dataConsumerForMessage:(id)a3 part:(id)a4 incomplete:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _MFDataCollector *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[_MFDataCollector initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:]([_MFDataCollector alloc], "initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:", self, v8, v9, 0, v5, 0, 0);

  return v10;
}

- (id)dataConsumerForMessage:(id)a3 isPartial:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _MFDataCollector *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[_MFDataCollector initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:]([_MFDataCollector alloc], "initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:", self, v6, 0, v4, 0, 0, 0);

  return v7;
}

- (id)dataConsumerForMessage:(id)a3
{
  id v4;
  _MFDataCollector *v5;

  v4 = a3;
  v5 = -[_MFDataCollector initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:]([_MFDataCollector alloc], "initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:", self, v4, 0, 0, 0, 0, 0);

  return v5;
}

- (void)_writeData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
  +[_MFDataCollector writeData:library:message:isPartial:](_MFDataCollector, "writeData:library:message:isPartial:", a3, self, a4, a5);
}

- (OS_dispatch_queue)mimePartParallelCompressionQueue
{
  return self->_parallelCompressionQueue;
}

- (id)existingMIMEPartsForMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[MFMailMessageLibrary dataDirectoryURLForMessage:](self, "dataDirectoryURLForMessage:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v4 = *MEMORY[0x1E0C99A90];
  v26[0] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v19, v5, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20 = 0;
          v13 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v20, v4, 0, v19);
          v14 = v20;
          v15 = v14;
          if (v14)
            v16 = v13;
          else
            v16 = 0;
          if ((v16 & 1) != 0)
          {
            mimePartFromFilename(v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v7, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)downloadedMessageDataForMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  -[MFMailMessageLibrary dataFileURLForMessage:type:](self, "dataFileURLForMessage:type:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0);

  if (!v6)
  {
    -[MFMailMessageLibrary existingMIMEPartsForMessage:](self, "existingMIMEPartsForMessage:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary dataFileURLForMessage:type:](self, "dataFileURLForMessage:type:", v4, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    mappedDispatchDataFromFileURL(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EB98]), "initWithHeadersOnlyData:partialMessageData:hasFullMessageData:hasPartialMessageData:mimeParts:", 0, v11, 0, 1, v9);
    }
    else
    {
      if (!objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", 0))
      {
        -[MFMailMessageLibrary dataFileURLForMessage:type:](self, "dataFileURLForMessage:type:", v4, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        mappedDispatchDataFromFileURL(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EB98]), "initWithHeadersOnlyData:partialMessageData:hasFullMessageData:hasPartialMessageData:mimeParts:", v15, 0, 0, 0, v9);
        else
          v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EB98]), "initWithHeadersOnlyData:partialMessageData:hasFullMessageData:hasPartialMessageData:mimeParts:", 0, 0, 0, 0, v9);
        v8 = (void *)v16;

        goto LABEL_8;
      }
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EB98]), "initWithHeadersOnlyData:partialMessageData:hasFullMessageData:hasPartialMessageData:mimeParts:", 0, 0, 0, 1, v9);
    }
    v8 = (void *)v12;
LABEL_8:

    goto LABEL_9;
  }
  v7 = objc_alloc(MEMORY[0x1E0D1EB98]);
  v8 = (void *)objc_msgSend(v7, "initWithHeadersOnlyData:partialMessageData:hasFullMessageData:hasPartialMessageData:mimeParts:", 0, 0, 1, 0, MEMORY[0x1E0C9AA60]);
LABEL_9:

  return v8;
}

- (void)setData:(id)a3 forMessage:(id)a4 isPartial:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSCache *messagesParsedCache;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSCache *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v5 = a5;
  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v5)
  {
    messagesParsedCache = self->_messagesParsedCache;
    objc_msgSend(v9, "persistentID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](messagesParsedCache, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      EDLibraryLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "ef_publicDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailMessageLibrary setData:forMessage:isPartial:].cold.1(v15, (uint64_t)v20, v14);
      }

    }
    else
    {
      v16 = self->_messagesParsedCache;
      objc_msgSend(v10, "persistentID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v17);

      -[MFMailMessageLibrary storeRemoteContentLinksFromFullData:forMessage:](self, "storeRemoteContentLinksFromFullData:forMessage:", v8, v10);
    }
  }
  -[MFMailMessageLibrary _writeData:forMessage:isPartial:](self, "_writeData:forMessage:isPartial:", v8, v10, v5);
  if (!v5)
  {
    -[MFMailMessageLibrary dataDirectoryURLForMessage:](self, "dataDirectoryURLForMessage:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary _removeEmlxFilesOfTypeLessThanType:inDirectory:](self, "_removeEmlxFilesOfTypeLessThanType:inDirectory:", 0, v19);

  }
}

- (void)setData:(id)a3 forMessageToAppend:(id)a4
{
  -[MFMailMessageLibrary _writeData:forMessage:isPartial:](self, "_writeData:forMessage:isPartial:", a3, a4, 0);
}

- (BOOL)_setMessageData:(id)a3 libraryID:(int64_t)a4 part:(id)a5 partial:(BOOL)a6 complete:(BOOL)a7 connection:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  sqlite3_int64 v21;
  int v22;
  const __CFString *v23;
  id v24;
  sqlite3_stmt *v25;
  int v26;
  const char *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  sqlite3_int64 insert_rowid;
  BOOL v36;
  id v38;
  char *v39;
  char *v40;
  void *v41;
  void *v42;
  void *v43;

  v9 = a7;
  v10 = a6;
  v15 = a3;
  v16 = a5;
  v17 = a8;
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("summary")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 5824, CFSTR("Attempting to store summary in protected message data table"));

  }
  objc_msgSend(v17, "preparedStatementForQueryString:", CFSTR("SELECT rowid FROM message_data WHERE message_id = ? AND part = ?"));
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (sqlite3_stmt *)objc_msgSend(v18, "compiled");

  sqlite3_bind_int64(v19, 1, a4);
  v20 = objc_retainAutorelease(v16);
  sqlite3_bind_text(v19, 2, (const char *)objc_msgSend(v20, "UTF8String"), -1, 0);
  if (sqlite3_step(v19) == 100)
    v21 = sqlite3_column_int64(v19, 0);
  else
    v21 = 0;
  sqlite3_reset(v19);
  v22 = objc_msgSend(v17, "checkForConnectionErrorWithMessage:", CFSTR("searching for existing message_data entry")) ^ 1;
  if ((v22 & 1) != 0)
    goto LABEL_33;
  if (v21)
    v23 = CFSTR("UPDATE message_data SET message_id = :message_id, part = :part, partial = :partial, complete = :complete, length = :length WHERE rowid = :rowid");
  else
    v23 = CFSTR("INSERT INTO message_data (message_id, part, partial, complete, length) VALUES (:message_id, :part, :partial, :complete, :length)");
  objc_msgSend(v17, "preparedStatementForQueryString:", v23);
  v43 = v15;
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = (sqlite3_stmt *)objc_msgSend(v24, "compiled");

  if (v25)
  {
    v15 = v43;
    v26 = sqlite3_bind_parameter_index(v25, ":message_id");
    sqlite3_bind_int64(v25, v26, a4);
    v27 = (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    v28 = sqlite3_bind_parameter_index(v25, ":part");
    if (v27)
      sqlite3_bind_text(v25, v28, v27, -1, 0);
    else
      sqlite3_bind_null(v25, v28);
    v29 = sqlite3_bind_parameter_index(v25, ":partial");
    if (v10)
      sqlite3_bind_int(v25, v29, 1);
    else
      sqlite3_bind_null(v25, v29);
    v30 = sqlite3_bind_parameter_index(v25, ":complete");
    if (v9)
      sqlite3_bind_int(v25, v30, 1);
    else
      sqlite3_bind_null(v25, v30);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = sqlite3_bind_parameter_index(v25, ":length");
      sqlite3_bind_int(v25, v31, objc_msgSend(v43, "length"));
    }
    else
    {
      v32 = sqlite3_bind_parameter_index(v25, ":length");
      sqlite3_bind_null(v25, v32);
    }
    if (v21)
    {
      v33 = sqlite3_bind_parameter_index(v25, ":rowid");
      sqlite3_bind_int64(v25, v33, v21);
    }
    v34 = sqlite3_step(v25);
    if (v34 == 101)
    {
      insert_rowid = v21;
    }
    else
    {
      LOBYTE(v22) = 1;
      insert_rowid = 0xAAAAAAAAAAAAAAAALL;
    }
    if (!v21 && v34 == 101)
    {
      insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(v17, "sqlDB"));
      LOBYTE(v22) = 0;
    }
    sqlite3_reset(v25);
    objc_msgSend(v17, "checkForConnectionErrorWithMessage:", CFSTR("inserting message data (unprotected)"));
    if ((v22 & 1) != 0)
      goto LABEL_33;
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v43, "ef_hexString");
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v39 = sqlite3_mprintf("INSERT OR REPLACE INTO protected_message_data (ROWID, data) VALUES (%lld, X'%s');",
                insert_rowid,
                (const char *)objc_msgSend(v38, "cStringUsingEncoding:", 1));

        if (!v39)
          goto LABEL_44;
        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_44:
        v36 = 1;
        goto LABEL_34;
      }
      v40 = sqlite3_mprintf("INSERT OR REPLACE INTO protected_message_data (ROWID, data) VALUES (%lld, %Q);",
              insert_rowid,
              objc_msgSend(objc_retainAutorelease(v43), "UTF8String"));
    }
    else
    {
      v40 = sqlite3_mprintf("INSERT OR REPLACE INTO protected_message_data (ROWID, data) VALUES (%lld, NULL);",
              insert_rowid);
    }
    v39 = v40;
    if (v40)
    {
LABEL_43:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "executeStatementString:errorMessage:", v41, CFSTR("Inserting into protected_message_data"));

      sqlite3_free(v39);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  v15 = v43;
  objc_msgSend(v17, "checkForConnectionErrorWithMessage:", CFSTR("preparing insert statement"));
LABEL_33:
  v36 = 0;
LABEL_34:

  return v36;
}

- (void)setSummary:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t v24[32];
  uint8_t buf[4];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
    -[MFMailMessageLibrary database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary setSummary:forMessage:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __46__MFMailMessageLibrary_setSummary_forMessage___block_invoke;
    v21[3] = &unk_1E4E8A6C0;
    v21[4] = self;
    v22 = v6;
    v12 = v7;
    v23 = v12;
    objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, v21);

    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v12, "libraryID");
      *(_DWORD *)buf = 134217984;
      v26 = v14;
      _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Summary updated for %lld", buf, 0xCu);
    }

    -[MFMailMessageLibrary hookRegistry](self, "hookRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = *MEMORY[0x1E0D1E650];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "persistenceDidUpdateProperties:message:generationWindow:", v16, v12, v9);

  }
  else
  {
    EDLibraryLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageStore");
      objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary setSummary:forMessage:].cold.2();
    }

    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isInternal") & 1) != 0)
    {

    }
    else
    {
      v19 = EFIsSeedBuild();

      if ((v19 & 1) == 0)
        goto LABEL_6;
    }
    EDLibraryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "messageStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary setSummary:forMessage:].cold.1((uint64_t)v7, v20, v24, v9);
    }
  }

LABEL_6:
}

uint64_t __46__MFMailMessageLibrary_setSummary_forMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_setSummary:forMessageWithRowID:connection:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "libraryID"), v3);

  return v4;
}

- (BOOL)_setSummary:(id)a3 forMessageWithRowID:(int64_t)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[2];
  uint8_t buf[4];
  int64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResult:table:", &unk_1E4F69C58, CFSTR("messages"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWhere:", v13);

  objc_msgSend(v10, "setLimit:", 1);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v29 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__MFMailMessageLibrary__setSummary_forMessageWithRowID_connection___block_invoke;
  v30[3] = &unk_1E4E8A268;
  v30[4] = &v31;
  LOBYTE(v12) = objc_msgSend(v9, "executeSelectStatement:withBlock:error:", v10, v30, &v29);
  v14 = v29;
  if ((v12 & 1) != 0)
  {
    if (*((_BYTE *)v32 + 24))
    {
      EDLibraryLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isInternal"))
          objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForSubjectOrSummary:", v8);
        else
          objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v37 = a4;
        v38 = 2112;
        v39 = v20;
        _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Updating summary for message with row ID: %lld; summary: %@",
          buf,
          0x16u);

      }
      objc_msgSend(v8, "ef_UTF8ConvertibleString");
      v27 = objc_claimAutoreleasedReturnValue();

      v21 = -[MFMailMessageLibrary _findOrCreateDatabaseIDForSummary:cache:connection:](self, "_findOrCreateDatabaseIDForSummary:cache:connection:", v27, 0, v9);
      objc_msgSend(v9, "preparedStatementForQueryString:", CFSTR("UPDATE messages SET summary = ? WHERE ROWID = ?"));
      v18 = objc_claimAutoreleasedReturnValue();

      if (v21 == *MEMORY[0x1E0D1DC08])
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
      else
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v17 = -[NSObject executeWithIndexedBindings:usingBlock:error:](v18, "executeWithIndexedBindings:usingBlock:error:", v24, 0, &v28);
      v14 = v28;

      if ((v17 & 1) == 0)
        objc_msgSend(v9, "handleError:message:", v14, CFSTR("Setting summary"));
      v8 = (id)v27;
    }
    else
    {
      EDLibraryLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v17 = 1;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isInternal"))
          objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForSubjectOrSummary:", v8);
        else
          objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v37 = a4;
        v38 = 2112;
        v39 = v25;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, "Skipping summary update for non-existent message with row ID: %lld; summary: %@",
          buf,
          0x16u);

        v17 = 1;
      }
    }

  }
  else
  {
    objc_msgSend(v9, "handleError:message:", v14, CFSTR("Checking for message existence when setting summary"));
    v17 = 0;
  }
  _Block_object_dispose(&v31, 8);

  return v17;
}

uint64_t __67__MFMailMessageLibrary__setSummary_forMessageWithRowID_connection___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)loadData:(id)a3 forMessage:(id)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("summary")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 5958, CFSTR("Attempting to load summary from protected message data table"));

  }
  EDLibraryLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "Fetching partName: %@ for message: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary loadData:forMessage:usingBlock:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke;
  v21[3] = &unk_1E4E8AB70;
  v21[4] = self;
  v15 = v10;
  v22 = v15;
  v16 = v9;
  v23 = v16;
  v25 = buf;
  v17 = v11;
  v24 = v17;
  objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v21);

  v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v18;
}

uint64_t __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char v11;
  id v12;
  uint64_t v13;
  __int128 v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  __int128 v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3))
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT data FROM protected_message_data WHERE ROWID = (SELECT ROWID FROM message_data WHERE message_id = ? AND part = ?)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "libraryID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    v6 = *(void **)(a1 + 48);
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_2;
    v17[3] = &unk_1E4E8AB48;
    v15 = *(_OWORD *)(a1 + 56);
    v9 = (id)v15;
    v20 = v15;
    v18 = *(id *)(a1 + 48);
    v10 = v4;
    v19 = v10;
    v16 = 0;
    v11 = -[NSObject executeWithIndexedBindings:usingBlock:error:](v10, "executeWithIndexedBindings:usingBlock:error:", v8, v17, &v16);
    v12 = v16;

    if (!v6)
    if ((v11 & 1) == 0)
      objc_msgSend(v3, "handleError:message:", v12, CFSTR("Fetching message data"));

  }
  else
  {
    EDLibraryLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_cold_1(a1, v10, v13);
  }

  return 1;
}

void __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  EDLibraryLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "originalString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v11;

  }
}

- (id)loadMeetingDataForMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MFMailMessageLibrary_loadMeetingDataForMessage___block_invoke;
  v8[3] = &unk_1E4E8AB98;
  v9 = v4;
  v5 = v4;
  -[MFMailMessageLibrary loadData:forMessage:usingBlock:](self, "loadData:forMessage:usingBlock:", CFSTR("meeting data"), v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__MFMailMessageLibrary_loadMeetingDataForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EDLibraryLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "Loaded Meeting data %@ for message : %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__MFMailMessageLibrary_loadMeetingExternalIDForMessage___block_invoke;
  v8[3] = &unk_1E4E8AB98;
  v9 = v4;
  v5 = v4;
  -[MFMailMessageLibrary loadData:forMessage:usingBlock:](self, "loadData:forMessage:usingBlock:", CFSTR("meeting"), v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MFMailMessageLibrary_loadMeetingExternalIDForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  EDLibraryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "Loaded Exchange Calendar externalID: %@ for message: %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MFMailMessageLibrary_loadMeetingMetadataForMessage___block_invoke;
  v8[3] = &unk_1E4E8AB98;
  v9 = v4;
  v5 = v4;
  -[MFMailMessageLibrary loadData:forMessage:usingBlock:](self, "loadData:forMessage:usingBlock:", CFSTR("meeting metadata"), v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __54__MFMailMessageLibrary_loadMeetingMetadataForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    EDLibraryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "Loaded Exchange Calendar meeting data %@ for message : %@", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bodyDataAtPath:(id)a3 headerData:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v14[0] = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithContentsOfFile:options:error:", v5, 3, v14);
    v7 = v14[0];
    v8 = v7;
    if (v6)
    {
      if (objc_msgSend(v6, "length"))
      {
        _bodyDataFromData(v6, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      v9 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0CB28A8]))
    {
      v11 = objc_msgSend(v8, "code") == 260;

      if (v11)
        goto LABEL_13;
    }
    else
    {

    }
    EDLibraryLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "fullyOrPartiallyRedactedStringForString:", v5);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary bodyDataAtPath:headerData:].cold.1();
    }

    goto LABEL_13;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)updateUnprefixedSubjectTo:(id)a3 forMessage:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  MFMailMessageLibrary *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 6054, CFSTR("Updating the subject but FF is not enabled"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0D1EB70]);
  -[MFMailMessageLibrary database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary updateUnprefixedSubjectTo:forMessage:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __61__MFMailMessageLibrary_updateUnprefixedSubjectTo_forMessage___block_invoke;
  v21 = &unk_1E4E8A670;
  v12 = v9;
  v22 = v12;
  v13 = v8;
  v23 = v13;
  v24 = self;
  v14 = v7;
  v25 = v14;
  objc_msgSend(v10, "__performWriteWithCaller:usingBlock:", v11, &v18);

  -[MFMailMessageLibrary hookRegistry](self, "hookRegistry", v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = *MEMORY[0x1E0D1E648];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "persistenceDidUpdateProperties:message:generationWindow:", v16, v13, v12);

}

uint64_t __61__MFMailMessageLibrary_updateUnprefixedSubjectTo_forMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertGeneration:", objc_msgSend(v3, "transactionGeneration"));
  v4 = objc_msgSend(*(id *)(a1 + 40), "libraryID");
  v5 = objc_msgSend(*(id *)(a1 + 48), "_subjectIDForMessageWithLibraryID:connection:", v4, v3);
  if (!v5
    || (objc_msgSend(*(id *)(a1 + 48), "_isSubjectIDUsedByOtherMessages:besidesMessageWithDatabaseID:connection:", v5, v4, v3) & 1) != 0|| ((v10 = 0, v6 = objc_msgSend(*(id *)(a1 + 48), "_updateSubjectWithRowID:to:connection:outSubjectAlreadyExists:", v5, *(_QWORD *)(a1 + 56), v3, &v10), v7 = v6, !v10)? (v8 = 1): (v8 = v6), (v8 & 1) == 0))
  {
    v7 = objc_msgSend(*(id *)(a1 + 48), "_updateSubjectForMessageWithLibraryID:to:connection:", v4, *(_QWORD *)(a1 + 56), v3);
  }

  return v7;
}

- (int64_t)_subjectIDForMessageWithLibraryID:(int64_t)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int64_t v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = *MEMORY[0x1E0D1DC08];
  objc_msgSend(v5, "preparedStatementForQueryString:", CFSTR("SELECT messages.subject, subjects.subject FROM messages LEFT OUTER JOIN subjects ON messages.subject = subjects.ROWID WHERE messages.ROWID = ?"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__MFMailMessageLibrary__subjectIDForMessageWithLibraryID_connection___block_invoke;
  v14[3] = &unk_1E4E8A268;
  v14[4] = &v15;
  v9 = objc_msgSend(v6, "executeWithIndexedBindings:usingBlock:error:", v8, v14, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
    objc_msgSend(v5, "handleError:message:", v10, CFSTR("finding subject for message"));
  v11 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __69__MFMailMessageLibrary__subjectIDForMessageWithLibraryID_connection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "databaseIDValue");

  *a4 = 1;
}

- (BOOL)_isSubjectIDUsedByOtherMessages:(int64_t)a3 besidesMessageWithDatabaseID:(int64_t)a4 connection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  BOOL v14;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v7, "preparedStatementForQueryString:", CFSTR("SELECT ROWID FROM messages WHERE messages.subject = ? AND ROWID != ? LIMIT 1"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__MFMailMessageLibrary__isSubjectIDUsedByOtherMessages_besidesMessageWithDatabaseID_connection___block_invoke;
  v17[3] = &unk_1E4E8A268;
  v17[4] = &v18;
  v12 = objc_msgSend(v8, "executeWithIndexedBindings:usingBlock:error:", v11, v17, &v16);
  v13 = v16;

  if ((v12 & 1) == 0)
    objc_msgSend(v7, "handleError:message:", v13, CFSTR("finding message using same subject"));
  v14 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __96__MFMailMessageLibrary__isSubjectIDUsedByOtherMessages_besidesMessageWithDatabaseID_connection___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (BOOL)_updateSubjectWithRowID:(int64_t)a3 to:(id)a4 connection:(id)a5 outSubjectAlreadyExists:(BOOL *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("subjects"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("subject"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "equalTo:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWhereClause:", v14);

  v21 = 0;
  v15 = objc_msgSend(v10, "executeUpdateStatement:error:", v11, &v21);
  v16 = v21;
  v17 = v16;
  if ((v15 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v16, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D1EE10]))
      v18 = objc_msgSend(v17, "code") == 19;
    else
      v18 = 0;

    objc_msgSend(v10, "handleError:message:", v17, CFSTR("Updating subject"));
  }
  if (a6)
    *a6 = v18;

  return v15;
}

- (BOOL)_updateSubjectForMessageWithLibraryID:(int64_t)a3 to:(id)a4 connection:(id)a5
{
  id v8;
  int64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;

  v8 = a5;
  v9 = -[MFMailMessageLibrary _findOrCreateDatabaseIDForSubject:cache:connection:](self, "_findOrCreateDatabaseIDForSubject:cache:connection:", a4, 0, v8);
  if (v9 == *MEMORY[0x1E0D1DC08])
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("messages"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("subject"));

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "equalTo:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWhereClause:", v15);

    v18 = 0;
    v10 = objc_msgSend(v8, "executeUpdateStatement:error:", v11, &v18);
    v16 = v18;
    if ((v10 & 1) == 0)
      objc_msgSend(v8, "handleError:message:", v16, CFSTR("Setting subject ID"));

  }
  return v10;
}

- (id)headerDataAtPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithContentsOfFile:options:error:", v3, 3, 0);
  else
    v4 = 0;
  if (objc_msgSend(v4, "length") && (v6 = objc_msgSend(v4, "mf_rangeOfRFC822HeaderData"), v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "mf_subdataWithRange:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  -[MFMailMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:](self, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5
{
  -[MFMailMessageLibrary bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:isPartial:](self, "bodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:isPartial:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 isPartial:(BOOL *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MFMailMessageLibrary bodyDataAtPath:headerData:](self, "bodyDataAtPath:headerData:", v11, a4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v11;
      v15 = (void *)v12;
LABEL_4:
      if (a5)
        *a5 = 1;
      if (a6)
        *a6 = v13 == 0;
      MFLogGeneral();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v15, "length");
        objc_msgSend(v10, "ef_publicDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134218242;
        v23 = v17;
        v24 = 2114;
        v25 = v18;
        _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_INFO, "#CacheLoads body data from file of length %lu for message %{public}@", (uint8_t *)&v22, 0x16u);

      }
      goto LABEL_19;
    }
    -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[MFMailMessageLibrary bodyDataAtPath:headerData:](self, "bodyDataAtPath:headerData:", v14, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_4;
    }
  }
  else
  {
    v14 = 0;
  }
  _dataForMessageAndPart(self, v10, 0, 1, (uint64_t)a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    _bodyDataFromData(v19, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = 0;
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)headerDataForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v4 = a3;
  _dataForMessageAndPart(self, v4, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (v13 = 0,
        v7 = _bodyDataFromData(v5, &v13),
        (v8 = v13) == 0))
  {
    -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9
      || (-[MFMailMessageLibrary headerDataAtPath:](self, "headerDataAtPath:", v9),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          v9,
          !v8))
    {
      -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v4, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (-[MFMailMessageLibrary headerDataAtPath:](self, "headerDataAtPath:", v10),
            v8 = (id)objc_claimAutoreleasedReturnValue(),
            v10,
            !v8))
      {
        -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v4, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[MFMailMessageLibrary headerDataAtPath:](self, "headerDataAtPath:", v11);
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }

      }
    }
  }

  return v8;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  _dataForMessageAndPart(self, v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (_bodyDataFromData(v7, a4), v9 = objc_claimAutoreleasedReturnValue(), v8, (v10 = (void *)v9) == 0))
  {
    -[MFMailMessageLibrary dataPathForMessage:](self, "dataPathForMessage:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[MFMailMessageLibrary bodyDataAtPath:headerData:](self, "bodyDataAtPath:headerData:", v11, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordTransportType:", 1);

  return v10;
}

- (id)dataForMimePart:(id)a3 isComplete:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "mimeBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "partNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _dataForMessageAndPart(self, v8, v9, 1, (uint64_t)a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v6, "partNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _dataPathForMessageAndPart(self, v8, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v20 = 0;
        objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfFile:options:error:", v12, 3, &v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v20;
        if (v10)
        {
          if (a4)
            *a4 = 1;
          MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = objc_msgSend(v10, "length");
            objc_msgSend(v8, "ef_publicDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "partNumber");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v22 = v15;
            v23 = 2114;
            v24 = v16;
            v25 = 2114;
            v26 = v17;
            _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, "#CacheLoads data from file of length %lu for message %{public}@ part %{public}@", buf, 0x20u);

          }
        }
        else
        {
          MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "ef_publicDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMailMessageLibrary dataForMimePart:isComplete:].cold.1((uint64_t)v12, v18, (uint64_t)buf);
          }
        }

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(v4, "mimeBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailMessageLibrary database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary hasCompleteDataForMimePart:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __51__MFMailMessageLibrary_hasCompleteDataForMimePart___block_invoke;
  v20 = &unk_1E4E8ABC0;
  v9 = v6;
  v21 = v9;
  v10 = v4;
  v22 = v10;
  v23 = &v25;
  v24 = &v29;
  objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, &v17);

  if (!*((_BYTE *)v26 + 24))
  {
    objc_msgSend(v10, "partNumber", v17, v18, v19, v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _dataPathForMessageAndPart(self, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);
      *((_BYTE *)v30 + 24) = v14;

    }
  }
  v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __51__MFMailMessageLibrary_hasCompleteDataForMimePart___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT complete FROM message_data WHERE message_id = ? and part = ?"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_int64(v5, 1, objc_msgSend(*(id *)(a1 + 32), "libraryID"));
    objc_msgSend(*(id *)(a1 + 40), "partNumber");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(v6, "UTF8String"), -1, 0);

    if (sqlite3_step(v5) == 100)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_column_int(v5, 0) != 0;
    }
    sqlite3_reset(v5);
  }

  return 1;
}

- (BOOL)areMessageContentsLocallyAvailable:(id)a3 fullContentsAvailble:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary dataPathForMessage:](self, "dataPathForMessage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (v9)
  {
    v10 = v27;
    *((_BYTE *)v27 + 24) = 1;
    if (a4)
      *a4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary dataPathForMessage:type:](self, "dataPathForMessage:type:", v6, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if (v13)
    {
      v10 = v27;
      *((_BYTE *)v27 + 24) = 1;
      if (a4)
        *a4 = 0;
    }
    else
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      -[MFMailMessageLibrary database](self, "database");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary areMessageContentsLocallyAvailable:fullContentsAvailble:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke;
      v18[3] = &unk_1E4E8AC10;
      v19 = v6;
      v20 = &v26;
      v21 = &v22;
      objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v18);

      if (a4)
        *a4 = *((_BYTE *)v23 + 24);

      _Block_object_dispose(&v22, 8);
      v10 = v27;
    }
  }
  v16 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v26, 8);

  return v16;
}

uint64_t __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT length, complete, partial FROM message_data WHERE message_id = ? AND part IS NULL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "libraryID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke_2;
  v11[3] = &unk_1E4E8ABE8;
  v12 = *(_OWORD *)(a1 + 40);
  v7 = objc_msgSend(v4, "executeWithIndexedBindings:usingBlock:error:", v6, v11, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("checking message_data"));

  return v7;
}

void __80__MFMailMessageLibrary_areMessageContentsLocallyAvailable_fullContentsAvailble___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "integerValue") > 0;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("complete"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "BOOLValue"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("partial"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "BOOLValue") ^ 1;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

  *a4 = 1;
}

- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 isSubquery:(BOOL)a7
{
  -[MFMailMessageLibrary queryForCriterion:connection:options:baseTable:isSubquery:range:](self, "queryForCriterion:connection:options:baseTable:isSubquery:range:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, 0, 0x7FFFFFFFFFFFFFFFLL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)queryForCriterion:(id)a3 connection:(id)a4 options:(unsigned int)a5
{
  -[MFMailMessageLibrary queryForCriterion:connection:options:baseTable:isSubquery:range:](self, "queryForCriterion:connection:options:baseTable:isSubquery:range:", a3, a4, *(_QWORD *)&a5, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6 range:(_NSRange)a7
{
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:success:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7.location, a7.length, 0);
}

- (void)sendMessagesMatchingCriterion:(id)a3 to:(id)a4 options:(unsigned int)a5 baseTable:(unsigned int)a6
{
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:success:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)_iterateMessagesWithResultHandler:(id)a3 options:(unsigned int)a4 monitor:(id)a5 sqlQueryGenerator:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  unsigned int v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[MFMailMessageLibrary database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _iterateMessagesWithResultHandler:options:monitor:sqlQueryGenerator:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke;
  v19[3] = &unk_1E4E8AC88;
  v16 = v13;
  v22 = v16;
  v19[4] = self;
  v24 = a4;
  v18 = v11;
  v20 = v18;
  v17 = v12;
  v21 = v17;
  v23 = a2;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v19);

}

uint64_t __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CFAbsoluteTime Current;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  id v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "preparedStatementForQueryString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v9 = 0;
    v10 = 0;
    v8 = 0;
    v12 = mach_absolute_time();
    objc_storeStrong(&v8, *(id *)(a1 + 32));

    v6 = v10;
    v9 = 0;
    v10 = 0;

    v11 = 0x3F000000000003E8;
    v14 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    v15 = *(_DWORD *)(a1 + 72);
    v16 = objc_msgSend(v3, "sqlDB", v8);
    objc_storeStrong(&v18, *(id *)(a1 + 40));
    v17 = objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
    v19 = objc_opt_respondsToSelector() & 1;
    objc_msgSend(*(id *)(a1 + 32), "_iterateStatement:connection:withProgressMonitor:andRowHandler:context:", v5, v3, *(_QWORD *)(a1 + 48), handleIterativeSearchRow, &v8);
    __destructor_8_s0_s8_s16_s72(&v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3);
    EDLibraryLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      objc_claimAutoreleasedReturnValue();
      __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke_cold_1();
    }
  }

  return 1;
}

- (void)iterateMessagesMatchingCriterion:(id)a3 withResultHandler:(id)a4 options:(unsigned int)a5 withMonitor:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int v14;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__MFMailMessageLibrary_iterateMessagesMatchingCriterion_withResultHandler_options_withMonitor___block_invoke;
  v12[3] = &unk_1E4E8ACB0;
  v12[4] = self;
  v13 = v10;
  v14 = v7;
  v11 = v10;
  -[MFMailMessageLibrary _iterateMessagesWithResultHandler:options:monitor:sqlQueryGenerator:](self, "_iterateMessagesWithResultHandler:options:monitor:sqlQueryGenerator:", a4, v7, a6, v12);

}

id __95__MFMailMessageLibrary_iterateMessagesMatchingCriterion_withResultHandler_options_withMonitor___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "queryForCriterion:connection:options:", *(_QWORD *)(a1 + 40), a2, *(unsigned int *)(a1 + 48));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)iterateMessagesMatchingCriterion:(id)a3 options:(unsigned int)a4 handler:(id)a5
{
  uint64_t v6;
  id v8;
  _MFBlockIterationHandler *v9;
  id v10;

  v6 = *(_QWORD *)&a4;
  v10 = a3;
  v8 = a5;
  v9 = -[_MFBlockIterationHandler initWithBlock:]([_MFBlockIterationHandler alloc], "initWithBlock:", v8);
  -[MFMailMessageLibrary iterateMessagesMatchingCriterion:withResultHandler:options:withMonitor:](self, "iterateMessagesMatchingCriterion:withResultHandler:options:withMonitor:", v10, v9, v6, v9);

}

- (id)messagesMatchingCriterion:(id)a3 options:(unsigned int)a4 range:(_NSRange)a5 success:(BOOL *)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  id v11;
  _MFMessageCollector *v12;
  void *v13;

  length = a5.length;
  location = a5.location;
  v9 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = objc_alloc_init(_MFMessageCollector);
  -[MFMailMessageLibrary sendMessagesMatchingCriterion:to:options:baseTable:range:success:](self, "sendMessagesMatchingCriterion:to:options:baseTable:range:success:", v11, v12, v9, 0, location, length, a6);
  -[_MFMessageCollector messages](v12, "messages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)filterContiguousMessages:(id)a3 forCriterion:(id)a4 options:(unsigned int)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  MFMessageCriterion *v13;
  void *v14;
  MFMessageCriterion *v15;
  void *v16;
  MFMessageCriterion *v17;
  MFMessageCriterion *v18;
  void *v19;
  MFMessageCriterion *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "libraryID");

    objc_msgSend(v7, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "libraryID");

    v13 = objc_alloc_init(MFMessageCriterion);
    -[MFMessageCriterion setCriterionType:](v13, "setCriterionType:", 25);
    -[MFMessageCriterion setAllCriteriaMustBeSatisfied:](v13, "setAllCriteriaMustBeSatisfied:", 1);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, 0);
    v15 = [MFMessageCriterion alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v10 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MFMessageCriterion initWithType:qualifier:expression:](v15, "initWithType:qualifier:expression:", 24, 6, v16);

    objc_msgSend(v14, "addObject:", v17);
    v18 = [MFMessageCriterion alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v12 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MFMessageCriterion initWithType:qualifier:expression:](v18, "initWithType:qualifier:expression:", 24, 5, v19);

    objc_msgSend(v14, "addObject:", v20);
    -[MFMessageCriterion setCriteria:](v13, "setCriteria:", v14);
    -[MFMailMessageLibrary messagesMatchingCriterion:options:](self, "messagesMatchingCriterion:options:", v13, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)deleteAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  __CFString *v9;
  id v10;

  v4 = a3;
  -[MFMailMessageLibrary invalidateAccount:](self, "invalidateAccount:", v4);
  -[MFMailMessageLibrary database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary deleteAccount:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__MFMailMessageLibrary_deleteAccount___block_invoke;
  v8[3] = &unk_1E4E8A760;
  v9 = CFSTR("DELETE FROM accounts WHERE text_id = ?");
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

}

uint64_t __38__MFMailMessageLibrary_deleteAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  id v6;
  const char *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");

    v8 = strlen(v7);
    sqlite3_bind_text(v5, 1, v7, v8, 0);
    sqlite3_step(v5);
    sqlite3_reset(v5);
  }
  v9 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("deleting an account entry"));

  return v9;
}

- (void)prepareToRebuildActiveAccountsClausesAndExpressions
{
  -[NSConditionLock lock](self->_activeAccountsCondition, "lock");
  -[NSConditionLock unlockWithCondition:](self->_activeAccountsCondition, "unlockWithCondition:", 1);
}

- (id)enabledAccountMailboxesExpression
{
  EFSQLValueExpressable *v3;

  -[MFMailMessageLibrary _waitForActiveAccountsRebuild](self, "_waitForActiveAccountsRebuild");
  -[MFMailMessageLibrary mf_lock](self, "mf_lock");
  v3 = self->_enabledAccountMailboxesExpression;
  -[MFMailMessageLibrary mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)deletePOPUID:(id)a3 inMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[MFMailMessageLibrary database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary deletePOPUID:inMailbox:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__MFMailMessageLibrary_deletePOPUID_inMailbox___block_invoke;
  v12[3] = &unk_1E4E8A760;
  v10 = v7;
  v13 = v10;
  v11 = v6;
  v14 = v11;
  objc_msgSend(v8, "__performWriteWithCaller:usingBlock:", v9, v12);

}

uint64_t __47__MFMailMessageLibrary_deletePOPUID_inMailbox___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("UPDATE pop_uids SET del = 1 WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND uid = ?;"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0);
    sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    sqlite3_step(v5);
  }
  v6 = objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("setting pop_uid.del = 1"));

  return v6;
}

- (id)UIDsToDeleteInMailbox:(id)a3
{
  POPUIDsForQuery(self, CFSTR("SELECT uid FROM pop_uids WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND del NOT NULL;"),
    a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allUIDsInMailbox:(id)a3
{
  POPUIDsForQuery(self, CFSTR("SELECT uid FROM pop_uids WHERE mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?);"),
    a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hiddenPOPUIDsInMailbox:(id)a3
{
  POPUIDsForQuery(self, CFSTR("SELECT uid FROM pop_uids AS uid LEFT OUTER JOIN messages AS message ON uid.mailbox = message.remote_mailbox AND uid.uid = message.remote_id WHERE uid.mailbox = (SELECT ROWID FROM mailboxes WHERE url = ?) AND message.rowid IS NULL OR (message.flags & 2) > 0;"),
    a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)cleanupProtectedTables
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  -[MFMailMessageLibrary database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary cleanupProtectedTables]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke;
  v6[3] = &unk_1E4E8A698;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

BOOL __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Current;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  CFAbsoluteTime v8;
  NSObject *v9;
  _BOOL8 v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isProtectedDataAvailable:", v3))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke_2;
    v12[3] = &unk_1E4E8AD40;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 40);
    v13 = v5;
    v14 = v6;
    objc_msgSend(&unk_1E4F68F38, "enumerateObjectsUsingBlock:", v12);
    EDLibraryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      v16 = v8 - Current;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "cleanupProtectedTables took %.4f seconds", buf, 0xCu);
    }

    v9 = v13;
  }
  else
  {
    EDLibraryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "skipping cleaning up protected tables because protected data is not available", buf, 2u);
    }
  }

  v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  return v10;
}

void __46__MFMailMessageLibrary_cleanupProtectedTables__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  sqlite3_stmt *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "preparedStatementForQueryString:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (sqlite3_stmt *)objc_msgSend(v6, "compiled");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_step(v7) == 101;
  sqlite3_reset(v7);
  objc_msgSend(*(id *)(a1 + 32), "checkForConnectionErrorWithMessage:", CFSTR("cleaning up protected tables"));
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;

}

- (BOOL)_shouldLogDatabaseStats
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LogDatabaseStats"));

  return v3;
}

- (void)_logStatistics
{
  NSObject *statsQueue;
  _QWORD block[5];

  statsQueue = self->_statsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MFMailMessageLibrary__logStatistics__block_invoke;
  block[3] = &unk_1E4E88DC8;
  block[4] = self;
  dispatch_async(statsQueue, block);
}

void __38__MFMailMessageLibrary__logStatistics__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectStatistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "protectedDataAvailable"))
  {
    EDLibraryLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "duration");
      v10 = 134219776;
      v11 = v5;
      v12 = 2048;
      v13 = objc_msgSend(v3, "messagesMarkedAsJournaled");
      v14 = 2048;
      v15 = objc_msgSend(v3, "messages");
      v16 = 2048;
      v17 = objc_msgSend(v3, "messageData");
      v18 = 2048;
      v19 = objc_msgSend(v3, "protectedMessageData");
      v20 = 2048;
      v21 = objc_msgSend(v3, "messagesDeleted");
      v22 = 2048;
      v23 = objc_msgSend(v3, "messageDataDeleted");
      v24 = 2048;
      v25 = objc_msgSend(v3, "mailboxesNeedingReconcilication");
      v6 = "STATS %.2fs j:%lu m:%lu md:%lu pmd:%lu mdel:%lu mddel:%lu mbox:%lu";
      v7 = v4;
      v8 = 82;
LABEL_6:
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else
  {
    EDLibraryLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "duration");
      v10 = 134219520;
      v11 = v9;
      v12 = 2048;
      v13 = objc_msgSend(v3, "messagesMarkedAsJournaled");
      v14 = 2048;
      v15 = objc_msgSend(v3, "messages");
      v16 = 2048;
      v17 = objc_msgSend(v3, "messageData");
      v18 = 2048;
      v19 = objc_msgSend(v3, "messagesDeleted");
      v20 = 2048;
      v21 = objc_msgSend(v3, "messageDataDeleted");
      v22 = 2048;
      v23 = objc_msgSend(v3, "mailboxesNeedingReconcilication");
      v6 = "STATS %.2fs j:%lu m:%lu pm:* md:%lu pmd:* mdel:%lu mddel:%lu mbox:%lu";
      v7 = v4;
      v8 = 72;
      goto LABEL_6;
    }
  }

}

- (void)_schedulePeriodicStatisticsLogging
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[MFMailMessageLibrary _shouldLogDatabaseStats](self, "_shouldLogDatabaseStats"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__MFMailMessageLibrary__schedulePeriodicStatisticsLogging__block_invoke_2;
    v4[3] = &unk_1E4E8ADA8;
    objc_copyWeak(&v5, &location);
    v3 = _Block_copy(v4);
    ef_xpc_activity_register();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __58__MFMailMessageLibrary__schedulePeriodicStatisticsLogging__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807E0]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);

}

void __58__MFMailMessageLibrary__schedulePeriodicStatisticsLogging__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_logStatistics");

}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  BOOL *p_suspendedUnderLock;
  int v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_keyBagQueue);
  if (a3 == 2)
  {
    EDLibraryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "Key bag locked", buf, 2u);
    }

    -[MFMailMessageLibrary _setProtectedDataAvailabilityState:](self, "_setProtectedDataAvailabilityState:", 2);
    -[MFMailMessageLibrary _cancelPendingJournalReconciliation](self, "_cancelPendingJournalReconciliation");
  }
  else if (!a3 && a4 != 3)
  {
    EDLibraryLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_INFO, "Key bag unlocked", v12, 2u);
    }

    -[MFMailMessageLibrary _setProtectedDataAvailabilityState:](self, "_setProtectedDataAvailabilityState:", 1);
    p_suspendedUnderLock = &self->_suspendedUnderLock;
    while (1)
    {
      v10 = __ldaxr((unsigned __int8 *)p_suspendedUnderLock);
      if (v10 != 1)
        break;
      if (!__stlxr(0, (unsigned __int8 *)p_suspendedUnderLock))
      {
        -[MFMailMessageLibrary database](self, "database");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "reconcileJournalWithCompletionBlock:", 0);

        return;
      }
    }
    __clrex();
    -[MFMailMessageLibrary _scheduleJournalReconciliation](self, "_scheduleJournalReconciliation");
  }
}

- (void)_scheduleJournalReconciliation
{
  NSObject *v3;
  void *v4;
  _QWORD aBlock[4];
  id v6;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  EDLibraryLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = CFSTR("com.apple.message.journal-reconciliation");
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_INFO, "register %@ activity", buf, 0xCu);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_2;
  aBlock[3] = &unk_1E4E8ADA8;
  objc_copyWeak(&v6, (id *)buf);
  v4 = _Block_copy(aBlock);
  objc_msgSend(CFSTR("com.apple.message.journal-reconciliation"), "UTF8String");
  ef_xpc_activity_register();

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  v2 = *MEMORY[0x1E0C807C8];
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80760], *MEMORY[0x1E0C807C8]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80790], 2 * v2);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A8], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808D0], 0);

}

void __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_set_state((xpc_activity_t)v3, 4))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject database](WeakRetained, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_3;
    v6[3] = &unk_1E4E88DC8;
    v7 = v3;
    objc_msgSend(v5, "reconcileJournalWithCompletionBlock:", v6);

  }
  else
  {
    EDLibraryLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = CFSTR("com.apple.message.journal-reconciliation");
      _os_log_impl(&dword_1A4F90000, WeakRetained, OS_LOG_TYPE_DEFAULT, "#Warning Unable to transition %@ activity to state 'continue'", buf, 0xCu);
    }
  }

}

void __54__MFMailMessageLibrary__scheduleJournalReconciliation__block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    EDLibraryLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2 = 138412290;
      v3 = CFSTR("com.apple.message.journal-reconciliation");
      _os_log_impl(&dword_1A4F90000, v1, OS_LOG_TYPE_DEFAULT, "#Warning Unable to transition %@ activity to state 'done'", (uint8_t *)&v2, 0xCu);
    }

  }
}

- (void)_cancelPendingJournalReconciliation
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  EDLibraryLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = CFSTR("com.apple.message.journal-reconciliation");
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_INFO, "cancelling %@ activity", (uint8_t *)&v3, 0xCu);
  }

  xpc_activity_unregister((const char *)objc_msgSend(CFSTR("com.apple.message.journal-reconciliation"), "UTF8String"));
}

- (void)_addMessageToThreadAtUnlock:(int64_t)a3
{
  NSObject *conversationCalculationQueue;
  _QWORD v4[6];

  conversationCalculationQueue = self->_conversationCalculationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__MFMailMessageLibrary__addMessageToThreadAtUnlock___block_invoke;
  v4[3] = &unk_1E4E89DD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(conversationCalculationQueue, v4);
}

void __52__MFMailMessageLibrary__addMessageToThreadAtUnlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 112);
    *(_QWORD *)(v3 + 112) = v2;

  }
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Threading: deferring thread resolution until unlock for message database ID %lld", (uint8_t *)&v9, 0xCu);
  }

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (BOOL)migrate
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A85B0E24](self, a2);
  -[MFMailMessageLibrary database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openConnectionIsWriter:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "close");

  objc_autoreleasePoolPop(v3);
  return v5 != 0;
}

- (void)performIncrementalVacuumForSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MFMailMessageLibrary *v10;

  v4 = a3;
  -[MFMailMessageLibrary database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary performIncrementalVacuumForSchema:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke;
  v8[3] = &unk_1E4E8A760;
  v7 = v4;
  v9 = v7;
  v10 = self;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

}

uint64_t __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  sqlite3 *v17;
  NSObject *v18;
  const char *v19;
  double v20;
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EDLibraryLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(double *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "Starting incremental vacuum for %@ database", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("protected"))
    && (objc_msgSend(*(id *)(a1 + 40), "isProtectedDataAvailable:", v3) & 1) == 0)
  {
    EDLibraryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "Skipping incremental vacuum because protected tables are not available";
      v14 = v9;
      v15 = 2;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA %@.freelist_count;"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)&v8 = COERCE_DOUBLE(objc_msgSend(v6, "_int64ForQuery:connection:textArgument:", v7, v3, 0));

    if (v8 > 255)
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA %@.page_count;"), *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "_int64ForQuery:connection:textArgument:", v12, v3, 0);

      if (((double)v13 - (double)v8) / (double)v13 <= 0.85)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA %@.incremental_vacuum(%lld);"),
          *(_QWORD *)(a1 + 32),
          v8 - 256);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (sqlite3 *)objc_msgSend(v3, "sqlDB");
        v9 = objc_retainAutorelease(v16);
        if (sqlite3_exec(v17, (const char *)-[NSObject UTF8String](v9, "UTF8String"), 0, 0, 0))
        {
          EDLibraryLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = sqlite3_errmsg((sqlite3 *)objc_msgSend(v3, "sqlDB"));
            __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke_cold_1((uint64_t)v19, (uint64_t)buf, v18);
          }
        }
        else
        {
          EDLibraryLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v20 = *(double *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v23 = v20;
            _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, "Successfully performed incremental vacuum on %@ database", buf, 0xCu);
          }
        }

      }
      else
      {
        EDLibraryLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v23 = ((double)v13 - (double)v8) / (double)v13;
          v10 = "Skipping incremental vacuum because load factor (%.2f) is above threshold (0.85)";
          goto LABEL_11;
        }
      }
    }
    else
    {
      EDLibraryLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v23 = *(double *)&v8;
        v10 = "Skipping incremental vacuum because free count (%lld) is below limit (256)";
LABEL_11:
        v14 = v9;
        v15 = 12;
LABEL_14:
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, v10, buf, v15);
      }
    }
  }

  return 1;
}

- (void)_scheduleIncrementalVacuum
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__MFMailMessageLibrary__scheduleIncrementalVacuum__block_invoke_2;
  v3[3] = &unk_1E4E8ADA8;
  objc_copyWeak(&v4, &location);
  v2 = _Block_copy(v3);
  ef_xpc_activity_register();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__MFMailMessageLibrary__scheduleIncrementalVacuum__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B0]);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);

}

void __50__MFMailMessageLibrary__scheduleIncrementalVacuum__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performIncrementalVacuumForSchema:", CFSTR("main"));
  objc_msgSend(WeakRetained, "performIncrementalVacuumForSchema:", CFSTR("protected"));

}

- (void)closeDatabaseConnections
{
  id v2;

  -[MFMailMessageLibrary database](self, "database");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeAllConnections");

}

- (void)journalReconciliationFailed
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1A4F90000, v0, OS_LOG_TYPE_FAULT, "Abort if mobilemail: journal reconciliation failed", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)handleFailedMigration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Could not set protection class on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_renameLibraryAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 40), "removeItemAtPath:error:", *(_QWORD *)(a1 + 48), 0);
}

void __54__MFMailMessageLibrary_renameOrRemoveDatabaseIfNeeded__block_invoke_3(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)MFRemoveItemAtPath();

}

+ (void)removeLibraryOnNextLaunch
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  EDLibraryLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "Mail db will be reset on next launch", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MFMailDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR(".reset-database"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v5, 0, 0);

  if ((v6 & 1) == 0)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = CFSTR(".reset-database");
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Could not create %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

+ (void)_renameLibraryAtPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const std::__fs::filesystem::path *v13;
  id v14;
  const std::__fs::filesystem::path *v15;
  std::error_code *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("Envelope Index"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("Protected Index"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v23, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SavedFolders"), "mf_uniqueFilenameWithRespectToFilenames:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mf_makeCompletePath:mode:", v21, 448);
  _MFMoveDatabase(v19, v21);
  _MFMoveDatabase(v20, v21);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v18;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v27;
    v22 = *MEMORY[0x1E0CB2B18];
    v5 = *MEMORY[0x1E0CB2B20];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasPrefix:", CFSTR("SavedFolders")) & 1) == 0)
        {
          objc_msgSend(v23, "stringByAppendingPathComponent:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingPathComponent:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "attributesOfItemAtPath:error:", v9, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKey:", v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v5);

          if (v12)
          {
            v13 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
            objc_msgSend(v21, "stringByAppendingPathComponent:", v7);
            v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v15 = (const std::__fs::filesystem::path *)objc_msgSend(v14, "fileSystemRepresentation");
            rename(v13, v15, v16);

          }
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v3);
  }

}

- (id)_stringsForIndexSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MFMailMessageLibrary__stringsForIndexSet___block_invoke;
  v7[3] = &unk_1E4E8AE38;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v7);

  return v5;
}

void __44__MFMailMessageLibrary__stringsForIndexSet___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  EFStringWithInt64();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:");

}

- (void)removeSearchableItemsForAccount:(id)a3
{
  -[MFMailMessageLibrary removeSearchableItemsForAccount:databaseID:](self, "removeSearchableItemsForAccount:databaseID:", a3, *MEMORY[0x1E0D1DC08]);
}

- (void)removeSearchableItemsForMailbox:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessageLibrary removeSearchableItemsForAccount:databaseID:](self, "removeSearchableItemsForAccount:databaseID:", v4, objc_msgSend(v5, "databaseID"));

}

- (void)removeSearchableItemsForMessages:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF08], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MFMailMessageLibrary_removeSearchableItemsForMessages___block_invoke;
  v7[3] = &unk_1E4E8AE88;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  -[MFMailMessageLibrary _removeSearchableItemsWithLibraryIDs:](self, "_removeSearchableItemsWithLibraryIDs:", v5);

}

void __57__MFMailMessageLibrary_removeSearchableItemsForMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v3, "libraryID"));

}

- (void)removeSearchableItemsForAccount:(id)a3 databaseID:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    MFUserAgent();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMobileMail");

    if (v7)
    {
      if (*MEMORY[0x1E0D1DC08] == a4)
      {
        objc_msgSend(v12, "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "uniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%lld"), v10, a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeItemsForDomainIdentifier:", v8);

    }
  }

}

- (void)_removeSearchableItemsWithLibraryIDs:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    MFUserAgent();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMobileMail");

    if (v5)
    {
      -[MFMailMessageLibrary _stringsForIndexSet:](self, "_stringsForIndexSet:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeItemsWithIdentifiers:", v6);

    }
  }

}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v8, v6);

}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailMessageLibrary searchableIndex](self, "searchableIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reindexAllSearchableItemsWithAcknowledgementHandler:", v5);

}

- (void)removeMessagesFromCacheWithLibraryIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[MFWeakObjectCache removeObjectForKey:](self->_libraryMessageCache, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_libraryMessageCache
{
  return self->_libraryMessageCache;
}

- (id)_libraryMessageWithLibraryID:(int64_t)a3 wasCached:(BOOL *)a4
{
  MFWeakObjectCache *libraryMessageCache;
  void *v6;
  void *v7;

  libraryMessageCache = self->_libraryMessageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFWeakObjectCache objectForKey:wasCached:](libraryMessageCache, "objectForKey:wasCached:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_messageForRow:(id)a3 options:(unsigned int)a4 timestamp:(unint64_t)a5 connection:(id)a6 isProtectedDataAvailable:(BOOL)a7 recipientsCache:(id)a8
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  id v115;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v129;
  __CFString *v130;
  void *v131;
  void *v132;
  void *v133;
  unsigned int v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v141;
  void *v142;
  uint64_t v143;
  id v144;
  void *v145;
  __CFString *v146;
  void *v147;
  void *v148;
  _BOOL4 v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v160;
  _QWORD v161[5];
  id v162;
  uint8_t v163[4];
  uint64_t v164;
  __int16 v165;
  uint64_t v166;
  __int16 v167;
  uint64_t v168;
  void *v169;
  __int128 buf;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;

  v149 = a7;
  v173 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v144 = a6;
  v139 = a8;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v11, "databaseIDValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("remote_id"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("date_received"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v14, "longLongValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("date_sent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v16, "longLongValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("display_date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateValue");
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("flags"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v19, "longLongValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("size"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "numberValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v21, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("mailbox"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v131 = v23;
  if (v23)
  {
    if (objc_msgSend(v23, "longLongValue") != -1)
      goto LABEL_8;
    EDLibraryLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.6();
  }
  else
  {
    EDLibraryLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.5();
  }

LABEL_8:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("original_mailbox"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v26, "longLongValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("content_type"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectValue");
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (int)objc_msgSend(v148, "intValue") - 1;
    if (v28 <= 5)
    {
      v130 = off_1E4E8B0A8[v28];
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v130 = v148;
      goto LABEL_14;
    }
  }
  v130 = 0;
LABEL_14:
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("conversation_id")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("conversation_id"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v29, "int64Value");

    if (v129)
      goto LABEL_21;
    EDLibraryLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.4();
  }
  else
  {
    EDLibraryLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v157;
      _os_log_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_DEFAULT, "ConversationID not loaded for message (LibraryID = %lld)?", (uint8_t *)&buf, 0xCu);
    }
  }

  v129 = 0;
LABEL_21:
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("encoding")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("encoding"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberValue");
    v141 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v141 = 0;
  }
  if (!objc_msgSend(v10, "columnExistsWithName:", CFSTR("external_id")))
  {
LABEL_32:
    v33 = 0;
    goto LABEL_33;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("external_id"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v33, "length"))
    v34 = v33;
  else
    v34 = 0;
  v35 = v34;

  if (!v35)
  {
    EDLibraryLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.3(v36, v37, v38, v39, v40, v41, v42, v43);

    goto LABEL_32;
  }
LABEL_33:
  v150 = v33;
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("message_id")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("message_id"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "numberValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v45, "longLongValue");

  }
  else
  {
    v120 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("global_message_id")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("global_message_id"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "numberValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v47, "longLongValue");

  }
  else
  {
    v143 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("unique_id")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("unique_id"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "numberValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v49, "longLongValue");

  }
  else
  {
    v119 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("conversation_flags")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("conversation_flags"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "numberValue");
    v155 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v155 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("list_id_hash")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("list_id_hash"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "int64Value");

    v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E680]), "initWithHash:", v52);
  }
  else
  {
    v154 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("document_id")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("document_id"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v54, "length"))
    {
      v153 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v54);

    }
    else
    {
      v153 = 0;
    }

  }
  else
  {
    v153 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("read_later_date")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("read_later_date"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dateValue");
    v152 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v152 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("follow_up_start_date")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("follow_up_start_date"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "dateValue");
    v158 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v158 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("follow_up_end_date")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("follow_up_end_date"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "dateValue");
    v160 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v160 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("follow_up_jsonstringformodelevaluationforsuggestions"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringValue");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v138 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("send_later_date")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("send_later_date"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dateValue");
    v151 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v151 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D1EAB0], "categoryForResultRow:", v10);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EAA8], "businessAddressesBusinessColumnName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v10, "columnExistsWithName:", v60);

  if (v61)
  {
    objc_msgSend(MEMORY[0x1E0D1EAA8], "businessAddressesBusinessColumnName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v63, "databaseIDValue");

  }
  else
  {
    v124 = *MEMORY[0x1E0D1DC08];
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("subject")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subject"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "stringValue");
    v146 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((a4 & 1) == 0)
    {
      v65 = 0;
      goto LABEL_92;
    }
    if (v146)
      v66 = v146;
    else
      v66 = &stru_1E4F1C8F8;
    if (v146 || !v149)
      goto LABEL_88;
  }
  else
  {
    if ((a4 & 1) == 0)
    {
      v65 = 0;
      v146 = 0;
      goto LABEL_92;
    }
    if (!v149)
      goto LABEL_87;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v171 = 0x2020000000;
  v172 = -1;
  objc_msgSend(v144, "preparedStatementForQueryString:", CFSTR("SELECT subject FROM messages WHERE ROWID = ?"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v157);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = MEMORY[0x1E0C809B0];
  v161[1] = 3221225472;
  v161[2] = __109__MFMailMessageLibrary__messageForRow_options_timestamp_connection_isProtectedDataAvailable_recipientsCache___block_invoke;
  v161[3] = &unk_1E4E8A268;
  v161[4] = &buf;
  objc_msgSend(v67, "executeWithIndexedBindings:usingBlock:error:", v69, v161, 0);

  EDLibraryLog();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    v117 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v163 = 134218496;
    v164 = v157;
    v165 = 2048;
    v166 = v143;
    v167 = 2048;
    v168 = v117;
    _os_log_error_impl(&dword_1A4F90000, v70, OS_LOG_TYPE_ERROR, "Message has no subject.  LibraryID = %lld, globalID = %lld, subjectID = %lld", v163, 0x20u);
  }

  _Block_object_dispose(&buf, 8);
LABEL_87:
  v66 = &stru_1E4F1C8F8;
LABEL_88:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subject_prefix"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "stringValue");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v72, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v72, v66);
    v146 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v146 = v66;
  }

  v65 = 1;
LABEL_92:
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("sender_comment")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sender_comment"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringValue");
    v147 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v147 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("sender_address")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sender_address"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stringValue");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v75 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("journaled")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("journaled"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v76, "BOOLValue");

  }
  else
  {
    v125 = 0;
  }
  v77 = (void *)MEMORY[0x1E0D1E6C0];
  objc_msgSend(v75, "emailAddressValue");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "componentsWithEmailAddress:", v78);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v145, "setDisplayName:", v147);
  objc_msgSend(v145, "stringValue");
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v79;
  if (v79)
    v81 = (void *)v79;
  else
    v81 = v75;
  v82 = v81;

  if ((a4 & 2) != 0)
  {
    if (!v75 && v149)
    {
      EDLibraryLog();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.2();

    }
    v65 |= 4u;
  }
  else if (!objc_msgSend(v82, "length"))
  {

    v82 = 0;
  }
  v84 = 0;
  if ((a4 & 4) != 0 && v149)
  {
    -[MFMailMessageLibrary _recipientsForMessageWithDatabaseID:connection:recipientsCache:](self, "_recipientsForMessageWithDatabaseID:connection:recipientsCache:", v157, v144, v139);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "toRecipientStrings");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "ccRecipientStrings");
    v86 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "bccRecipientStrings");
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    v65 |= 2u;
  }
  else
  {
    v86 = 0;
    v137 = 0;
  }
  v133 = (void *)v86;
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("summary")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("summary"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "stringValue");
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    v65 |= a4 & 8;
  }
  else
  {
    v136 = 0;
  }
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && objc_msgSend(v10, "columnExistsWithName:", CFSTR("generated_summary")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("generated_summary"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "dataValue");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v89, "length"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("urgent"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "BOOLValue");

      v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v89, 0);
      v134 = v91;
      objc_msgSend(v92, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D1DDB0]);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D1DDA8]);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v93)
      {
        v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1F0]), "initWithGlobalMessageID:", v143);
        v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E188]), "initWithTopLine:synopsis:urgent:messageItemID:", v93, v94, v134, v95);

      }
      else
      {
        v135 = 0;
      }

    }
    else
    {
      v135 = 0;
    }

  }
  else
  {
    v135 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("unsubscribe_type")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("unsubscribe_type"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "numberValue");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v97 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("sender_bucket")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sender_bucket"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "numberValue");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "integerValue");

  }
  else
  {
    v100 = 0;
  }
  if (objc_msgSend(v10, "columnExistsWithName:", CFSTR("brand_indicator_location")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("brand_indicator_location"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "stringValue");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
      v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v102);
    else
      v103 = 0;

  }
  else
  {
    v103 = 0;
  }
  LOBYTE(buf) = 0;
  -[MFMailMessageLibrary _libraryMessageWithLibraryID:wasCached:](self, "_libraryMessageWithLibraryID:wasCached:", v157, &buf);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setGenerationNumber:", a5);
  if (v149)
  {
    if (v82)
    {
      v162 = v82;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v162, 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v105 = 0;
    }
    LODWORD(v118) = v65;
    objc_msgSend(v104, "setSubject:to:cc:bcc:sender:dateReceived:dateSent:summary:withOptions:", v146, v84, v133, v137, v105, v136, (double)v127, (double)v126, v118);
    if (v82)

    if ((a4 & 0x200000) != 0)
      objc_msgSend(v104, "setSenderBucket:", v100);
    objc_msgSend(v104, "setGeneratedSummary:", v135);
  }
  else
  {
    objc_msgSend(v104, "setDateReceivedAsTimeIntervalSince1970:", (double)v127);
    objc_msgSend(v104, "setDateSentAsTimeIntervalSince1970:", (double)v126);
  }
  if (v156)
  {
    objc_msgSend(v156, "ec_integerDate");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setDisplayDate:", v106);

  }
  if (v154)
    objc_msgSend(v104, "setListIDHash:", v154);
  if (v153)
    objc_msgSend(v104, "setDocumentID:", v153);
  if (v143)
    objc_msgSend(v104, "setGlobalMessageID:", v143);
  if (v155)
    objc_msgSend(v104, "setConversationFlags:", objc_msgSend(v155, "longLongValue"));
  if (v97)
    objc_msgSend(v104, "setUnsubscribeType:", objc_msgSend(v97, "longLongValue"));
  if (v152)
  {
    v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2C8]), "initWithDate:", v152);
    objc_msgSend(v104, "setReadLater:", v107);

  }
  if (v151)
    objc_msgSend(v104, "setSendLaterDate:", v151);
  objc_msgSend(v104, "setBrandIndicatorLocation:andData:", v103, 0);
  objc_msgSend(v104, "setIsJournaled:", v125);
  if (v158 && v160)
  {
    v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E178]), "initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:", v158, v160, v138);
    objc_msgSend(v104, "setFollowUp:", v108);

  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    objc_msgSend(v104, "setCategory:", v142);
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v104, "setBusinessID:", v124);
    objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataValidationState");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v10, "columnExistsWithName:", v109);

    if (v110)
    {
      objc_msgSend(MEMORY[0x1E0D1EB30], "messageGlobalDataValidationState");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "numberValue");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setAuthenticationState:", objc_msgSend(v113, "integerValue"));

    }
  }
  objc_msgSend(v104, "mf_lock");
  if (objc_msgSend(v104, "mailboxID") == -1)
  {
    objc_msgSend(v104, "setContentType:", v130);
    objc_msgSend(v104, "setRemoteID:flags:size:mailboxID:originalMailboxID:", v132, v123, v122, objc_msgSend(v131, "longLongValue"), v121);
    if (v150)
      objc_msgSend(v104, "setExternalID:", v150);
    if (v141)
      objc_msgSend(v104, "setPreferredEncoding:", objc_msgSend(v141, "unsignedIntValue"));
    objc_msgSend(v104, "setUniqueRemoteId:", v119);
    objc_msgSend(v104, "setConversationID:", v129);
    objc_msgSend(v104, "setMessageIDHash:", v120);
  }
  objc_msgSend(v104, "mf_unlock");
  if (objc_msgSend(v104, "mailboxID") == -1)
  {
    EDLibraryLog();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibrary _messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:].cold.1(&buf, v157, v114);

  }
  v115 = v104;

  return v115;
}

void __109__MFMailMessageLibrary__messageForRow_options_timestamp_connection_isProtectedDataAvailable_recipientsCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (id)_recipientsForMessageWithDatabaseID:(int64_t)a3 connection:(id)a4 recipientsCache:(id)a5
{
  id v7;
  id v8;
  _MFRecipientCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _MFRecipientCollection *v14;
  char v15;
  id v16;
  _MFRecipientCollection *v17;
  _MFRecipientCollection *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  _MFRecipientCollection *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(_MFRecipientCollection);
  objc_msgSend(v7, "preparedStatementForQueryString:", CFSTR("SELECT addresses.ROWID, addresses.address, addresses.comment, recipients.type FROM recipients JOIN addresses ON recipients.address = addresses.ROWID WHERE recipients.message = ? ORDER BY recipients.position"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__MFMailMessageLibrary__recipientsForMessageWithDatabaseID_connection_recipientsCache___block_invoke;
  v21[3] = &unk_1E4E8A828;
  v13 = v8;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  v20 = 0;
  v15 = objc_msgSend(v10, "executeWithIndexedBindings:usingBlock:error:", v12, v21, &v20);
  v16 = v20;

  if ((v15 & 1) == 0)
    objc_msgSend(v7, "handleError:message:", v16, CFSTR("Fetching recipients"));
  v17 = v23;
  v18 = v14;

  return v18;
}

void __87__MFMailMessageLibrary__recipientsForMessageWithDatabaseID_connection_recipientsCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _MFEmailAddress *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ROWID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "int64Value");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = *(void **)(a1 + 32);
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v8),
        v9 = (_MFEmailAddress *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("address"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("comment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[_MFEmailAddress initWithAddress:displayName:]([_MFEmailAddress alloc], "initWithAddress:displayName:", v11, v13);
    v14 = *(void **)(a1 + 32);
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

    }
  }
  switch(v6)
  {
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "addBCCRecipient:", v9);
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "addCCRecipient:", v9);
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "addToRecipient:", v9);
      break;
  }

}

- (id)senderForMessageWithLibraryID:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v31 = 0;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0D1EB30], "selectAddressesStatementWithResultColumns:", &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D1EE00];
  v9 = (id)objc_msgSend(v5, "join:sourceColumn:targetColumn:", v7, *MEMORY[0x1E0D1EE00], CFSTR("sender"));

  v10 = (void *)MEMORY[0x1E0D1EFC0];
  objc_msgSend(MEMORY[0x1E0D1EB30], "messagesTableName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "table:column:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "equalTo:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhere:", v14);

  -[MFMailMessageLibrary database](self, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary senderForMessageWithLibraryID:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke;
  v21[3] = &unk_1E4E89F60;
  v17 = v5;
  v22 = v17;
  v18 = v6;
  v23 = v18;
  v24 = &v26;
  objc_msgSend(v15, "__performReadWithCaller:usingBlock:", v16, v21);

  v19 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v19;
}

uint64_t __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke_2;
  v9[3] = &unk_1E4E8AEB0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = objc_msgSend(a2, "executeSelectStatement:withBlock:error:", v4, v9, 0);

  return v7;
}

void __54__MFMailMessageLibrary_senderForMessageWithLibraryID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v8);
  objc_msgSend(v9, "setDisplayName:", v5);
  objc_msgSend(v9, "emailAddressValue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v12);

}

- (id)_recipientsForMessagesWithDatabaseIDs:(id)a3 includeTo:(BOOL)a4 includeCC:(BOOL)a5 includeBCC:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  MFMailMessageLibrary *v32;
  SEL v33;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = a3;
  if (!v7 && !v6 && !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 7807, CFSTR("Must include at least one recipient type"));

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%lu"), 1);
    objc_msgSend(v12, "addObject:", v13);

  }
  if (v7)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%lu"), 2);
    objc_msgSend(v12, "addObject:", v14);

  }
  if (v6)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%lu"), 3);
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "valueForKey:", CFSTR("stringValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("SELECT addresses.address, addresses.comment, recipients.type, recipients.message FROM recipients JOIN addresses ON recipients.address = addresses.ROWID WHERE recipients.message IN (%@) AND type IN (%@) ORDER BY recipients.position"), v18, v19);

  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFMailMessageLibrary database](self, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary _recipientsForMessagesWithDatabaseIDs:includeTo:includeCC:includeBCC:]");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke;
  v29[3] = &unk_1E4E8A5D0;
  v24 = v20;
  v30 = v24;
  v25 = v21;
  v32 = self;
  v33 = a2;
  v31 = v25;
  objc_msgSend(v22, "__performReadWithCaller:usingBlock:", v23, v29);

  v26 = v25;
  return v26;
}

uint64_t __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke_2;
  v9[3] = &unk_1E4E8AED8;
  v10 = *(id *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 48);
  v8 = 0;
  v5 = objc_msgSend(v4, "executeUsingBlock:error:", v9, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v6, CFSTR("Fetching recipients"));

  return v5;
}

void __93__MFMailMessageLibrary__recipientsForMessagesWithDatabaseIDs_includeTo_includeCC_includeBCC___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _MFRecipientCollection *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("comment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v11 = (_MFRecipientCollection *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(_MFRecipientCollection);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  switch(v8)
  {
    case 3:
      -[_MFRecipientCollection addBCCRecipientWithAddress:displayName:](v11, "addBCCRecipientWithAddress:displayName:", v4, v6);
      break;
    case 2:
      -[_MFRecipientCollection addCCRecipientWithAddress:displayName:](v11, "addCCRecipientWithAddress:displayName:", v4, v6);
      break;
    case 1:
      -[_MFRecipientCollection addToRecipientWithAddress:displayName:](v11, "addToRecipientWithAddress:displayName:", v4, v6);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("MailMessageLibrary.m"), 7857, CFSTR("Unknown recipient type"));

      break;
  }

}

- (id)stringFromAllMailboxUnreadCount
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[MFMailMessageLibrary database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary stringFromAllMailboxUnreadCount]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke;
  v8[3] = &unk_1E4E8AB20;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v8);

  return v6;
}

uint64_t __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("SELECT * FROM mailboxes;"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke_2;
  v9[3] = &unk_1E4E8A048;
  v10 = *(id *)(a1 + 32);
  v8 = 0;
  v5 = objc_msgSend(v4, "executeUsingBlock:error:", v9, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v6, CFSTR("Selecting mailboxes"));

  return v5;
}

void __55__MFMailMessageLibrary_stringFromAllMailboxUnreadCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v28 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("url: %@\n"), v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("total_count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("  total Count: %@\n"), v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("unread_count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("  unread Count: %@\n"), v12);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("deleted_count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("  deleted Count: %@\n"), v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("flagged_count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("  flagged Count: %@\n"), v18);

  v19 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("server_unread_count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendFormat:", CFSTR("  server Unread Count: %@\n"), v21);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("last_sync_status_count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendFormat:", CFSTR("  last Sync Status Count: %@\n"), v24);

  v25 = *(void **)(a1 + 32);
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("most_recent_status_count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR("  most Recent Status Count: %@\n"), v27);

}

- (BOOL)messageDataExistsInDatabaseForMessageLibraryID:(int64_t)a3 part:(id)a4 length:(unint64_t *)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  char v15;
  _QWORD v17[4];
  __CFString *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a4;
  v9 = CFSTR("SELECT length FROM message_data WHERE message_id = ? AND part = ?");
  if (!v8)
    v9 = CFSTR("SELECT length FROM message_data WHERE message_id = ? AND part IS NULL");
  v10 = v9;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  -[MFMailMessageLibrary database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MFMailMessageLibrary messageDataExistsInDatabaseForMessageLibraryID:part:length:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke;
  v17[3] = &unk_1E4E8AF00;
  v13 = v10;
  v18 = v13;
  v22 = a3;
  v14 = v8;
  v19 = v14;
  v20 = &v27;
  v21 = &v23;
  objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v17);

  if (a5)
    *a5 = v28[3];
  v15 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

uint64_t __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v10;
  _QWORD v11[4];
  __int128 v12;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");
  sqlite3_bind_int64(v5, 1, *(_QWORD *)(a1 + 64));
  v6 = *(void **)(a1 + 40);
  if (v6)
    sqlite3_bind_text(v5, 2, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0);
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke_2;
  v11[3] = &unk_1E4E8ABE8;
  v12 = *(_OWORD *)(a1 + 48);
  v7 = objc_msgSend(v4, "executeUsingBlock:error:", v11, &v10);
  v8 = v10;
  if ((v7 & 1) == 0)
    objc_msgSend(v3, "handleError:message:", v8, CFSTR("Fetching message data"));

  return v7;
}

void __83__MFMailMessageLibrary_messageDataExistsInDatabaseForMessageLibraryID_part_length___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "integerValue");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a4 = 1;

}

- (EDWebContentParser)remoteContentParser
{
  os_unfair_lock_s *p_remoteContentParserLock;
  EDWebContentParser *remoteContentParser;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  EDWebContentParser *v9;
  EDWebContentParser *v10;
  EDWebContentParser *v11;

  p_remoteContentParserLock = &self->_remoteContentParserLock;
  os_unfair_lock_lock(&self->_remoteContentParserLock);
  remoteContentParser = self->_remoteContentParser;
  if (!remoteContentParser)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    v6 = _os_feature_enabled_impl();
    v7 = objc_alloc(MEMORY[0x1E0D1EC90]);
    if (v6)
      v8 = 7;
    else
      v8 = 5;
    v9 = (EDWebContentParser *)objc_msgSend(v7, "initWithOptions:cancelationToken:", v8, v5);
    v10 = self->_remoteContentParser;
    self->_remoteContentParser = v9;

    remoteContentParser = self->_remoteContentParser;
  }
  v11 = remoteContentParser;
  os_unfair_lock_unlock(p_remoteContentParserLock);
  return v11;
}

- (BOOL)_shouldStoreRemoteContentForMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", *MEMORY[0x1E0D1E048]);

  if ((v6 & 1) == 0)
  {
    EDLibraryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (uint64_t)v4;
      v8 = "Skipping remote content parsing (not yet enabled by user): %{public}@";
      v9 = v7;
      v10 = 12;
LABEL_10:
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((v6 & 8) != 0)
  {
    EDLibraryLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v24 = v6;
      v25 = 2114;
      v26 = v4;
      v8 = "Skipping remote content parsing (%lx): %{public}@";
      v9 = v7;
      v10 = 22;
      goto LABEL_10;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  -[MFMailMessageLibrary persistence](self, "persistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteContentManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v13 = objc_msgSend(v12, "shouldAddRemoteContentLinksForMessage:logMessage:", v4, &v22);
  v7 = v22;

  if ((v13 & 1) == 0)
  {
    EDLibraryLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = (uint64_t)v7;
      v25 = 2114;
      v26 = v4;
      v18 = "Skipping remote content parsing (%{public}@): %{public}@";
      v19 = v17;
      v20 = 22;
LABEL_15:
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isMailPrivacyProtectionAllowed");

  if ((v15 & 1) == 0)
  {
    EDLibraryLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = (uint64_t)v4;
      v18 = "Skipping remote content parsing (prohibited by MDM): %{public}@";
      v19 = v17;
      v20 = 12;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)_storeRemoteContentLinksCachedOnMessage:(id)a3 linksToVerify:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  BOOL v13;

  v6 = a3;
  objc_msgSend(v6, "remoteContentLinks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MFMailMessageLibrary persistence](self, "persistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteContentManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isPluggedIn"))
    {
      v11 = objc_msgSend(v9, "shouldVerifyRemoteLinks");

      if (v11)
      {
        v12 = objc_retainAutorelease(v7);
        v13 = 0;
LABEL_8:
        *a4 = v12;

        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "addRemoteContentLinks:", v7);
    v12 = 0;
    v13 = 1;
    goto LABEL_8;
  }
  v13 = 0;
  *a4 = 0;
LABEL_9:

  return v13;
}

- (void)storeRemoteContentLinksFromFullData:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  _BOOL8 v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[MFMailMessageLibrary _shouldStoreRemoteContentForMessage:](self, "_shouldStoreRemoteContentForMessage:", v7))
  {
    v11 = 0;
    v8 = -[MFMailMessageLibrary _storeRemoteContentLinksCachedOnMessage:linksToVerify:](self, "_storeRemoteContentLinksCachedOnMessage:linksToVerify:", v7, &v11);
    v9 = v11;
    v10 = !v8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[MFMailMessageLibrary _processMessageData:forMessage:linksToVerify:parsingOptions:](self, "_processMessageData:forMessage:linksToVerify:parsingOptions:", v6, v7, v9, -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:](self, "_parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:", v7, v10));

}

- (void)_processMessageData:(id)a3 forMessage:(id)a4 linksToVerify:(id)a5 parsingOptions:(unint64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v19, "length");
  v13 = objc_msgSend(v19, "mf_rangeOfRFC822HeaderData");
  v15 = v14;
  if (v14 == v12)
  {
    if ((a6 & 1) != 0)
      -[MFMailMessageLibrary _storeLinksToVerifyIfExistent:](self, v11);
    v16 = 0;
    v17 = 0;
  }
  else
  {
    v18 = v13;
    objc_msgSend(v19, "mf_subdataWithRange:", v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mf_subdataWithRange:", v18 + v15, v12 - (v18 + v15));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailMessageLibrary _findHTMLPartsFromHeaderData:bodyData:forMessage:linksToVerify:parsingOptions:](self, "_findHTMLPartsFromHeaderData:bodyData:forMessage:linksToVerify:parsingOptions:", v17, v16, v10, v11, a6);
  }

}

- (void)_storeLinksToVerifyIfExistent:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1 && v3)
  {
    v6 = v3;
    objc_msgSend(a1, "persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteContentManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addRemoteContentLinks:", v6);

    v3 = v6;
  }

}

- (void)storeRemoteContentLinksFromHeaderData:(id)a3 bodyData:(id)a4 forMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL8 v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MFMailMessageLibrary _shouldStoreRemoteContentForMessage:](self, "_shouldStoreRemoteContentForMessage:", v10))
  {
    v14 = 0;
    v11 = -[MFMailMessageLibrary _storeRemoteContentLinksCachedOnMessage:linksToVerify:](self, "_storeRemoteContentLinksCachedOnMessage:linksToVerify:", v10, &v14);
    v12 = v14;
    v13 = !v11;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  -[MFMailMessageLibrary _findHTMLPartsFromHeaderData:bodyData:forMessage:linksToVerify:parsingOptions:](self, "_findHTMLPartsFromHeaderData:bodyData:forMessage:linksToVerify:parsingOptions:", v8, v9, v10, v12, -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:](self, "_parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:", v10, v13));

}

- (void)_findHTMLPartsFromHeaderData:(id)a3 bodyData:(id)a4 forMessage:(id)a5 linksToVerify:(id)a6 parsingOptions:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(void *, void *);
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  MFMailMessageLibrary *v42;
  id v43;
  id v44;
  unint64_t v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v39 = a4;
  v38 = a5;
  v13 = a6;
  v37 = v12;
  if (objc_msgSend(v12, "length") && objc_msgSend(v39, "length"))
  {
    v33 = v13;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "threadDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x1E0D45F78];
    v34 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D45F78]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v16);
    v17 = objc_alloc_init(MEMORY[0x1E0D460E0]);
    v36 = objc_alloc_init(MEMORY[0x1E0D460F0]);
    v32 = v16;
    objc_msgSend(v17, "setMessage:", v38);
    objc_msgSend(v17, "setTopLevelPart:", v36);
    objc_msgSend(v36, "setMimeBody:", v17);
    objc_msgSend(v36, "parseMimeBodyFromHeaderData:bodyData:isPartial:", v12, v39, 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__MFMailMessageLibrary__findHTMLPartsFromHeaderData_bodyData_forMessage_linksToVerify_parsingOptions___block_invoke;
    aBlock[3] = &unk_1E4E8AF28;
    v31 = v39;
    v41 = v31;
    v42 = self;
    v43 = v13;
    v30 = v38;
    v44 = v30;
    v45 = a7;
    v18 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(v17, "textHtmlPart");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v18[2](v18, v19);
      v20 = 1;
      goto LABEL_20;
    }
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v17, "topLevelPart");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v19 = 0;
    while (1)
    {
      if (objc_msgSend(v23, "isHTML"))
      {
        objc_msgSend(v23, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("multipart")) & 1) != 0)
        {
          objc_msgSend(v23, "subtype");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("alternative"));

          if ((v26 & 1) == 0)
          {
            objc_msgSend(v23, "subparts");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObjectsFromArray:", v27);

LABEL_17:
            v20 = 1;
            goto LABEL_18;
          }
        }
        else
        {

        }
        objc_msgSend(v23, "textHtmlPart");
        v28 = objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v19 = 0;
          goto LABEL_17;
        }
        v18[2](v18, (void *)v28);
        v20 = 1;
        v19 = (void *)v28;
      }
LABEL_18:
      objc_msgSend(v22, "lastObject");
      v29 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "removeLastObject");
      v23 = (void *)v29;
      if (!v29)
      {

LABEL_20:
        if ((_os_feature_enabled_impl() & 1) != 0)
        {
          if ((v20 & 1) != 0)
          {
LABEL_25:
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, v32);

            v13 = v33;
            goto LABEL_26;
          }
        }
        else if (v20 & 1 | ((_os_feature_enabled_impl() & 1) == 0))
        {
          goto LABEL_25;
        }
        -[MFMailMessageLibrary detectDataFromPlainTextMessage:forMessage:mimePart:](self, "detectDataFromPlainTextMessage:forMessage:mimePart:", v31, v30, v36);
        goto LABEL_25;
      }
    }
  }
  EDLibraryLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = v38;
    _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "Skipping remote content parsing and data detection (no header or body data): %{public}@", buf, 0xCu);
  }

  -[MFMailMessageLibrary _storeLinksToVerifyIfExistent:](self, v13);
LABEL_26:

}

void __102__MFMailMessageLibrary__findHTMLPartsFromHeaderData_bodyData_forMessage_linksToVerify_parsingOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  v5 = objc_msgSend(v3, "range");
  objc_msgSend(v4, "subdataWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_processRemoteContentFromData:forMimePart:linksToVerify:forMessage:parsingOptions:", v7, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)storeRemoteContentLinksFromData:(id)a3 forMessage:(id)a4 mimePart:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL8 v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MFMailMessageLibrary _shouldStoreRemoteContentForMessage:](self, "_shouldStoreRemoteContentForMessage:", v9))
  {
    v14 = 0;
    v11 = -[MFMailMessageLibrary _storeRemoteContentLinksCachedOnMessage:linksToVerify:](self, "_storeRemoteContentLinksCachedOnMessage:linksToVerify:", v9, &v14);
    v12 = v14;
    v13 = !v11;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  -[MFMailMessageLibrary _processRemoteContentFromData:forMimePart:linksToVerify:forMessage:parsingOptions:](self, "_processRemoteContentFromData:forMimePart:linksToVerify:forMessage:parsingOptions:", v8, v10, v12, v9, -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:](self, "_parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:", v9, v13));

}

- (void)_processRemoteContentFromData:(id)a3 forMimePart:(id)a4 linksToVerify:(id)a5 forMessage:(id)a6 parsingOptions:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  MFMailMessageLibrary *v29;
  id v30;
  id v31;
  unint64_t v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((objc_msgSend(v13, "isHTML") & 1) != 0)
  {
    objc_msgSend(v13, "mimeBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasEncryptedDescendantPart");

    if (v17)
    {
      EDLibraryLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v15;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Skipping remote content parsing (non-top-level encrypted part): %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v13, "decodedDataForData:", v12);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D460E8], "preferredMimeCharset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "charsetName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMailMessageLibrary remoteContentParser](self, "remoteContentParser");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistentID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "subject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subjectString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke;
      v27[3] = &unk_1E4E8AF78;
      v28 = v14;
      v29 = self;
      v24 = v25;
      v30 = v24;
      v32 = a7;
      v31 = v15;
      objc_msgSend(v26, "parseHTMLData:characterEncodingName:withOptions:forMessage:withSubject:completionHandler:", v18, v24, a7, v21, v23, v27);

    }
  }
  else
  {
    EDLibraryLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v15;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "Skipping remote content parsing (non-HTML part): %{public}@", buf, 0xCu);
    }

    -[MFMailMessageLibrary _storeLinksToVerifyIfExistent:](self, v14);
  }

}

void __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteContentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "remoteContentLinks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRemoteContentLinks:andVerifyWithParsedLinks:defaultCharsetName:", v7, v8, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v4, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteContentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteContentLinks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRemoteContentLinks:requiredParsing:", v8, 1);
  }

  v9 = *(_QWORD *)(a1 + 64);
  if ((v9 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataDetectionPersistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataDetectionResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addDataDetectionResults:globalMessageID:", v12, objc_msgSend(*(id *)(a1 + 56), "globalMessageID"));

    v9 = *(_QWORD *)(a1 + 64);
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "mailbox");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isOutgoingMailboxUid");

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      v16 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageBasePathForAccount:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileURLWithPath:isDirectory:", v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "richLinkResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke_2;
      v33[3] = &unk_1E4E8AF50;
      v33[4] = *(_QWORD *)(a1 + 40);
      v34 = *(id *)(a1 + 56);
      v21 = v19;
      v35 = v21;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v33);

    }
  }
  if ((*(_BYTE *)(a1 + 64) & 8) != 0)
  {
    objc_msgSend(v3, "oneTimeCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 40), "hookRegistry");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "oneTimeCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "displayDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(*(id *)(a1 + 56), "globalMessageID");
      objc_msgSend(*(id *)(a1 + 56), "subject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "subjectString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "senders");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didReceiveOneTimeCode:timestamp:messageID:subject:senders:", v24, v25, v26, v28, v29);

      v30 = objc_alloc(MEMORY[0x1E0D1E140]);
      v36 = CFSTR("oneTimeCodeEvent");
      v37[0] = CFSTR("detected");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithEventName:collectionData:", CFSTR("com.apple.mail.oneTimeCodes"), v31);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "logOneTimeEvent:", v32);
    }
  }

}

void __106__MFMailMessageLibrary__processRemoteContentFromData_forMimePart_linksToVerify_forMessage_parsingOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "richLinkPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "saveRichLinkData:globalMessageID:basePath:", v7, objc_msgSend(*(id *)(a1 + 40), "globalMessageID"), *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x1E0D1E9C8], *(_QWORD *)(a1 + 40));

}

- (unint64_t)_parserRemoteContentOptionsForMessage:(id)a3 shouldStoreRemoteContent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  _QWORD v14[4];

  v4 = a4;
  v14[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[MFMailMessageLibrary _shouldPerformDataDetectionForMessage:](self, "_shouldPerformDataDetectionForMessage:", v6);
  v8 = 4;
  if (v4)
    v8 = 5;
  if (v7)
    v9 = v8 | 2;
  else
    v9 = v8;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v6, "dateReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ef_isMoreThanTimeIntervalAgo:", 180.0);

    if ((v11 & 1) != 0)
    {
      EDLibraryLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:].cold.1((uint64_t)v14, objc_msgSend(v6, "globalMessageID"));

    }
    else
    {
      v9 |= 8uLL;
    }
  }

  return v9;
}

- (BOOL)_shouldPerformDataDetectionForMessage:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char v8;
  __CFString *v10;

  v4 = a3;
  v5 = CFSTR("feature not enabled");
  if (_os_feature_enabled_impl())
  {
    -[MFMailMessageLibrary persistence](self, "persistence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteContentManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("feature not enabled");
    v8 = objc_msgSend(v7, "shouldAddRemoteContentLinksForMessage:logMessage:", v4, &v10);
    v5 = v10;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)detectDataFromPlainTextMessage:(id)a3 forMessage:(id)a4 mimePart:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v9, "dateReceived");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ef_isMoreThanTimeIntervalAgo:", 180.0);

    if ((v12 & 1) != 0)
    {
      EDLibraryLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[MFMailMessageLibrary _parserRemoteContentOptionsForMessage:shouldStoreRemoteContent:].cold.1((uint64_t)buf, objc_msgSend(v9, "globalMessageID"));
    }
    else
    {
      v14 = objc_msgSend(v9, "globalMessageID");
      objc_msgSend(v10, "decodedDataForData:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailMessageLibrary _getStringFromPlainTextData:mimePart:](self, "_getStringFromPlainTextData:mimePart:", v15, v10);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      EDLibraryLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Downloading plain text message %@, will perform one time code check", buf, 0xCu);
      }

      -[MFMailMessageLibrary remoteContentParser](self, "remoteContentParser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "subjectString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __75__MFMailMessageLibrary_detectDataFromPlainTextMessage_forMessage_mimePart___block_invoke;
      v21[3] = &unk_1E4E8AFA0;
      v21[4] = self;
      v22 = v9;
      v23 = v14;
      objc_msgSend(v18, "parseHTMLString:withOptions:forMessage:withSubject:completionHandler:", v13, 8, v16, v20, v21);

    }
  }

}

void __75__MFMailMessageLibrary_detectDataFromPlainTextMessage_forMessage_mimePart___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "oneTimeCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneTimeCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "displayDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "subject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subjectString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "senders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didReceiveOneTimeCode:timestamp:messageID:subject:senders:", v6, v7, v8, v10, v11);

    v12 = objc_alloc(MEMORY[0x1E0D1E140]);
    v15 = CFSTR("oneTimeCodeEvent");
    v16[0] = CFSTR("detected");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithEventName:collectionData:", CFSTR("com.apple.mail.oneTimeCodes"), v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "logOneTimeEvent:", v14);
  }

}

- (id)_getStringFromPlainTextData:(id)a3 mimePart:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "textEncoding");
  v7 = (void *)MFCreateStringWithData();

  return v7;
}

- (EDSearchableIndexScheduler)searchableIndexScheduler
{
  return self->_searchableIndexScheduler;
}

- (void)setSearchableIndexScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_searchableIndexScheduler, a3);
}

- (EDMessageQueryParser)queryParser
{
  return self->_queryParser;
}

- (void)setQueryParser:(id)a3
{
  objc_storeStrong((id *)&self->_queryParser, a3);
}

- (EFScheduler)fileRemovalAfterCompactionScheduler
{
  return self->_fileRemovalAfterCompactionScheduler;
}

- (void)setFileRemovalAfterCompactionScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_fileRemovalAfterCompactionScheduler, a3);
}

- (NSMutableDictionary)currentAddedMessagesMap
{
  return self->_currentAddedMessagesMap;
}

- (void)setCurrentAddedMessagesMap:(id)a3
{
  objc_storeStrong((id *)&self->_currentAddedMessagesMap, a3);
}

- (MFMessageBodyMigrator)bodyMigrator
{
  return (MFMessageBodyMigrator *)objc_getProperty(self, a2, 288, 1);
}

- (void)setBodyMigrator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (EFCancelable)stateCaptureCancelable
{
  return self->_stateCaptureCancelable;
}

- (NSCache)messagesParsedCache
{
  return self->_messagesParsedCache;
}

- (MFMessageAttachmentMigrator)attachmentMigrator
{
  return (MFMessageAttachmentMigrator *)objc_getProperty(self, a2, 304, 1);
}

- (void)setAttachmentMigrator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (OS_dispatch_queue)indexingQueue
{
  return self->_indexingQueue;
}

- (MFMailMessageLibrarySwiftPropertiesProtocol)swiftProperties
{
  return self->_swiftProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftProperties, 0);
  objc_storeStrong((id *)&self->_indexingQueue, 0);
  objc_storeStrong((id *)&self->_attachmentMigrator, 0);
  objc_storeStrong((id *)&self->_stateCaptureCancelable, 0);
  objc_storeStrong((id *)&self->_bodyMigrator, 0);
  objc_storeStrong((id *)&self->_currentAddedMessagesMap, 0);
  objc_storeStrong((id *)&self->_fileRemovalAfterCompactionScheduler, 0);
  objc_storeStrong((id *)&self->_queryParser, 0);
  objc_storeStrong((id *)&self->_searchableIndexScheduler, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_optionsToQueries, 0);
  objc_storeStrong((id *)&self->_mailboxURLsToMailboxIDs, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_unreconciledMessageCountObservable, 0);
  objc_storeStrong((id *)&self->_messagesParsedCache, 0);
  objc_storeStrong((id *)&self->_remoteContentParser, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
  objc_storeStrong((id *)&self->_parallelCompressionQueue, 0);
  objc_storeStrong((id *)&self->_messagesToThreadAtUnlock, 0);
  objc_storeStrong((id *)&self->_conversationCalculationQueue, 0);
  objc_storeStrong((id *)&self->_keyBagQueue, 0);
  objc_storeStrong((id *)&self->_enabledAccountMailboxesExpression, 0);
  objc_storeStrong((id *)&self->_nonLocalAccountClause, 0);
  objc_storeStrong((id *)&self->_activeMailboxesClause, 0);
  objc_storeStrong((id *)&self->_activeAccountsCondition, 0);
  objc_storeStrong((id *)&self->_statsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mailboxCache, 0);
  objc_storeStrong((id *)&self->_libraryMessageCache, 0);
  objc_storeStrong((id *)&self->_attachmentDataProvider, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)notifyNewData:(id)a3 availableForMessage:(id)a4
{
  id v5;
  id v6;
  MFMailMessageLibrary *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  swift_getObjectType();
  v5 = a3;
  v6 = a4;
  v7 = self;
  v9 = sub_1A5949F90();
  v10 = v8;
  sub_1A53081D0(v9, v8, a4);
  sub_1A51625F0(v9, v10);

}

void __67__MFMailMessageLibrary_updateFlagsForMessages_changes_transformer___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_16(&dword_1A4F90000, a3, (uint64_t)a3, "found message flags discrepancy", a1);
}

- (void)_writeEmlxData:(uint64_t)a3 toFile:(uint64_t)a4 protectionClass:(uint64_t)a5 purgeable:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "Failed to open temporary EMLX file: %{errno}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_writeEmlxData:toFile:protectionClass:purgeable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Unable to create URL for temporary EMLX file '%{public}s'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_writeEmlxData:(uint64_t)a3 toFile:protectionClass:purgeable:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_15((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v6, v4, "Failed to move temporary file into place '%{public}@': %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_writeEmlxData:(int)a1 toFile:(NSObject *)a2 protectionClass:purgeable:.cold.4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_DEBUG, "rename(2) failed (%{errno}d). Using NSFileManager fallback.", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_9();
}

- (void)_writeEmlxData:(void *)a1 toFile:(uint8_t *)buf protectionClass:(int)a3 purgeable:(os_log_t)log .cold.5(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Failed to mark file '%@' as purgeable: %{errno}d", buf, 0x12u);

  OUTLINED_FUNCTION_1();
}

- (void)_writeEmlxData:toFile:protectionClass:purgeable:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Failed to write data to temporary EMLX file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addReferenceForContext:usingDatabaseConnection:generationWindow:mergeHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1A4F90000, v0, v1, "adding message references took %.2f (messageID: %lld)", v2);
  OUTLINED_FUNCTION_5();
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11(&dword_1A4F90000, v0, v1, "inserting message failed, rolling back transaction", v2);
  OUTLINED_FUNCTION_9();
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_2(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a4, (uint64_t)a3, "error importing message %{public}@, aborting", a2);

  OUTLINED_FUNCTION_1();
}

void __141__MFMailMessageLibrary_addMessages_withMailbox_newMessagesByOldMessage_remoteIDs_setFlags_addPOPUIDs_dataSectionsByMessage_generationWindow___block_invoke_cold_3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_11(&dword_1A4F90000, a3, (uint64_t)a3, "source mailbox is nil", a1);
}

void __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "[updateThreadingInfoForMessage] updating conversation id for message with library id %lld failed", (uint8_t *)a1);
}

void __66__MFMailMessageLibrary_updateThreadingInfoForMessage_fromHeaders___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a3;
  OUTLINED_FUNCTION_4(&dword_1A4F90000, a4, a3, "The message didn't get updated: message.conversationID: %lld, resolved conversationID: %lld", (uint8_t *)a1);
}

void __104__MFMailMessageLibrary_newestUIDsMissingPartsForMailbox_excluding_inLatest_limit_maximumMessagesToScan___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4F90000, a2, a3, "_enumerateNamesInDir failed (%{errno}d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox:excluding:inLatest:kind:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v0, v1, "_enumerateMessageRemoteIDAndGlobalUsingBatchesForMailbox took %.3g s (%zi iterations)", v2);
  OUTLINED_FUNCTION_5();
}

void __121__MFMailMessageLibrary__enumerateMessageRemoteIDAndGlobalForMailbox_excluding_inLatest_dateReceivedMax_limit_kind_block___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Could not execute sqlite statement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__MFMailMessageLibrary_setSequenceIdentifier_forMailbox___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a2, a3, "could not update sequence identifier for mailbox %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)urlForMailboxID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Could not get url for mailboxID %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)mailboxURLForMessage:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Trying to find mailbox for message with -1 mailbox ID: %lld", (uint8_t *)a1);
}

- (void)_canSelectMessagesWithOptions:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11(&dword_1A4F90000, v0, v1, "Trying to fetch messages after message persistence has been torn down", v2);
  OUTLINED_FUNCTION_9();
}

- (void)setData:(void *)a1 forMessage:(uint64_t)a2 isPartial:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Data for message %{public}@ is being processed multiple times", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)setSummary:(uint8_t *)buf forMessage:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Could not get mailbox for message %p (store: %p)", buf, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)setSummary:forMessage:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v7, v5, "Could not get mailbox for message %{public}@ (store: %@)", v6);

  OUTLINED_FUNCTION_1();
}

void __55__MFMailMessageLibrary_loadData_forMessage_usingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_4(&dword_1A4F90000, a2, a3, "Protected Data Not Available while fetching partName %@ for message %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_5();
}

- (void)bodyDataAtPath:headerData:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v7, v5, "Reading message from %{public}@ encountered error %{public}@", v6);

  OUTLINED_FUNCTION_1();
}

- (void)dataForMimePart:(uint64_t)a3 isComplete:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_7_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_6_0(&dword_1A4F90000, v6, v4, "#CacheLoads data from file at path %@ had error: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __92__MFMailMessageLibrary__iterateMessagesWithResultHandler_options_monitor_sqlQueryGenerator___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v7, v5, "%{public}@: Unable to form sql query, protected data available: %{public}@", v6);

  OUTLINED_FUNCTION_1();
}

void __58__MFMailMessageLibrary_performIncrementalVacuumForSchema___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Error performing incremental vacuum: %s", (uint8_t *)a2);
}

void __70__MFMailMessageLibrary_indexableMessagesWhere_sortedBy_limit_options___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "SearchableIndex: Failed to prepare statement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_messageForRow:(NSObject *)a3 options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.1(_BYTE *a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("YES");
  if (!*a1)
    v3 = CFSTR("NO");
  v4 = 134218242;
  v5 = a2;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_4(&dword_1A4F90000, a3, (uint64_t)a3, "Returning message with -1 mailbox ID: %lld (from cache = %{public}@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Message has no sender: %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_messageForRow:(uint64_t)a3 options:(uint64_t)a4 timestamp:(uint64_t)a5 connection:(uint64_t)a6 isProtectedDataAvailable:(uint64_t)a7 recipientsCache:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4F90000, a1, a3, "No externalID for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "ConversationID 0 for message (LibraryID = %lld)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Message has no mailbox: %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_messageForRow:options:timestamp:connection:isProtectedDataAvailable:recipientsCache:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "Message has -1 mailbox ID: %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_parserRemoteContentOptionsForMessage:(uint64_t)a1 shouldStoreRemoteContent:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_10(a1, a2, 3.8521e-34);
  OUTLINED_FUNCTION_6_0(&dword_1A4F90000, v2, (uint64_t)v2, "Skipping one-time code detection in message: %lld, timestamp is older than %f seconds", v3);
}

@end
