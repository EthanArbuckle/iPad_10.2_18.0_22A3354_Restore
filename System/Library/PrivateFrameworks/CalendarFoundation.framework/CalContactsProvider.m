@implementation CalContactsProvider

+ (id)defaultProvider
{
  if (defaultProvider_onceToken_0 != -1)
    dispatch_once(&defaultProvider_onceToken_0, &__block_literal_global_5_0);
  return (id)defaultProvider__defaultProvider_0;
}

void __38__CalContactsProvider_defaultProvider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultProvider__defaultProvider_0;
  defaultProvider__defaultProvider_0 = v0;

}

- (CalContactsProvider)init
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *contactStoreWorkQueue;
  NSObject *v5;
  uint64_t v6;
  CalContactsProvider *v7;
  NSObject *v8;
  CalContactsProvider *v9;
  CalContactsProvider *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CalContactsProvider *v16;
  _QWORD block[4];
  CalContactsProvider *v18;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("Contact Store Work", 0);
  contactStoreWorkQueue = self->_contactStoreWorkQueue;
  self->_contactStoreWorkQueue = v3;

  v5 = self->_contactStoreWorkQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CalContactsProvider_init__block_invoke;
  block[3] = &unk_1E2A84760;
  v7 = self;
  v18 = v7;
  dispatch_async(v5, block);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = 3221225472;
  v14 = __27__CalContactsProvider_init__block_invoke_11;
  v15 = &unk_1E2A84760;
  v9 = v7;
  v16 = v9;
  dispatch_async(v8, &v12);

  v10 = -[CalContactsProvider initWithStore:](v9, "initWithStore:", 0, v12, v13, v14, v15);
  return v10;
}

void __27__CalContactsProvider_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  NSObject *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v2);
  v4 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__CalContactsProvider_init__block_invoke_2;
  v11[3] = &unk_1E2A84988;
  v5 = v4;
  v12 = v5;
  objc_msgSend(v3, "requestAccessForEntityType:completionHandler:", 0, v11);
  v6 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1)
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __27__CalContactsProvider_init__block_invoke_cold_1();

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v3;
  v10 = v3;

}

void __27__CalContactsProvider_init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __27__CalContactsProvider_init__block_invoke_2_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __27__CalContactsProvider_init__block_invoke_11(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fetchedUnifiedMeContact");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMeContact:", v2);

}

- (CalContactsProvider)initWithStore:(id)a3
{
  id v5;
  CalContactsProvider *v6;
  CalContactsProvider *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *contactStoreWorkQueue;
  uint64_t v10;
  CNReputationStore *reputationStore;
  uint64_t v12;
  NSMutableSet *delegates;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CalContactsProvider;
  v6 = -[CalContactsProvider init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_store, a3);
      v8 = dispatch_queue_create("Contact Store Work", 0);
      contactStoreWorkQueue = v7->_contactStoreWorkQueue;
      v7->_contactStoreWorkQueue = (OS_dispatch_queue *)v8;

    }
    v10 = objc_opt_new();
    reputationStore = v7->_reputationStore;
    v7->_reputationStore = (CNReputationStore *)v10;

    v12 = objc_opt_new();
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableSet *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("CalendarFoundation.contacts", v14);
    -[CalContactsProvider setSyncQueue:](v7, "setSyncQueue:", v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_meCardChanged_, *MEMORY[0x1E0C96878], 0);

  }
  return v7;
}

- (void)registerForContactChangeNotifications:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[NSMutableSet count](self->_delegates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contactsChanged_, *MEMORY[0x1E0C96870], 0);

  }
  -[NSMutableSet addObject:](self->_delegates, "addObject:", v5);

}

- (void)deregisterForContactChangeNotifications:(id)a3
{
  id v4;

  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_delegates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0C96870], 0);

  }
}

- (BOOL)contactAccessResolved
{
  unsigned int (*v2)(const __CFString *);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (unsigned int (*)(const __CFString *))getMGGetBoolAnswerSymbolLoc_ptr;
  v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_1E2A83FD8;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (unsigned int (*)(const __CFString *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    -[CalContactsProvider contactAccessResolved].cold.1();
  return !v2(CFSTR("green-tea")) || objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 0;
}

- (CNContact)meContact
{
  CalContactsProvider *v3;
  CNContact *v4;

  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    v3 = self;
    objc_sync_enter(v3);
    v4 = v3->_meContact;
    objc_sync_exit(v3);

    if (!v4)
    {
      -[CalContactsProvider _fetchedUnifiedMeContact](v3, "_fetchedUnifiedMeContact");
      v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    }
    -[CalContactsProvider setMeContact:](v3, "setMeContact:", v4);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setMeContact:(id)a3
{
  CalContactsProvider *v5;
  CNContact *meContact;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = self;
  objc_sync_enter(v5);
  meContact = v5->_meContact;
  -[CalContactsProvider loadedMyEmailAddresses](v5, "loadedMyEmailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v5->_meContact, a3);
  -[CNContact CalEmailAddresses](v5->_meContact, "CalEmailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToArray:", v7);
  -[CalContactsProvider setLoadedMyEmailAddresses:](v5, "setLoadedMyEmailAddresses:", v8);
  if (meContact)
    v9 = 1;

  objc_sync_exit(v5);
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("CalMeCardChangedNotification"), 0);

  }
}

- (void)setMeCardEmailsForUnitTesting:(id)a3
{
  CalContactsProvider *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[CalContactsProvider setUnitTestEmails:](v4, "setUnitTestEmails:", v5);
  objc_sync_exit(v4);

}

- (id)nullableContactStore
{
  NSObject *contactStoreWorkQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  contactStoreWorkQueue = self->_contactStoreWorkQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CalContactsProvider_nullableContactStore__block_invoke;
  v6[3] = &unk_1E2A849B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(contactStoreWorkQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__CalContactsProvider_nullableContactStore__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)contactsChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[CalContactsProvider syncQueue](self, "syncQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CalContactsProvider_contactsChanged___block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __39__CalContactsProvider_contactsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syncContacts");
}

- (void)meCardChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CalContactsProvider_meCardChanged___block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_async(v4, block);

}

void __37__CalContactsProvider_meCardChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_fetchedUnifiedMeContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMeContact:", v2);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CalMeCardChangedNotification"), 0);

}

- (void)_syncContacts
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "startingToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_18FC12000, a2, OS_LOG_TYPE_DEBUG, "Syncing contacts with starting token [%@]", v4, 0xCu);

  OUTLINED_FUNCTION_12_0();
}

- (id)_lastHistoryToken
{
  void *v2;
  void *v3;

  +[CalDefaults thisProcess](CalDefaults, "thisProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("CalContactsProviderHistoryToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setLastHistoryToken:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CalDefaults thisProcess](CalDefaults, "thisProcess");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("CalContactsProviderHistoryToken"));

}

- (id)_meWithKeys:(id)a3
{
  id v4;
  NSObject *contactStoreWorkQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    v16 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__CalContactsProvider__meWithKeys___block_invoke;
    block[3] = &unk_1E2A843F0;
    block[4] = self;
    v10 = &v11;
    v9 = v4;
    dispatch_sync(contactStoreWorkQueue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __35__CalContactsProvider__meWithKeys___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "testMeContactIdentifer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "testMeContactIdentifer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v5, v6, &v16);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v16;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    v15 = 0;
    objc_msgSend(v3, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v11, &v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v8 = v15;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

  if (v8)
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __35__CalContactsProvider__meWithKeys___block_invoke_cold_1();

  }
}

- (id)_fetchedUnifiedMeContact
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C967F0];
  v8[0] = *MEMORY[0x1E0C966A8];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalContactsProvider _meWithKeys:](self, "_meWithKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTestMeContactIdentifier:(id)a3
{
  id v4;

  -[CalContactsProvider setTestMeContactIdentifer:](self, "setTestMeContactIdentifer:", a3);
  -[CalContactsProvider _fetchedUnifiedMeContact](self, "_fetchedUnifiedMeContact");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalContactsProvider setMeContact:](self, "setMeContact:", v4);

}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  NSObject *contactStoreWorkQueue;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
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
  if (!v6)
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CalContactsProvider unifiedContactsMatchingPredicate:keysToFetch:].cold.1();

    goto LABEL_7;
  }
  if (!-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  contactStoreWorkQueue = self->_contactStoreWorkQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke;
  v12[3] = &unk_1E2A849D8;
  v15 = &v16;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_sync(contactStoreWorkQueue, v12);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
LABEL_8:

  return v9;
}

void __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  v1 = (_QWORD *)a1;
  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1[5];
  v4 = v1[6];
  v1 += 5;
  v10 = 0;
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(v1[2] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(v1[2] + 8) + 40))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();

  }
}

- (id)unifiedContactsForHandleStrings:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  NSObject *contactStoreWorkQueue;
  id v9;
  _QWORD v11[4];
  id v12;
  CalContactsProvider *v13;
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
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__4;
    v20 = __Block_byref_object_dispose__4;
    v21 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke;
    v11[3] = &unk_1E2A84A00;
    v15 = &v16;
    v12 = v6;
    v13 = self;
    v14 = v7;
    dispatch_sync(contactStoreWorkQueue, v11);
    v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingHandleStrings:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v10 = 0;
  objc_msgSend(v3, "unifiedContactsMatchingPredicate:keysToFetch:error:", v2, v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke_cold_1();

  }
}

- (id)unifiedContactsDictionaryForHandleStrings:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  NSObject *contactStoreWorkQueue;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  CalContactsProvider *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__4;
    v20 = __Block_byref_object_dispose__4;
    v21 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke;
    v11[3] = &unk_1E2A84A28;
    v12 = v7;
    v13 = v6;
    v14 = self;
    v15 = &v16;
    dispatch_sync(contactStoreWorkQueue, v11);
    v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingHandleStrings:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(*(id *)(a1 + 48), "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    objc_msgSend(v5, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke_cold_1();
  }

}

- (id)unifiedContactWithEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *contactStoreWorkQueue;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CalContactsProvider *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    v25 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __54__CalContactsProvider_unifiedContactWithEmailAddress___block_invoke;
    v15 = &unk_1E2A849D8;
    v19 = &v20;
    v16 = self;
    v8 = v5;
    v17 = v8;
    v9 = v6;
    v18 = v9;
    dispatch_sync(contactStoreWorkQueue, &v12);
    objc_msgSend((id)v21[5], "firstObject", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __54__CalContactsProvider_unifiedContactWithEmailAddress___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  v1 = (_QWORD *)a1;
  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1[5];
  v4 = v1[6];
  v1 += 5;
  v10 = 0;
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(v1[2] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(v1[2] + 8) + 40))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();

  }
}

- (id)unifiedContactWithPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *contactStoreWorkQueue;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CalContactsProvider *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4;
    v25 = __Block_byref_object_dispose__4;
    v26 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __53__CalContactsProvider_unifiedContactWithPhoneNumber___block_invoke;
    v16 = &unk_1E2A849D8;
    v20 = &v21;
    v17 = self;
    v9 = v6;
    v18 = v9;
    v10 = v7;
    v19 = v10;
    dispatch_sync(contactStoreWorkQueue, &v13);
    objc_msgSend((id)v22[5], "firstObject", v13, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __53__CalContactsProvider_unifiedContactWithPhoneNumber___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  v1 = (_QWORD *)a1;
  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1[5];
  v4 = v1[6];
  v1 += 5;
  v10 = 0;
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(v1[2] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(v1[2] + 8) + 40))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();

  }
}

- (id)unifiedContactWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *contactStoreWorkQueue;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CalContactsProvider *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    v25 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __46__CalContactsProvider_unifiedContactWithName___block_invoke;
    v15 = &unk_1E2A849D8;
    v19 = &v20;
    v16 = self;
    v8 = v5;
    v17 = v8;
    v9 = v6;
    v18 = v9;
    dispatch_sync(contactStoreWorkQueue, &v12);
    objc_msgSend((id)v21[5], "firstObject", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __46__CalContactsProvider_unifiedContactWithName___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  v1 = (_QWORD *)a1;
  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1[5];
  v4 = v1[6];
  v1 += 5;
  v10 = 0;
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(v1[2] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(v1[2] + 8) + 40))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1();

  }
}

- (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  NSObject *contactStoreWorkQueue;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
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
  if (!v6)
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CalContactsProvider unifiedContactWithIdentifier:keysToFetch:].cold.1();

    goto LABEL_7;
  }
  if (!-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  contactStoreWorkQueue = self->_contactStoreWorkQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke;
  v12[3] = &unk_1E2A849D8;
  v15 = &v16;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  dispatch_sync(contactStoreWorkQueue, v12);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
LABEL_8:

  return v9;
}

void __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;

  v1 = (_QWORD *)a1;
  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1[5];
  v4 = v1[6];
  v1 += 5;
  v10 = 0;
  objc_msgSend(v2, "unifiedContactWithIdentifier:keysToFetch:error:", v3, v4, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = *(_QWORD *)(v1[2] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(v1[2] + 8) + 40))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke_cold_1();

  }
}

- (id)unifiedContactWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C97200];
  v5 = a3;
  objc_msgSend(v4, "CalKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalContactsProvider unifiedContactWithIdentifier:keysToFetch:](self, "unifiedContactWithIdentifier:keysToFetch:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)unifiedContactMatchingString:(id)a3 keysToFetch:(id)a4 matchType:(int64_t *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;

  v7 = a3;
  -[CalContactsProvider unifiedContactWithEmailAddress:](self, "unifiedContactWithEmailAddress:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    if (a5)
    {
      v10 = 2;
LABEL_8:
      *a5 = v10;
    }
  }
  else
  {
    -[CalContactsProvider unifiedContactWithPhoneNumber:](self, "unifiedContactWithPhoneNumber:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v9 = (void *)v11;
      if (a5)
      {
        v10 = 3;
        goto LABEL_8;
      }
    }
    else
    {
      -[CalContactsProvider unifiedContactWithName:](self, "unifiedContactWithName:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;
      if (a5)
        goto LABEL_8;
    }
  }

  return v9;
}

- (id)unifiedContactMatchingName:(id)a3 email:(id)a4 url:(id)a5 keysToFetch:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *contactStoreWorkQueue;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD block[5];
  id v41;
  id v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[5];
  id v52;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[CalContactsProvider contactAccessResolved](self, "contactAccessResolved"))
  {
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__4;
    v51[4] = __Block_byref_object_dispose__4;
    v52 = 0;
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__4;
    v49 = __Block_byref_object_dispose__4;
    v50 = 0;
    contactStoreWorkQueue = self->_contactStoreWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke;
    block[3] = &unk_1E2A84A50;
    v43 = &v45;
    block[4] = self;
    v16 = v14;
    v41 = v16;
    v17 = v13;
    v42 = v17;
    v44 = v51;
    dispatch_sync(contactStoreWorkQueue, block);
    v18 = objc_msgSend((id)v46[5], "count");
    v19 = (void *)v46[5];
    if (v18)
    {
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v19)
      {
        +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[CalContactsProvider unifiedContactMatchingName:email:url:keysToFetch:].cold.1();

      }
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactMatchingURLString:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = self->_contactStoreWorkQueue;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_30;
      v35[3] = &unk_1E2A84A50;
      v38 = &v45;
      v35[4] = self;
      v16 = v22;
      v36 = v16;
      v24 = v17;
      v37 = v24;
      v39 = v51;
      dispatch_sync(v23, v35);
      if (objc_msgSend((id)v46[5], "count"))
      {
        objc_msgSend((id)v46[5], "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v46[5])
        {
          +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[CalContactsProvider unifiedContactMatchingName:email:url:keysToFetch:].cold.1();

        }
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = self->_contactStoreWorkQueue;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_31;
        v30[3] = &unk_1E2A84A50;
        v33 = &v45;
        v30[4] = self;
        v16 = v26;
        v31 = v16;
        v32 = v24;
        v34 = v51;
        dispatch_sync(v27, v30);
        if (objc_msgSend((id)v46[5], "count"))
        {
          objc_msgSend((id)v46[5], "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v46[5])
          {
            +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CalContactsProvider unifiedContactMatchingName:email:url:keysToFetch:].cold.1();

          }
          v20 = 0;
        }

      }
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(v51, 8);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_30(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __72__CalContactsProvider_unifiedContactMatchingName_email_url_keysToFetch___block_invoke_31(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)contactsFromContactIdentifiers:(id)a3 withKeys:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  +[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v24 = (void *)v7;
  if (v6)
  {
    objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97200], "CalKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:", v7, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v19, v20);

        objc_msgSend(v19, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
  {
    +[CalFoundationLogSubsystem contacts](CalFoundationLogSubsystem, "contacts");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CalContactsProvider contactsFromContactIdentifiers:withKeys:].cold.1();

  }
  return v12;
}

- (id)fullNameForFirstContactMatchingEmailAddress:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalContactsProvider _fullNameForFirstContactMatchingPredicate:](self, "_fullNameForFirstContactMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fullNameForFirstContactMatchingPhoneNumber:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C97398];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStringValue:", v5);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalContactsProvider _fullNameForFirstContactMatchingPredicate:](self, "_fullNameForFirstContactMatchingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_fullNameForFirstContactMatchingPredicate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97218];
  v5 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalContactsProvider unifiedContactsMatchingPredicate:keysToFetch:](self, "unifiedContactsMatchingPredicate:keysToFetch:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)contactIdentifierIsMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CalContactsProvider meContact](self, "meContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  return v7;
}

- (id)myShortDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[CalContactsProvider meContact](self, "meContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[CalContactsProvider meContact](self, "meContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nickname");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (id)myNameWithStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CalContactsProvider meContact](self, "meContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C97218];
    -[CalContactsProvider meContact](self, "meContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromContact:style:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)myFullName
{
  return -[CalContactsProvider myNameWithStyle:](self, "myNameWithStyle:", 0);
}

- (id)myHomeAddress
{
  return -[CalContactsProvider myAddressForLabel:](self, "myAddressForLabel:", *MEMORY[0x1E0C96FF8]);
}

- (id)myWorkAddress
{
  return -[CalContactsProvider myAddressForLabel:](self, "myAddressForLabel:", *MEMORY[0x1E0C97070]);
}

- (id)myAddressForLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CalContactsProvider meContact](self, "meContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postalAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "label", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)myEmailAddress
{
  CalContactsProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[CalContactsProvider unitTestEmails](v2, "unitTestEmails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CalContactsProvider unitTestEmails](v2, "unitTestEmails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    -[CalContactsProvider meContact](v2, "meContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v2 = (CalContactsProvider *)objc_claimAutoreleasedReturnValue();

    -[CalContactsProvider value](v2, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)cachedEmailAddressArray
{
  CalContactsProvider *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v2 = self;
  objc_sync_enter(v2);
  -[CalContactsProvider unitTestEmails](v2, "unitTestEmails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CalContactsProvider unitTestEmails](v2, "unitTestEmails");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    goto LABEL_6;
  }
  -[CalContactsProvider loadedMyEmailAddresses](v2, "loadedMyEmailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CalContactsProvider loadedMyEmailAddresses](v2, "loadedMyEmailAddresses");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CalContactsProvider meContact](v2, "meContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CalEmailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = (void *)objc_opt_new();
  -[CalContactsProvider setLoadedMyEmailAddresses:](v2, "setLoadedMyEmailAddresses:", v9);
  -[CalContactsProvider loadedMyEmailAddresses](v2, "loadedMyEmailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_sync_exit(v2);

  return v6;
}

- (id)cachedEmailAddress
{
  void *v2;
  void *v3;

  -[CalContactsProvider cachedEmailAddressArray](self, "cachedEmailAddressArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)myEmailAddresses
{
  CalContactsProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = self;
  objc_sync_enter(v2);
  -[CalContactsProvider unitTestEmails](v2, "unitTestEmails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[CalContactsProvider unitTestEmails](v2, "unitTestEmails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    -[CalContactsProvider meContact](v2, "meContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CalEmailAddresses");
    v2 = (CalContactsProvider *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_opt_new();
    }
    v6 = (void *)v8;
  }

  return v6;
}

- (id)cachedEmailAddresses
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CalContactsProvider cachedEmailAddressArray](self, "cachedEmailAddressArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)matchesOneOfMyEmails:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (v4)
  {
    -[CalContactsProvider cachedEmailAddresses](self, "cachedEmailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__CalContactsProvider_matchesOneOfMyEmails___block_invoke;
    v8[3] = &unk_1E2A84A78;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __44__CalContactsProvider_matchesOneOfMyEmails___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)urlMatchesOneOfMyEmails:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringRemovingMailto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[CalContactsProvider matchesOneOfMyEmails:](self, "matchesOneOfMyEmails:", v5);
  return (char)self;
}

- (id)myPhoneNumbers
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[CalContactsProvider meContact](self, "meContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CalPhoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)matchesOneOfMyPhoneNumbers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  -[CalContactsProvider myPhoneNumbers](self, "myPhoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__CalContactsProvider_matchesOneOfMyPhoneNumbers___block_invoke;
  v9[3] = &unk_1E2A84A78;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __50__CalContactsProvider_matchesOneOfMyPhoneNumbers___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2);
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)reputationForHandle:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    +[CalFoundationLogSubsystem junk](CalFoundationLogSubsystem, "junk");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CalContactsProvider reputationForHandle:inStore:].cold.1();
    v8 = 0;
    v9 = 0;
    goto LABEL_10;
  }
  v13 = 0;
  objc_msgSend(v6, "reputationForHandle:timeout:error:", v5, &v13, 0.2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  +[CalFoundationLogSubsystem junk](CalFoundationLogSubsystem, "junk");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[CalContactsProvider reputationForHandle:inStore:].cold.3((uint64_t)v5, v8, v10);

  if (v9)
  {
    +[CalFoundationLogSubsystem junk](CalFoundationLogSubsystem, "junk");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CalContactsProvider reputationForHandle:inStore:].cold.2();
LABEL_10:

  }
  return v8;
}

+ (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3 inReputationStore:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = (void *)MEMORY[0x1E0C973C0];
  v7 = a4;
  objc_msgSend(v6, "handleWithEmailAddress:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reputationForHandle:inStore:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9 && objc_msgSend(v9, "score") == 1;
  return v10;
}

+ (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3 inReputationStore:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = (void *)MEMORY[0x1E0C973C0];
  v7 = a4;
  objc_msgSend(v6, "handleWithPhoneNumber:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reputationForHandle:inStore:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9 && objc_msgSend(v9, "score") == 1;
  return v10;
}

- (BOOL)shouldPermitOrganizerEmailFromJunkChecks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CalContactsProvider reputationStore](self, "reputationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "shouldPermitOrganizerEmailFromJunkChecks:inReputationStore:", v4, v5);

  return (char)self;
}

- (BOOL)shouldPermitOrganizerPhoneNumberFromJunkChecks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CalContactsProvider reputationStore](self, "reputationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "shouldPermitOrganizerPhoneNumberFromJunkChecks:inReputationStore:", v4, v5);

  return (char)self;
}

+ (BOOL)birthdayIsYearless:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "CalYearlessDateThreshold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "CalIsBeforeDate:", v5);

  return v6;
}

+ (BOOL)isCalendarIslamic:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996E8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996F0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996F8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C99700]);
  }

  return v4;
}

+ (id)birthdayStringForContactName:(id)a3 eventDate:(id)a4 birthDate:(id)a5 lunarCalendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  _BOOL4 v30;
  void *v32;
  void *v33;
  _BOOL4 v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "CalYearlessDateThreshold");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "isBeforeDate:", v14);

      if ((v15 & 1) == 0)
      {
        if (v12)
          v16 = v12;
        else
          v16 = (id)*MEMORY[0x1E0C996C8];
        objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateByAddingDays:inCalendar:", 7, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "components:fromDate:toDate:options:", 4, v11, v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "year");

        if (v20 > 0)
        {
          v37 = v18;
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("1: ordinal | 0: cardinal"), CFSTR("1"), 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "isEqualToString:", CFSTR("1")))
            v21 = 6;
          else
            v21 = 1;
          v22 = (void *)MEMORY[0x1E0CB37F0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringFromNumber:numberStyle:", v23, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C996A0]))
          {
            v25 = (void *)MEMORY[0x1E0CB3940];
            v26 = CFSTR("birthday_chinese_count");
          }
          else
          {
            if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C996D0]))
            {
              v34 = +[CalContactsProvider isCalendarIslamic:](CalContactsProvider, "isCalendarIslamic:", v12);
              v36 = (void *)MEMORY[0x1E0CB3940];
              v33 = v37;
              if (v34)
                v35 = CFSTR("birthday_islamic_count");
              else
                v35 = CFSTR("birthday_count");
              objc_msgSend(v13, "localizedStringForKey:value:table:", v35, &stru_1E2A86598, 0);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "localizedStringWithFormat:", v32, v20, v9, v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_32;
            }
            v25 = (void *)MEMORY[0x1E0CB3940];
            v26 = CFSTR("birthday_hebrew_count");
          }
          objc_msgSend(v13, "localizedStringForKey:value:table:", v26, &stru_1E2A86598, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringWithFormat:", v32, v20, v9, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v37;
LABEL_32:

LABEL_23:
          goto LABEL_24;
        }

      }
    }
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C996A0]))
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = CFSTR("%@’s Chinese Birthday");
    }
    else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C996D0]))
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      v29 = CFSTR("%@’s Hebrew Birthday");
    }
    else
    {
      v30 = +[CalContactsProvider isCalendarIslamic:](CalContactsProvider, "isCalendarIslamic:", v12);
      v28 = (void *)MEMORY[0x1E0CB3940];
      if (v30)
        v29 = CFSTR("%@’s Islamic Birthday");
      else
        v29 = CFSTR("%@’s Birthday");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v29, &stru_1E2A86598, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v17, v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v27 = 0;
LABEL_24:

  return v27;
}

- (CNContactStore)store
{
  return (CNContactStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CNReputationStore)reputationStore
{
  return (CNReputationStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReputationStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)syncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSyncQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)contactStoreWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactStoreWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)testMeContactIdentifer
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTestMeContactIdentifer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)delegates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDelegates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)unitTestEmails
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUnitTestEmails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)loadedMyEmailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLoadedMyEmailAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedMyEmailAddresses, 0);
  objc_storeStrong((id *)&self->_unitTestEmails, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_testMeContactIdentifer, 0);
  objc_storeStrong((id *)&self->_contactStoreWorkQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_reputationStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

void __27__CalContactsProvider_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, v0, v1, "Timed out requesting access to contacts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __27__CalContactsProvider_init__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "Failed to access contacts with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)contactAccessResolved
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_MGGetBoolAnswer(CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CalContactsProvider.m"), 39, CFSTR("%s"), dlerror());

  __break(1u);
}

void __35__CalContactsProvider__meWithKeys___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "Failed to fetch me contact with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)unifiedContactsMatchingPredicate:keysToFetch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, v0, v1, "Attempted to fetch nil predicate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__CalContactsProvider_unifiedContactsMatchingPredicate_keysToFetch___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Error while fetching contact for predicate %@ [%@]");
  OUTLINED_FUNCTION_4();
}

void __67__CalContactsProvider_unifiedContactsForHandleStrings_keysToFetch___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Error while fetching contact for predicate %@ [%@]");
  OUTLINED_FUNCTION_4();
}

void __77__CalContactsProvider_unifiedContactsDictionaryForHandleStrings_keysToFetch___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Error while fetching contact for fetchRequest %@ [%@]");
  OUTLINED_FUNCTION_4();
}

- (void)unifiedContactWithIdentifier:keysToFetch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, v0, v1, "Attempted to fetch nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__CalContactsProvider_unifiedContactWithIdentifier_keysToFetch___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Error while fetching contact for identifier %@ [%@]");
  OUTLINED_FUNCTION_4();
}

- (void)unifiedContactMatchingName:email:url:keysToFetch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6(&dword_18FC12000, v0, v1, "Error while fetching contact for predicate %@ [%@]");
  OUTLINED_FUNCTION_4();
}

- (void)contactsFromContactIdentifiers:withKeys:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "Contact Identifiers where no contact was found %@ ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)reputationForHandle:inStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, v0, v1, "Reputation handle was nil in the should white list organizer junk checks.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)reputationForHandle:inStore:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "There was an error trying to get the reputation handle [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)reputationForHandle:(NSObject *)a3 inStore:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "score");
  _os_log_debug_impl(&dword_18FC12000, a3, OS_LOG_TYPE_DEBUG, "The reputation result returned for [%@] had the score [%ld] (0==neutral, 1==good, 2==bad)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_12_0();
}

@end
