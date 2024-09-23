@implementation ESLocalDBHelper

+ (OS_os_log)os_log
{
  if (os_log_onceToken != -1)
    dispatch_once(&os_log_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)os_log_os_log;
}

void __25__ESLocalDBHelper_os_log__block_invoke()
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

  return v8;
}

- (ESLocalDBHelper)init
{
  ESLocalDBHelper *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *abDBQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calDBQueue;
  ESCalDBHelper *v7;
  ESCalDBHelper *calDBHelper;
  dispatch_queue_t v9;
  OS_dispatch_queue *noteDBQueue;
  uint64_t v11;
  NSMutableArray *saveRequests;
  CNContactStore *v13;
  CNContactStore *contactStore;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ESLocalDBHelper;
  v2 = -[ESLocalDBHelper init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.dataaccessd.abDBQueue", 0);
    abDBQueue = v2->_abDBQueue;
    v2->_abDBQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.dataaccessd.calDBQueue", 0);
    calDBQueue = v2->_calDBQueue;
    v2->_calDBQueue = (OS_dispatch_queue *)v5;

    v7 = -[ESCalDBHelper initWithDatabaseInitOptions:]([ESCalDBHelper alloc], "initWithDatabaseInitOptions:", 6);
    calDBHelper = v2->_calDBHelper;
    v2->_calDBHelper = v7;

    v9 = dispatch_queue_create("com.apple.dataaccessd.noteDBQueue", 0);
    noteDBQueue = v2->_noteDBQueue;
    v2->_noteDBQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    saveRequests = v2->_saveRequests;
    v2->_saveRequests = (NSMutableArray *)v11;

    v13 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v13;

  }
  return v2;
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

  v9 = *MEMORY[0x24BDAC8D0];
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
      _os_log_impl(&dword_22AC94000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected unsaved contact changes: %lu", buf, 0xCu);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)ESLocalDBHelper;
  -[ESLocalDBHelper dealloc](&v6, sel_dealloc);
}

- (id)changeTrackingID
{
  NSString *v3;
  NSString *clientIdentifier;
  NSString *v5;

  -[ESCalDBHelper clientIdentifier](self->_calDBHelper, "clientIdentifier");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = v3;
  if (!v3)
    clientIdentifier = self->_clientIdentifier;
  v5 = clientIdentifier;

  if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.dataaccessd.changeinserter")))
  {

    v5 = 0;
  }
  return v5;
}

- (void)abDBThrowOnNil:(BOOL)a3
{
  void *v6;

  if (a3 && !self->_abDB)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESLocalDBHelper.m"), 128, CFSTR("You can't ask for an AddressBook db if you didn't open it.  Geez! %@"), objc_opt_class());

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

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC94000, v1, v2, "abDB is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ESLocalDBHelper_addSaveRequest___block_invoke;
  block[3] = &unk_24F4DE100;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(abDBQueue, block);

}

uint64_t __34__ESLocalDBHelper_addSaveRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)executeAllSaveRequests
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a2 = v6;
  _os_log_error_impl(&dword_22AC94000, a3, OS_LOG_TYPE_ERROR, "Unexpected error committing save request :%@", a1, 0xCu);

}

- (BOOL)useContacts
{
  return objc_msgSend(MEMORY[0x24BE2ACD8], "useContactsFramework");
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

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC94000, v1, v2, "_registerForAddressBookYieldNotifications is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

void __60__ESLocalDBHelper__registerForAddressBookYieldNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC94000, v2, v3, "Someone asked us to yield the AddressBook database. Bumping up all clients to UI priority", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE2AAD0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bumpDataclassesToUIPriority:", 2);

  dataaccess_get_global_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ESLocalDBHelper__registerForAddressBookYieldNotifications__block_invoke_27;
  block[3] = &unk_24F4DE210;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, block);

}

uint64_t __60__ESLocalDBHelper__registerForAddressBookYieldNotifications__block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
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
  if (-[ESLocalDBHelper useContacts](self, "useContacts"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ESLocalDBHelper _abOpenDBWithClientIdentifier:].cold.1();

    v6 = 0;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    abDBQueue = self->_abDBQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__ESLocalDBHelper__abOpenDBWithClientIdentifier___block_invoke;
    block[3] = &unk_24F4DE3D8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(abDBQueue, block);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __49__ESLocalDBHelper__abOpenDBWithClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  os_log_type_t *v3;
  os_log_type_t v4;
  NSObject *v5;
  __CFError *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __CFError *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  __CFError *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (os_log_type_t *)MEMORY[0x24BE2AD38];
  if (*(_QWORD *)(v2 + 48))
  {
    v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
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
      v21 = v6;
      _os_log_impl(&dword_22AC94000, v5, v4, "Creating ab database for client %@", buf, 0xCu);
    }

    error = 0;
    if (_fakedOutABDBDir)
      v7 = ABAddressBookCreateWithDatabaseDirectory();
    else
      v7 = (uint64_t)ABAddressBookCreateWithOptions(0, &error);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = v7;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, v4))
      {
        v11 = *(__CFError **)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 134217984;
        v21 = v11;
        _os_log_impl(&dword_22AC94000, v10, v4, "Created ab database %p", buf, 0xCu);
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
      v12 = *((unsigned __int8 *)v3 + 3);
      if (os_log_type_enabled(v9, v3[3]))
      {
        *(_DWORD *)buf = 138412290;
        v21 = error;
        _os_log_impl(&dword_22AC94000, v10, (os_log_type_t)v12, "Couldn't create ab database: %@", buf, 0xCu);
      }

    }
    if (error)
      CFRelease(error);
    v2 = *(_QWORD *)(a1 + 32);
  }
  ++*(_DWORD *)(v2 + 32);
  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, v4))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(__CFError **)(v14 + 48);
    LODWORD(v14) = *(_DWORD *)(v14 + 32);
    *(_DWORD *)buf = 134218240;
    v21 = v15;
    v22 = 1024;
    v23 = v14;
    _os_log_impl(&dword_22AC94000, v13, v4, "AB database %p opened. Connection count is now %d", buf, 0x12u);
  }

  if (*(int *)(*(_QWORD *)(a1 + 32) + 32) >= 2)
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *((_BYTE *)v3 + 6);
    if (os_log_type_enabled(v16, v17))
    {
      v18 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v18;
      _os_log_impl(&dword_22AC94000, v16, v17, "_abConnectionCount is > 1, at %d", buf, 8u);
    }

  }
}

- (void)abOpenDBWithClientIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a3;
  if (-[ESLocalDBHelper useContacts](self, "useContacts"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ESLocalDBHelper abOpenDBWithClientIdentifier:].cold.1();

  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESLocalDBHelper.m"), 235, CFSTR("ClientIdentifier can not be nil"));

    }
    -[ESLocalDBHelper _abOpenDBWithClientIdentifier:](self, "_abOpenDBWithClientIdentifier:", v5);
  }

}

- (void)abOpenDBAsGenericClient
{
  if (!-[ESLocalDBHelper useContacts](self, "useContacts"))
  {
    if (-[ESLocalDBHelper _abOpenDBWithClientIdentifier:](self, "_abOpenDBWithClientIdentifier:", 0))
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

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC94000, v1, v2, "abOpenDBAsGenericClient is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)abProcessAddedImages
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  if (-[ESLocalDBHelper useContacts](self, "useContacts"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[ESLocalDBHelper abProcessAddedRecords].cold.1();

  }
  else
  {
    ABProcessAddedImages();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE02938], 0, 0, 1u);
    objc_msgSend(MEMORY[0x24BE2AAB8], "sharedGateKeeper");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "claimedOwnershipOfDataclasses:", 2);

  }
}

- (BOOL)abSaveDB
{
  NSObject *v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  void *abDB;
  int abConnectionCount;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[ESLocalDBHelper useContacts](self, "useContacts"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[ESLocalDBHelper abSaveDB].cold.1();
    v4 = 0;
  }
  else
  {
    +[ESLocalDBWatcher sharedDBWatcher](ESLocalDBWatcher, "sharedDBWatcher");
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject lastSavedABSequenceNumber](v3, "lastSavedABSequenceNumber");
    -[NSObject setLastSavedABSequenceNumber:](v3, "setLastSavedABSequenceNumber:", ABAddressBookGetSequenceNumber());
    DALoggingwithCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v6, v7))
    {
      abDB = self->_abDB;
      abConnectionCount = self->_abConnectionCount;
      v11 = 134218496;
      v12 = abDB;
      v13 = 1024;
      v14 = v5;
      v15 = 1024;
      v16 = abConnectionCount;
      _os_log_impl(&dword_22AC94000, v6, v7, "Saving ab database %p old sequence %d. Connection count is %d", (uint8_t *)&v11, 0x18u);
    }

    v4 = ABAddressBookSave(self->_abDB, 0);
    if (!v4)
      -[NSObject setLastSavedABSequenceNumber:](v3, "setLastSavedABSequenceNumber:", v5);
    -[ESLocalDBHelper _registerForAddressBookYieldNotifications](self, "_registerForAddressBookYieldNotifications");
  }

  return v4;
}

- (BOOL)abCloseDBAndSave:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  BOOL v6;
  NSObject *abDBQueue;
  _QWORD block[5];

  v3 = a3;
  if (-[ESLocalDBHelper useContacts](self, "useContacts"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ESLocalDBHelper abSaveDB].cold.1();

    return 0;
  }
  else
  {
    v6 = !v3 || -[ESLocalDBHelper abSaveDB](self, "abSaveDB");
    abDBQueue = self->_abDBQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ESLocalDBHelper_abCloseDBAndSave___block_invoke;
    block[3] = &unk_24F4DE210;
    block[4] = self;
    dispatch_sync(abDBQueue, block);
  }
  return v6;
}

void __36__ESLocalDBHelper_abCloseDBAndSave___block_invoke(uint64_t a1)
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

  v18 = *MEMORY[0x24BDAC8D0];
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = MEMORY[0x24BE2AD38];
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
      _os_log_impl(&dword_22AC94000, v3, v4, "_abCloseDB called too many times (connection count %d).  Resetting count to 0", (uint8_t *)&v14, 8u);
    }

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  DALoggingwithCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_BYTE *)(v2 + 7);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 48);
    LODWORD(v8) = *(_DWORD *)(v8 + 32);
    v14 = 134218240;
    v15 = v9;
    v16 = 1024;
    v17 = v8;
    _os_log_impl(&dword_22AC94000, v6, v7, "Decrementing database %p reference count. _abConnectionCount is %d", (uint8_t *)&v14, 0x12u);
  }

  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, v7))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      v14 = 134217984;
      v15 = v11;
      _os_log_impl(&dword_22AC94000, v10, v7, "Destroying ab database %p", (uint8_t *)&v14, 0xCu);
    }

    ABAddressBookRegisterYieldBlock();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(const void **)(v12 + 48);
    if (v13)
    {
      CFRelease(v13);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
      v12 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v12 + 48) = 0;
  }
}

- (id)abConstraintPlistPath
{
  return 0;
}

- (CalDatabase)calDatabaseForAccountID:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  CalDatabase *v7;
  uint8_t v9[16];

  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22AC94000, v5, v6, "Data_Separation: Invoking calDatabaseForAccountID", v9, 2u);
  }

  v7 = -[ESCalDBHelper databaseForAccountID:](self->_calDBHelper, "databaseForAccountID:", v4);
  return v7;
}

- (CalDatabase)calDatabaseForAuxDatabaseRef:(void *)a3
{
  return -[ESCalDBHelper databaseForAuxDatabaseRef:](self->_calDBHelper, "databaseForAuxDatabaseRef:", a3);
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
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESLocalDBHelper.m"), 350, CFSTR("ClientIdentifier can not be nil"));

  }
  -[ESCalDBHelper openDatabaseForAccountID:clientID:](self->_calDBHelper, "openDatabaseForAccountID:clientID:", v9, v7);

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
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESLocalDBHelper.m"), 355, CFSTR("ClientIdentifier can not be nil"));

    v7 = 0;
  }
  -[ESCalDBHelper openDatabaseForAuxDatabaseRef:clientID:](self->_calDBHelper, "openDatabaseForAuxDatabaseRef:clientID:", a3, v7);

}

- (void)calOpenDatabaseAsGenericClientForAccountID:(id)a3
{
  -[ESCalDBHelper openDatabaseForAccountID:clientID:](self->_calDBHelper, "openDatabaseForAccountID:clientID:", a3, 0);
}

- (void)calOpenDatabaseAsGenericClientForAuxDatabaseRef:(void *)a3
{
  -[ESCalDBHelper openDatabaseForAuxDatabaseRef:clientID:](self->_calDBHelper, "openDatabaseForAuxDatabaseRef:clientID:", a3, 0);
}

- (BOOL)calSaveDatabaseForAccountID:(id)a3
{
  return -[ESCalDBHelper saveDatabaseForAccountID:flushCaches:](self->_calDBHelper, "saveDatabaseForAccountID:flushCaches:", a3, 0);
}

- (BOOL)calSaveDatabaseAndFlushCachesForAccountID:(id)a3
{
  return -[ESCalDBHelper saveDatabaseForAccountID:flushCaches:](self->_calDBHelper, "saveDatabaseForAccountID:flushCaches:", a3, 1);
}

- (BOOL)calSaveDatabaseForAuxDatabaseRef:(void *)a3
{
  return -[ESCalDBHelper saveDatabaseForAuxDatabaseRef:flushCaches:](self->_calDBHelper, "saveDatabaseForAuxDatabaseRef:flushCaches:", a3, 0);
}

- (BOOL)calCloseDatabaseForAccountID:(id)a3 save:(BOOL)a4
{
  return -[ESCalDBHelper closeDatabaseForAccountID:save:](self->_calDBHelper, "closeDatabaseForAccountID:save:", a3, a4);
}

- (BOOL)calCloseDatabaseForAuxDatabaseRef:(void *)a3 save:(BOOL)a4
{
  return -[ESCalDBHelper closeDatabaseForAuxDatabaseRef:save:](self->_calDBHelper, "closeDatabaseForAuxDatabaseRef:save:", a3, a4);
}

- (NoteContext)noteDB
{
  NoteContext *noteDB;
  void *v6;

  noteDB = self->_noteDB;
  if (!noteDB)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ESLocalDBHelper.m"), 390, CFSTR("You can't ask for a note db if you didn't open it.  Geez! %@"), objc_opt_class());

    noteDB = self->_noteDB;
  }
  return noteDB;
}

- (void)noteOpenDB
{
  NSObject *noteDBQueue;
  _QWORD block[5];

  noteDBQueue = self->_noteDBQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ESLocalDBHelper_noteOpenDB__block_invoke;
  block[3] = &unk_24F4DE210;
  block[4] = self;
  dispatch_sync(noteDBQueue, block);
}

void __29__ESLocalDBHelper_noteOpenDB__block_invoke(uint64_t a1)
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

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x24BE2AD38];
  if (!*(_QWORD *)(v2 + 96))
  {
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(v3 + 7);
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_22AC94000, v4, v5, "Creating note database", (uint8_t *)&v19, 2u);
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
      _os_log_impl(&dword_22AC94000, v9, v5, "Created note database %p", (uint8_t *)&v19, 0xCu);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  v11 = *(_DWORD *)(v2 + 40);
  if (!v11)
  {
    objc_msgSend(*(id *)(v2 + 96), "enableChangeLogging:", 0);
    v2 = *(_QWORD *)(a1 + 32);
    v11 = *(_DWORD *)(v2 + 40);
  }
  *(_DWORD *)(v2 + 40) = v11 + 1;
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(v3 + 7);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(v14 + 96);
    LODWORD(v14) = *(_DWORD *)(v14 + 40);
    v19 = 134218240;
    v20 = v15;
    v21 = 1024;
    v22 = v14;
    _os_log_impl(&dword_22AC94000, v12, v13, "Note database %p opened. Connection count is now %d", (uint8_t *)&v19, 0x12u);
  }

  if (*(int *)(*(_QWORD *)(a1 + 32) + 40) >= 2)
  {
    DALoggingwithCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_BYTE *)(v3 + 6);
    if (os_log_type_enabled(v16, v17))
    {
      v18 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v19 = 67109120;
      LODWORD(v20) = v18;
      _os_log_impl(&dword_22AC94000, v16, v17, "_noteConnectionCount is > 1, at %d", (uint8_t *)&v19, 8u);
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

  v20 = *MEMORY[0x24BDAC8D0];
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BE2AD38];
  v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v3, v5))
  {
    noteDB = self->_noteDB;
    noteConnectionCount = self->_noteConnectionCount;
    *(_DWORD *)buf = 134218240;
    v17 = noteDB;
    v18 = 1024;
    LODWORD(v19) = noteConnectionCount;
    _os_log_impl(&dword_22AC94000, v3, v5, "Saving notes database %p. Connection count is %d", buf, 0x12u);
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
      _os_log_impl(&dword_22AC94000, v11, v12, "Saving notes database %p failed with error %@", buf, 0x16u);
    }

  }
  return v9;
}

- (BOOL)noteCloseDBAndSave:(BOOL)a3
{
  BOOL v4;
  NSObject *noteDBQueue;
  _QWORD block[5];

  v4 = !a3 || -[ESLocalDBHelper noteSaveDB](self, "noteSaveDB");
  noteDBQueue = self->_noteDBQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ESLocalDBHelper_noteCloseDBAndSave___block_invoke;
  block[3] = &unk_24F4DE210;
  block[4] = self;
  dispatch_sync(noteDBQueue, block);
  return v4;
}

void __38__ESLocalDBHelper_noteCloseDBAndSave___block_invoke(uint64_t a1)
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

  v19 = *MEMORY[0x24BDAC8D0];
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BE2AD38];
  v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v2, v4))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 96);
    LODWORD(v5) = *(_DWORD *)(v5 + 40);
    v15 = 134218240;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_22AC94000, v2, v4, "Decrementing database %p reference count. _noteConnectionCount is %d", (uint8_t *)&v15, 0x12u);
  }

  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
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
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v15 = 67109120;
    LODWORD(v16) = v10;
    _os_log_impl(&dword_22AC94000, v8, v9, "_noteCloseDB called too many times (connection count %d).  Resetting count to 0", (uint8_t *)&v15, 8u);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
LABEL_9:
    DALoggingwithCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, v4))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      v15 = 134217984;
      v16 = v12;
      _os_log_impl(&dword_22AC94000, v11, v4, "Destroying notes database %p", (uint8_t *)&v15, 0xCu);
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
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_22AC94000, v5, v6, "Setting unit test Address Book Database directory to: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((id)_fakedOutABDBDir != v4)
  {
    objc_storeStrong((id *)&_fakedOutABDBDir, a3);
    if (objc_msgSend(v4, "length"))
    {
      +[ESLocalDBWatcher sharedDBWatcher](ESLocalDBWatcher, "sharedDBWatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "noteABDBDirChanged");

    }
  }

}

+ (id)abTestABDBDir
{
  return (id)_fakedOutABDBDir;
}

+ (void)calSetTestCalDBDir:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_22AC94000, v5, v6, "Setting unit test Calendar Database directory to: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((id)_fakedOutCalDBDir != v4)
  {
    objc_storeStrong((id *)&_fakedOutCalDBDir, a3);
    if (objc_msgSend(v4, "length"))
    {
      +[ESLocalDBWatcher sharedDBWatcher](ESLocalDBWatcher, "sharedDBWatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "noteCalDBDirChanged");

    }
  }

}

+ (id)calTestCalDBDir
{
  return (id)_fakedOutCalDBDir;
}

- (void)calUnitTestsSetCallbackBlockForSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ESLocalDBHelper calUnitTestCallbackBlock](self, "calUnitTestCallbackBlock");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 != v7)
  {
    if (v7)
    {
      v6 = (void *)objc_msgSend(v7, "copy");
      -[ESLocalDBHelper setCalUnitTestCallbackBlock:](self, "setCalUnitTestCallbackBlock:", v6);

    }
    else
    {
      -[ESLocalDBHelper setCalUnitTestCallbackBlock:](self, "setCalUnitTestCallbackBlock:", 0);
    }
    v5 = v7;
  }

}

- (void)setAbDB:(void *)a3
{
  self->_abDB = a3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
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

- (CalDatabase)calDB
{
  return self->_calDB;
}

- (void)setCalDB:(CalDatabase *)a3
{
  self->_calDB = a3;
}

- (int)calConnectionCount
{
  return self->_calConnectionCount;
}

- (void)setCalConnectionCount:(int)a3
{
  self->_calConnectionCount = a3;
}

- (ESCalDBHelper)calDBHelper
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
  objc_storeStrong((id *)&self->_saveRequests, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
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

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC94000, v1, v2, "_abOpenDBWithClientIdentifier is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
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

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC94000, v1, v2, "abOpenDBWithClientIdentifier is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
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

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_22AC94000, v1, v2, "abSaveDB is unsupported under modern Contacts framework :%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

@end
