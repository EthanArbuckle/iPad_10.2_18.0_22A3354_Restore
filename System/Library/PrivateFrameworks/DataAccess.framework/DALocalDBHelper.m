@implementation DALocalDBHelper

+ (OS_os_log)os_log
{
  if (os_log_onceToken != -1)
    dispatch_once(&os_log_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)os_log_os_log;
}

void __25__DALocalDBHelper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dataaccess", "CardDAV-dbhelper");
  v1 = (void *)os_log_os_log;
  os_log_os_log = (uint64_t)v0;

}

+ (id)sharedInstanceForAccountType:(id)a3 creatingClass:(Class)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sharedInstanceForAccountType_creatingClass__lock);
  v5 = (void *)sharedInstanceForAccountType_creatingClass____sharedInstances;
  if (!sharedInstanceForAccountType_creatingClass____sharedInstances)
  {
    v6 = objc_opt_new();
    v7 = (void *)sharedInstanceForAccountType_creatingClass____sharedInstances;
    sharedInstanceForAccountType_creatingClass____sharedInstances = v6;

    v5 = (void *)sharedInstanceForAccountType_creatingClass____sharedInstances;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend((id)sharedInstanceForAccountType_creatingClass____sharedInstances, "setObject:forKeyedSubscript:", v8, v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedInstanceForAccountType_creatingClass__lock);

  return v8;
}

- (DALocalDBHelper)init
{
  DALocalDBHelper *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *abDBQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calDBQueue;
  DACalDBHelper *v7;
  DACalDBHelper *calDBHelper;
  void *v9;
  CNContactStore *v10;
  CNContactStore *contactStore;
  dispatch_queue_t v12;
  OS_dispatch_queue *noteDBQueue;
  uint64_t v14;
  NSMutableArray *saveRequests;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DALocalDBHelper;
  v2 = -[DALocalDBHelper init](&v17, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.dataaccessd.abDBQueue", 0);
    abDBQueue = v2->_abDBQueue;
    v2->_abDBQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.dataaccessd.calDBQueue", 0);
    calDBQueue = v2->_calDBQueue;
    v2->_calDBQueue = (OS_dispatch_queue *)v5;

    v7 = -[DACalDBHelper initWithDatabaseInitOptions:]([DACalDBHelper alloc], "initWithDatabaseInitOptions:", 6);
    calDBHelper = v2->_calDBHelper;
    v2->_calDBHelper = v7;

    +[DALocalDBWatcher sharedDBWatcher](DALocalDBWatcher, "sharedDBWatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DACalDBHelper setWatcher:](v2->_calDBHelper, "setWatcher:", v9);

    v10 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v10;

    v12 = dispatch_queue_create("com.apple.dataaccessd.noteDBQueue", 0);
    noteDBQueue = v2->_noteDBQueue;
    v2->_noteDBQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    saveRequests = v2->_saveRequests;
    v2->_saveRequests = (NSMutableArray *)v14;

  }
  return v2;
}

- (DALocalDBHelper)initWithContactsFamilyDelegateAltDSID:(id)a3 familyDelegateACAccountID:(id)a4
{
  id v7;
  id v8;
  DALocalDBHelper *v9;
  DALocalDBHelper *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[DALocalDBHelper init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyDelegateAltDSID, a3);
    objc_storeStrong((id *)&v10->_familyDelegateACAccountID, a4);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_saveRequests, "count");
  if (v3)
  {
    v4 = v3;
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = v4;
      _os_log_impl(&dword_1B51E4000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected unsaved contact changes: %lu", buf, 0xCu);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)DALocalDBHelper;
  -[DALocalDBHelper dealloc](&v6, sel_dealloc);
}

- (id)abChangeTrackingID
{
  NSString *v2;

  v2 = self->_clientIdentifier;
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.dataaccessd.changeinserter")))
  {

    v2 = 0;
  }
  return v2;
}

- (void)abDBThrowOnNil:(BOOL)a3
{
  void *v6;

  if (a3 && !self->_abDB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBHelper.m"), 171, CFSTR("You can't ask for an AddressBook db if you didn't open it.  Geez! %@"), objc_opt_class());

  }
  return self->_abDB;
}

- (void)abDB
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B51E4000, v1, v2, "abDB is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)addSaveRequest:(id)a3
{
  id v4;
  NSObject *abDBQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  abDBQueue = self->_abDBQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__DALocalDBHelper_addSaveRequest___block_invoke;
  block[3] = &unk_1E68CB568;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(abDBQueue, block);

}

uint64_t __34__DALocalDBHelper_addSaveRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)executeAllSaveRequests
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a2 = v6;
  _os_log_error_impl(&dword_1B51E4000, a3, OS_LOG_TYPE_ERROR, "Unexpected error committing save request :%@", a1, 0xCu);

}

- (void)removeDelegateDatabasesNotMatchingAltDSIDs:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[DALocalDBHelper useContacts](self, "useContacts"))
    ABAddressBookDirectoryOnlyKeepFamilyDatabasesWithDSIDs();

}

- (BOOL)useContacts
{
  return objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework");
}

- (void)_registerForAddressBookYieldNotifications
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B51E4000, v1, v2, "_registerForAddressBookYieldNotifications is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

void __60__DALocalDBHelper__registerForAddressBookYieldNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v2, v3, "Someone asked us to yield the AddressBook database. Bumping up all clients to UI priority", buf, 2u);
  }

  +[DAPriorityManager sharedManager](DAPriorityManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bumpDataclassesToUIPriority:", 2);

  dataaccess_get_global_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__DALocalDBHelper__registerForAddressBookYieldNotifications__block_invoke_28;
  block[3] = &unk_1E68CB3C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, block);

}

uint64_t __60__DALocalDBHelper__registerForAddressBookYieldNotifications__block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return ABAddressBookRegisterYieldBlock();
  return result;
}

- (BOOL)_abOpenDBWithClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  NSObject *abDBQueue;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DALocalDBHelper _abOpenDBWithClientIdentifier:].cold.1();

    v6 = 0;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    abDBQueue = self->_abDBQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__DALocalDBHelper__abOpenDBWithClientIdentifier___block_invoke;
    block[3] = &unk_1E68CB900;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(abDBQueue, block);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __49__DALocalDBHelper__abOpenDBWithClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  os_log_type_t *v3;
  os_log_type_t v4;
  NSObject *v5;
  __CFError *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __CFError *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  __CFError *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v25;
  __int16 v26;
  int v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (os_log_type_t *)MEMORY[0x1E0D1C448];
  if (*(_QWORD *)(v2 + 40))
  {
    v4 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  }
  else
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v4 = *((_BYTE *)v3 + 7);
    if (os_log_type_enabled(v5, v4))
    {
      v6 = *(__CFError **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1B51E4000, v5, v4, "Creating ab database for client %@", buf, 0xCu);
    }

    error = 0;
    if (_fakedOutABDBDir)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = ABAddressBookCreateWithDatabaseDirectory();
    }
    else
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length")
        && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "length"))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *MEMORY[0x1E0CF5D98];
        v28[0] = *MEMORY[0x1E0CF5DA0];
        v28[1] = v8;
        v9 = *(_QWORD *)(v7 + 48);
        v10 = *(_QWORD *)(v7 + 56);
        v29[0] = v9;
        v29[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = ABAddressBookCreateWithOptions(v11, &error);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, v4))
      {
        v15 = *(__CFError **)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 134217984;
        v25 = v15;
        _os_log_impl(&dword_1B51E4000, v14, v4, "Created ab database %p", buf, 0xCu);
      }

      ABAddressBookSetIsBackgroundProcess();
      objc_msgSend(*(id *)(a1 + 32), "_registerForAddressBookYieldNotifications");
      if (objc_msgSend(*(id *)(a1 + 40), "length"))
        ABChangeHistorySetAddressBookClientIdentifier();
      objc_msgSend(*(id *)(a1 + 32), "setClientIdentifier:", *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v16 = *((unsigned __int8 *)v3 + 3);
      if (os_log_type_enabled(v13, v3[3]))
      {
        *(_DWORD *)buf = 138412290;
        v25 = error;
        _os_log_impl(&dword_1B51E4000, v14, (os_log_type_t)v16, "Couldn't create ab database: %@", buf, 0xCu);
      }

    }
    if (error)
      CFRelease(error);
    v2 = *(_QWORD *)(a1 + 32);
  }
  ++*(_DWORD *)(v2 + 32);
  DALoggingwithCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, v4))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(__CFError **)(v18 + 40);
    LODWORD(v18) = *(_DWORD *)(v18 + 32);
    *(_DWORD *)buf = 134218240;
    v25 = v19;
    v26 = 1024;
    v27 = v18;
    _os_log_impl(&dword_1B51E4000, v17, v4, "AB database %p opened. Connection count is now %d", buf, 0x12u);
  }

  if (*(int *)(*(_QWORD *)(a1 + 32) + 32) >= 2)
  {
    DALoggingwithCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *((_BYTE *)v3 + 6);
    if (os_log_type_enabled(v20, v21))
    {
      v22 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v22;
      _os_log_impl(&dword_1B51E4000, v20, v21, "_abConnectionCount is > 1, at %d", buf, 8u);
    }

  }
}

- (void)abOpenDBWithClientIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DALocalDBHelper abOpenDBWithClientIdentifier:].cold.1();

  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBHelper.m"), 292, CFSTR("ClientIdentifier can not be nil"));

    }
    -[DALocalDBHelper _abOpenDBWithClientIdentifier:](self, "_abOpenDBWithClientIdentifier:", v5);
  }

}

- (void)abOpenDBAsGenericClient
{
  if ((objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework") & 1) == 0)
  {
    if (-[DALocalDBHelper _abOpenDBWithClientIdentifier:](self, "_abOpenDBWithClientIdentifier:", 0))
      ABChangeHistorySetAddressBookClientIdentifier();
  }
}

- (void)abProcessAddedRecords
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B51E4000, v1, v2, "abOpenDBAsGenericClient is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)abProcessAddedImages
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  if (objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[DALocalDBHelper abProcessAddedRecords].cold.1();

  }
  else
  {
    ABProcessAddedImages();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CF6340], 0, 0, 1u);
    +[DALocalDBGateKeeper sharedGateKeeper](DALocalDBGateKeeper, "sharedGateKeeper");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "claimedOwnershipOfDataclasses:", 2);

  }
}

- (void)abValidateDefaultSource
{
  ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded();
}

- (BOOL)abSaveDB
{
  NSObject *v3;

  if (!objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework"))
    return ABAddressBookSave(self->_abDB, 0);
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[DALocalDBHelper abSaveDB].cold.1();

  return 0;
}

- (BOOL)abCloseDBAndSave:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  BOOL v6;
  NSObject *abDBQueue;
  _QWORD block[5];

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DALocalDBHelper abSaveDB].cold.1();

    return 0;
  }
  else
  {
    v6 = !v3 || -[DALocalDBHelper abSaveDB](self, "abSaveDB");
    abDBQueue = self->_abDBQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__DALocalDBHelper_abCloseDBAndSave___block_invoke;
    block[3] = &unk_1E68CB3C8;
    block[4] = self;
    dispatch_sync(abDBQueue, block);
  }
  return v6;
}

void __36__DALocalDBHelper_abCloseDBAndSave___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = MEMORY[0x1E0D1C448];
  if ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) & 0x80000000) != 0)
  {
    DALoggingwithCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(v2 + 3);
    if (os_log_type_enabled(v3, v4))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v14 = 67109120;
      LODWORD(v15) = v5;
      _os_log_impl(&dword_1B51E4000, v3, v4, "_abCloseDB called too many times (connection count %d).  Resetting count to 0", (uint8_t *)&v14, 8u);
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(v2 + 7);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 40);
    LODWORD(v8) = *(_DWORD *)(v8 + 32);
    v14 = 134218240;
    v15 = v9;
    v16 = 1024;
    v17 = v8;
    _os_log_impl(&dword_1B51E4000, v6, v7, "Decrementing database %p reference count. _abConnectionCount is %d", (uint8_t *)&v14, 0x12u);
  }

  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, v7))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v14 = 134217984;
      v15 = v11;
      _os_log_impl(&dword_1B51E4000, v10, v7, "Destroying ab database %p", (uint8_t *)&v14, 0xCu);
    }

    ABAddressBookRegisterYieldBlock();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(const void **)(v12 + 40);
    if (v13)
    {
      CFRelease(v13);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
      v12 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v12 + 40) = 0;
  }
}

- (id)abConstraintPlistPath
{
  return 0;
}

- (id)abDefaultAccountInfoSuitableForLogging
{
  __CFString *v2;
  void *v3;
  ABRecordRef v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0D1C3E8], "useContactsFramework") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ABAddressBookCopyDefaultSource((ABAddressBookRef)objc_msgSend(v3, "abDBThrowOnNil:", 0));

    if (v4)
    {
      if (ABRecordGetIntValue())
      {
        sharedDAAccountStore();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          ABAccountStoreGetAccountTypeForSource();
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v2 = CFSTR("<unknown>");
        }

      }
      else
      {
        v2 = CFSTR("local");
      }
      CFRelease(v4);
    }
    else
    {
      v2 = CFSTR("<unknown>");
    }
  }
  return v2;
}

- (CalDatabase)calDatabaseForAccountID:(id)a3
{
  return -[DACalDBHelper databaseForAccountID:](self->_calDBHelper, "databaseForAccountID:", a3);
}

- (CalDatabase)calDatabaseForAuxDatabaseRef:(void *)a3
{
  return -[DACalDBHelper databaseForAuxDatabaseRef:](self->_calDBHelper, "databaseForAuxDatabaseRef:", a3);
}

- (void)calOpenDatabaseForAccountID:(id)a3 clientID:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBHelper.m"), 421, CFSTR("ClientIdentifier can not be nil"));

  }
  -[DACalDBHelper openDatabaseForAccountID:clientID:](self->_calDBHelper, "openDatabaseForAccountID:clientID:", v9, v7);

}

- (void)calOpenDatabaseForAuxDatabaseRef:(void *)a3 clientID:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBHelper.m"), 426, CFSTR("ClientIdentifier can not be nil"));

    v7 = 0;
  }
  -[DACalDBHelper openDatabaseForAuxDatabaseRef:clientID:](self->_calDBHelper, "openDatabaseForAuxDatabaseRef:clientID:", a3, v7);

}

- (void)calOpenDatabaseAsGenericClientForAccountID:(id)a3
{
  -[DACalDBHelper openDatabaseForAccountID:clientID:](self->_calDBHelper, "openDatabaseForAccountID:clientID:", a3, 0);
}

- (void)calOpenDatabaseAsGenericClientForAuxDatabaseRef:(void *)a3
{
  -[DACalDBHelper openDatabaseForAuxDatabaseRef:clientID:](self->_calDBHelper, "openDatabaseForAuxDatabaseRef:clientID:", a3, 0);
}

- (BOOL)calSaveDatabaseForAccountID:(id)a3
{
  return -[DACalDBHelper saveDatabaseForAccountID:flushCaches:](self->_calDBHelper, "saveDatabaseForAccountID:flushCaches:", a3, 0);
}

- (BOOL)calSaveDatabaseAndFlushCachesForAccountID:(id)a3
{
  return -[DACalDBHelper saveDatabaseForAccountID:flushCaches:](self->_calDBHelper, "saveDatabaseForAccountID:flushCaches:", a3, 1);
}

- (BOOL)calSaveDatabaseForAuxDatabaseRef:(void *)a3
{
  return -[DACalDBHelper saveDatabaseForAuxDatabaseRef:flushCaches:](self->_calDBHelper, "saveDatabaseForAuxDatabaseRef:flushCaches:", a3, 0);
}

- (BOOL)calCloseDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  return -[DACalDBHelper closeDatabaseForAccountID:save:](self->_calDBHelper, "closeDatabaseForAccountID:save:", a3, a4);
}

- (BOOL)calCloseDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  return -[DACalDBHelper closeDatabaseForAuxDatabaseRef:save:](self->_calDBHelper, "closeDatabaseForAuxDatabaseRef:save:", a3, a4);
}

- (NoteContext)noteDB
{
  NoteContext *noteDB;
  void *v6;

  noteDB = self->_noteDB;
  if (!noteDB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DALocalDBHelper.m"), 463, CFSTR("You can't ask for a note db if you didn't open it.  Geez! %@"), objc_opt_class());

    noteDB = self->_noteDB;
  }
  return noteDB;
}

- (void)noteOpenDB
{
  NSObject *noteDBQueue;
  _QWORD block[5];

  noteDBQueue = self->_noteDBQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DALocalDBHelper_noteOpenDB__block_invoke;
  block[3] = &unk_1E68CB3C8;
  block[4] = self;
  dispatch_sync(noteDBQueue, block);
}

void __29__DALocalDBHelper_noteOpenDB__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0D1C448];
  if (!*(_QWORD *)(v2 + 96))
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(v3 + 7);
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1B51E4000, v4, v5, "Creating note database", (uint8_t *)&v19, 2u);
    }

    v6 = objc_opt_new();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 96);
    *(_QWORD *)(v7 + 96) = v6;

    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, v5))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v19 = 134217984;
      v20 = v10;
      _os_log_impl(&dword_1B51E4000, v9, v5, "Created note database %p", (uint8_t *)&v19, 0xCu);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  v11 = *(_DWORD *)(v2 + 36);
  if (!v11)
  {
    objc_msgSend(*(id *)(v2 + 96), "enableChangeLogging:", 0);
    v2 = *(_QWORD *)(a1 + 32);
    v11 = *(_DWORD *)(v2 + 36);
  }
  *(_DWORD *)(v2 + 36) = v11 + 1;
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(v3 + 7);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(v14 + 96);
    LODWORD(v14) = *(_DWORD *)(v14 + 36);
    v19 = 134218240;
    v20 = v15;
    v21 = 1024;
    v22 = v14;
    _os_log_impl(&dword_1B51E4000, v12, v13, "Note database %p opened. Connection count is now %d", (uint8_t *)&v19, 0x12u);
  }

  if (*(int *)(*(_QWORD *)(a1 + 32) + 36) >= 2)
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(v3 + 6);
    if (os_log_type_enabled(v16, v17))
    {
      v18 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
      v19 = 67109120;
      LODWORD(v20) = v18;
      _os_log_impl(&dword_1B51E4000, v16, v17, "_noteConnectionCount is > 1, at %d", (uint8_t *)&v19, 8u);
    }

  }
}

- (BOOL)noteSaveDB
{
  NSObject *v3;
  uint64_t v4;
  os_log_type_t v5;
  NoteContext *noteDB;
  int noteConnectionCount;
  NoteContext *v8;
  char v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  NoteContext *v13;
  id v15;
  uint8_t buf[4];
  NoteContext *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0D1C448];
  v5 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v3, v5))
  {
    noteDB = self->_noteDB;
    noteConnectionCount = self->_noteConnectionCount;
    *(_DWORD *)buf = 134218240;
    v17 = noteDB;
    v18 = 1024;
    LODWORD(v19) = noteConnectionCount;
    _os_log_impl(&dword_1B51E4000, v3, v5, "Saving notes database %p. Connection count is %d", buf, 0x12u);
  }

  v8 = self->_noteDB;
  v15 = 0;
  v9 = -[NoteContext save:](v8, "save:", &v15);
  v10 = v15;
  if ((v9 & 1) == 0)
  {
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_BYTE *)(v4 + 3);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = self->_noteDB;
      *(_DWORD *)buf = 134218242;
      v17 = v13;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1B51E4000, v11, v12, "Saving notes database %p failed with error %@", buf, 0x16u);
    }

  }
  return v9;
}

- (BOOL)noteCloseDBAndSave:(BOOL)a3
{
  BOOL v4;
  NSObject *noteDBQueue;
  _QWORD block[5];

  v4 = !a3 || -[DALocalDBHelper noteSaveDB](self, "noteSaveDB");
  noteDBQueue = self->_noteDBQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DALocalDBHelper_noteCloseDBAndSave___block_invoke;
  block[3] = &unk_1E68CB3C8;
  block[4] = self;
  dispatch_sync(noteDBQueue, block);
  return v4;
}

void __38__DALocalDBHelper_noteCloseDBAndSave___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0D1C448];
  v4 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 7);
  if (os_log_type_enabled(v2, v4))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 96);
    LODWORD(v5) = *(_DWORD *)(v5 + 36);
    v15 = 134218240;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_1B51E4000, v2, v4, "Decrementing database %p reference count. _noteConnectionCount is %d", (uint8_t *)&v15, 0x12u);
  }

  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
  if ((v7 & 0x80000000) == 0)
  {
    if (v7)
      return;
    goto LABEL_9;
  }
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(v3 + 3);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v15 = 67109120;
    LODWORD(v16) = v10;
    _os_log_impl(&dword_1B51E4000, v8, v9, "_noteCloseDB called too many times (connection count %d).  Resetting count to 0", (uint8_t *)&v15, 8u);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = 0;
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 36))
  {
LABEL_9:
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, v4))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v15 = 134217984;
      v16 = v12;
      _os_log_impl(&dword_1B51E4000, v11, v4, "Destroying notes database %p", (uint8_t *)&v15, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 96);
    *(_QWORD *)(v13 + 96) = 0;

  }
}

- (int)noteConnectionCount
{
  return self->_noteConnectionCount;
}

+ (void)abSetTestABDBDir:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B51E4000, v5, v6, "Setting unit test Address Book Database directory to: %@", (uint8_t *)&v7, 0xCu);
  }

  if ((id)_fakedOutABDBDir != v4)
    objc_storeStrong((id *)&_fakedOutABDBDir, a3);

}

+ (id)abTestABDBDir
{
  return (id)_fakedOutABDBDir;
}

+ (void)calSetMainDatabasePath:(id)a3 containerProvider:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  DALoggingwithCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v7, v8))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B51E4000, v7, v8, "Setting unit test Calendar Main Database directory to: %@, Container Provider: %@", (uint8_t *)&v15, 0x16u);
  }

  +[DACalDBHelper mainDatabasePath](DACalDBHelper, "mainDatabasePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v9) & 1) != 0)
  {
    +[DACalDBHelper containerProvider](DACalDBHelper, "containerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqual:", v10);

    if ((v11 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  +[DACalDBHelper setMainDatabasePath:containerProvider:](DACalDBHelper, "setMainDatabasePath:containerProvider:", v5, v6);
  objc_msgSend(v5, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    +[DALocalDBWatcher sharedDBWatcher](DALocalDBWatcher, "sharedDBWatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "noteCalDBDirChanged");

  }
LABEL_9:

}

+ (id)calMainDatabasePath
{
  return +[DACalDBHelper mainDatabasePath](DACalDBHelper, "mainDatabasePath");
}

+ (id)calContainerProvider
{
  return +[DACalDBHelper containerProvider](DACalDBHelper, "containerProvider");
}

- (void)setAbDB:(void *)a3
{
  self->_abDB = a3;
}

- (NSString)familyDelegateAltDSID
{
  return self->_familyDelegateAltDSID;
}

- (void)setFamilyDelegateAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_familyDelegateAltDSID, a3);
}

- (NSString)familyDelegateACAccountID
{
  return self->_familyDelegateACAccountID;
}

- (void)setFamilyDelegateACAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_familyDelegateACAccountID, a3);
}

- (NSMutableArray)saveRequests
{
  return self->_saveRequests;
}

- (void)setSaveRequests:(id)a3
{
  objc_storeStrong((id *)&self->_saveRequests, a3);
}

- (int)abConnectionCount
{
  return self->_abConnectionCount;
}

- (void)setAbConnectionCount:(int)a3
{
  self->_abConnectionCount = a3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (DACalDBHelper)calDBHelper
{
  return self->_calDBHelper;
}

- (void)setCalDBHelper:(id)a3
{
  objc_storeStrong((id *)&self->_calDBHelper, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (void)setNoteDB:(id)a3
{
  objc_storeStrong((id *)&self->_noteDB, a3);
}

- (void)setNoteConnectionCount:(int)a3
{
  self->_noteConnectionCount = a3;
}

- (id)calUnitTestCallbackBlock
{
  return self->_calUnitTestCallbackBlock;
}

- (void)setCalUnitTestCallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calUnitTestCallbackBlock, 0);
  objc_storeStrong((id *)&self->_noteDB, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calDBHelper, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_saveRequests, 0);
  objc_storeStrong((id *)&self->_familyDelegateACAccountID, 0);
  objc_storeStrong((id *)&self->_familyDelegateAltDSID, 0);
  objc_storeStrong((id *)&self->_noteDBQueue, 0);
  objc_storeStrong((id *)&self->_calDBQueue, 0);
  objc_storeStrong((id *)&self->_abDBQueue, 0);
}

- (void)_abOpenDBWithClientIdentifier:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B51E4000, v1, v2, "_abOpenDBWithClientIdentifier is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)abOpenDBWithClientIdentifier:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B51E4000, v1, v2, "abOpenDBWithClientIdentifier is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)abSaveDB
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B51E4000, v1, v2, "abSaveDB is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
