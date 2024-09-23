@implementation CHSharedAddressBook

+ (id)get
{
  if (get_onceToken != -1)
    dispatch_once(&get_onceToken, &__block_literal_global_11);
  return (id)get_instance;
}

uint64_t __26__CHSharedAddressBook_get__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)get_instance;
  get_instance = v0;

  return objc_msgSend((id)get_instance, "registerForContactsNotifications");
}

- (CHSharedAddressBook)init
{
  CHSharedAddressBook *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *addressBookCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHSharedAddressBook;
  v2 = -[CHSynchronizedLoggable initWithName:](&v6, sel_initWithName_, "SharedAddressBook");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    addressBookCache = v2->_addressBookCache;
    v2->_addressBookCache = v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CHSharedAddressBook;
  -[CHSharedAddressBook dealloc](&v4, sel_dealloc);
}

- (void)registerForContactsNotifications
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__CHSharedAddressBook_registerForContactsNotifications__block_invoke;
  v2[3] = &unk_1E6746460;
  v2[4] = self;
  -[CHSynchronizedLoggable execute:](self, "execute:", v2);
}

void __55__CHSharedAddressBook_registerForContactsNotifications__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_revertAddressBook_, *MEMORY[0x1E0C96870], 0);

}

- (void)sendABChangedNotificationSyncWithUserInfo:(id)a3
{
  notifyClientsOfEvent(CFSTR("kCallHistoryContactStoreChangedInternalNotification"), a3);
}

- (void)cleanUpAddressBookCache_sync
{
  id v2;

  -[CHSharedAddressBook addressBookCache](self, "addressBookCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)revertAddressBook:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CHSharedAddressBook_revertAddressBook___block_invoke;
  v3[3] = &unk_1E6746460;
  v3[4] = self;
  -[CHSynchronizedLoggable execute:](self, "execute:", v3);
}

uint64_t __41__CHSharedAddressBook_revertAddressBook___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B3FA4000, v2, OS_LOG_TYPE_DEFAULT, "Contacts changed, so reverting it and clearing our AB cache", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cleanUpAddressBookCache_sync");
  return objc_msgSend(*(id *)(a1 + 32), "sendABChangedNotificationSyncWithUserInfo:", 0);
}

- (void)insertAddressBookInfoDictionaryIntoCache:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHSharedAddressBook *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke;
  v6[3] = &unk_1E6746520;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

void __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  NSObject *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = (uint64_t *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v2, "addressBookCache");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", *v4);

  }
  else
  {
    objc_msgSend(v2, "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke_cold_1(v4, v5);

  }
}

- (void)insertAddressBookInfoIntoCache:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  CHSharedAddressBook *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke;
  v10[3] = &unk_1E6746880;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[CHSynchronizedLoggable execute:](self, "execute:", v10);

}

void __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  id v4;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "addressBookCache");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke_cold_1(v2, a1, v3);

  }
}

- (id)fetchAddressBookInfoFromCacheForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__CHSharedAddressBook_fetchAddressBookInfoFromCacheForKey___block_invoke;
  v8[3] = &unk_1E6746830;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__CHSharedAddressBook_fetchAddressBookInfoFromCacheForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "addressBookCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)cachedCount
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__CHSharedAddressBook_cachedCount__block_invoke;
  v4[3] = &unk_1E67469C0;
  v4[4] = self;
  v4[5] = &v5;
  -[CHSynchronizedLoggable executeSync:](self, "executeSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHSharedAddressBook_cachedCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "addressBookCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (NSMutableDictionary)addressBookCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAddressBookCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBookCache, 0);
}

void __64__CHSharedAddressBook_insertAddressBookInfoDictionaryIntoCache___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B3FA4000, a2, OS_LOG_TYPE_ERROR, "Cannot insert info %@ into address book cache", (uint8_t *)&v3, 0xCu);
}

void __61__CHSharedAddressBook_insertAddressBookInfoIntoCache_forKey___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "Cannot insert %@ for key %@ into address book cache", (uint8_t *)&v5, 0x16u);
}

@end
