@implementation EDSenderPersistence

+ (id)addJoinsForSenderBucketToSelectStatement:(id)a3 withSourceAddressColumn:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("sender_addresses"), a4, CFSTR("address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("senders"), CFSTR("sender"), *MEMORY[0x1E0D1EE00]);
  v8 = (void *)MEMORY[0x1E0D1EFF0];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("senders"), CFSTR("bucket"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ifNull:second:", v9, &unk_1E94E4A78);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addResult:alias:", v10, CFSTR("bucket"));

  return CFSTR("bucket");
}

+ (NSString)sendersTableName
{
  return (NSString *)CFSTR("senders");
}

+ (NSString)senderAddressesTableName
{
  return (NSString *)CFSTR("sender_addresses");
}

+ (NSString)sendersBucketColumnName
{
  return (NSString *)CFSTR("bucket");
}

+ (NSString)senderAddressesSenderColumnName
{
  return (NSString *)CFSTR("sender");
}

+ (NSString)senderAddressesAddressColumnName
{
  return (NSString *)CFSTR("address");
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  EDPersistenceAssociationPlaceholder *v10;
  void *v11;
  void *v12;
  EDPersistenceAssociationPlaceholder *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sendersTableSchema");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "senderAddressesTableSchema");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "columnForName:", CFSTR("sender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAsForeignKeyForTable:onDelete:onUpdate:", v7, 2, 0);

  v10 = [EDPersistenceAssociationPlaceholder alloc];
  objc_msgSend(v8, "columnForName:", CFSTR("address"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence addressesTableName](EDMessagePersistence, "addressesTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EDPersistenceAssociationPlaceholder initWithColumn:tableName:](v10, "initWithColumn:tableName:", v11, v12);

  *a3 = (id)MEMORY[0x1E0C9AA60];
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (EFSQLTableSchema)sendersTableSchema
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
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EFC8], "textColumnWithName:collation:nullable:", CFSTR("contact_identifier"), 1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("bucket"), 0, &unk_1E94E4A78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:defaultValue:", CFSTR("user_initiated"), 0, MEMORY[0x1E0C9AAB0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("category"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F050]), "initWithName:rowIDType:columns:", CFSTR("senders"), 2, v7);
  v15 = CFSTR("contact_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUniquenessConstraintForColumns:conflictResolution:", v9, 1);

  v14 = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndexForColumns:", v10);

  v13 = CFSTR("bucket");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndexForColumns:", v11);

  return (EFSQLTableSchema *)v8;
}

+ (EFSQLTableSchema)senderAddressesTableSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D1F050]);
  objc_msgSend(MEMORY[0x1E0D1EFC8], "integerColumnWithName:nullable:", CFSTR("sender"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithName:rowIDType:rowIDAlias:columns:", CFSTR("sender_addresses"), 1, CFSTR("address"), v4);

  v8 = CFSTR("sender");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addIndexForColumns:", v6);

  return (EFSQLTableSchema *)v5;
}

- (EDSenderPersistence)initWithDatabase:(id)a3 blockedSenderManager:(id)a4 hookRegistry:(id)a5 contactStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDSenderPersistence *v15;
  EDSenderPersistence *v16;
  uint64_t v17;
  EFLazyCache *emailAddressToBucketCache;
  EFLazyCache *v19;
  EFLazyCache *databaseIDToEmailAddressCache;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *processingQueue;
  _EDSentToFilter *v26;
  _EDSentToFilter *sentToAddressesFilter;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *sentToAddressesQueue;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)EDSenderPersistence;
  v15 = -[EDSenderPersistence init](&v33, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeStrong((id *)&v16->_blockedSenderManager, a4);
    objc_storeStrong((id *)&v16->_hookRegistry, a5);
    objc_storeStrong((id *)&v16->_contactStore, a6);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 1000);
    emailAddressToBucketCache = v16->_emailAddressToBucketCache;
    v16->_emailAddressToBucketCache = (EFLazyCache *)v17;

    v19 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E0D1EED8]);
    databaseIDToEmailAddressCache = v16->_databaseIDToEmailAddressCache;
    v16->_databaseIDToEmailAddressCache = v19;

    -[EDPersistenceDatabase protectedDatabasePersistence](v16->_database, "protectedDatabasePersistence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerMergeHandler:forTable:", v16, CFSTR("sender_addresses"));

    v16->_contactStoreLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UTILITY, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.email.EDSenderPersistence", v23);
    processingQueue = v16->_processingQueue;
    v16->_processingQueue = (OS_dispatch_queue *)v24;

    v26 = objc_alloc_init(_EDSentToFilter);
    sentToAddressesFilter = v16->_sentToAddressesFilter;
    v16->_sentToAddressesFilter = v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.email.EDSenderPersistence.sentToAddressesQueue", v29);
    sentToAddressesQueue = v16->_sentToAddressesQueue;
    v16->_sentToAddressesQueue = (OS_dispatch_queue *)v30;

    -[EDSenderPersistence _loadSentToFilterFromDisk](v16, "_loadSentToFilterFromDisk");
    EFRegisterContentProtectionObserver();
    objc_msgSend(v13, "registerMessageChangeHookResponder:", v16);
  }

  return v16;
}

+ (NSString)sendersCategoryColumnName
{
  return (NSString *)CFSTR("category");
}

- (CNContactStore)contactStore
{
  os_unfair_lock_s *p_contactStoreLock;
  CNContactStore *contactStore;
  CNContactStore *v5;
  CNContactStore *v6;
  CNContactStore *v7;

  p_contactStoreLock = &self->_contactStoreLock;
  os_unfair_lock_lock(&self->_contactStoreLock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v5 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  v7 = contactStore;
  os_unfair_lock_unlock(p_contactStoreLock);
  return v7;
}

- (void)scheduleRecurringActivity
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__blockedSendersDidChange_, *MEMORY[0x1E0D1DBB0], 0);

  -[EDSenderPersistence blockedSenderManager](self, "blockedSenderManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockedSenderEmailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSenderPersistence _reloadBlockedSendersWithAddresses:](self, "_reloadBlockedSendersWithAddresses:", v3);

}

- (void)test_tearDown
{
  void *v4;
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSenderPersistence.m"), 245, CFSTR("%s can only be called from unit tests"), "-[EDSenderPersistence test_tearDown]");

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  dispatch_barrier_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_71);
}

- (id)relevantSendersForSearch
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t v17[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  EDSenderLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_INFO, "Gathering relevant senders for search", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__31;
  v15 = __Block_byref_object_dispose__31;
  v16 = (id)0xAAAAAAAAAAAAAAAALL;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDSenderPersistence database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence relevantSendersForSearch]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__EDSenderPersistence_relevantSendersForSearch__block_invoke;
  v10[3] = &unk_1E949BF68;
  v10[4] = buf;
  objc_msgSend(v4, "__performReadWithCaller:usingBlock:", v5, v10);

  EDSenderLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(*((id *)v12 + 5), "count");
    *(_DWORD *)v17 = 134217984;
    v18 = v7;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "Found %lu relevant senders for search", v17, 0xCu);
  }

  v8 = *((id *)v12 + 5);
  _Block_object_dispose(buf, 8);

  return v8;
}

uint64_t __47__EDSenderPersistence_relevantSendersForSearch__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
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
  uint64_t v26;
  id v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v34 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -1209600.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  v6 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTable:", v7);

  v9 = (void *)MEMORY[0x1E0D1EF88];
  v10 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesDisplayDateColumnName](EDMessagePersistence, "messagesDisplayDateColumnName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "column:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "max:", v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addResultColumn:fromTable:", CFSTR("address"), CFSTR("addresses"));
  objc_msgSend(v8, "addResult:alias:", v35, CFSTR("maxDate"));
  v13 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v8, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("recipients"), *MEMORY[0x1E0D1EE00], CFSTR("message"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("addresses"), CFSTR("address"), v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("sender_addresses"), v13, CFSTR("address"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v32, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("senders"), CFSTR("sender"), v13);
  v15 = (void *)MEMORY[0x1E0D1EF90];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("senders"), CFSTR("bucket"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "equalTo:", &unk_1E94E4A90);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v17;
  v18 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesDisplayDateColumnName](EDMessagePersistence, "messagesDisplayDateColumnName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "table:column:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "greaterThanEqualTo:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combined:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v25);

  objc_msgSend(v8, "groupByColumn:fromTable:", CFSTR("address"), CFSTR("addresses"));
  objc_msgSend(v8, "orderBy:ascending:", v35, 0);
  objc_msgSend(v8, "setLimit:", 500);
  v36 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_60;
  v37[3] = &unk_1E949B090;
  v37[4] = *(_QWORD *)(a1 + 32);
  v26 = objc_msgSend(v34, "executeSelectStatement:withBlock:error:", v8, v37, &v36);
  v27 = v36;
  if (v27)
  {
    EDSenderLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v27, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_cold_1();
    }

  }
  return v26;
}

void __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_60(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_invalidateCachesForAddresses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[EDSenderPersistence emailAddressToBucketCache](self, "emailAddressToBucketCache", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "emailAddressValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[EDSenderPersistence databaseIDToEmailAddressCache](self, "databaseIDToEmailAddressCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (void)_invalidateCaches
{
  id v3;
  id v4;

  -[EDSenderPersistence emailAddressToBucketCache](self, "emailAddressToBucketCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[EDSenderPersistence databaseIDToEmailAddressCache](self, "databaseIDToEmailAddressCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (BOOL)bucketForSenderAddress:(id)a3 bucket:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  EDSenderPersistence *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[EDSenderPersistence emailAddressToBucketCache](self, "emailAddressToBucketCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __53__EDSenderPersistence_bucketForSenderAddress_bucket___block_invoke;
    v17 = &unk_1E949FA30;
    v18 = self;
    v9 = v6;
    v19 = v9;
    objc_msgSend(v8, "objectForKey:generator:", v7, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    EDSenderLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_INFO, "EmailAddress:%@ bucket is %@", buf, 0x16u);
    }

    v12 = v10 != 0;
    if (a4 && v10)
      *a4 = objc_msgSend(v10, "integerValue", v14, v15, v16, v17, v18);

  }
  else
  {
    if (a4)
      *a4 = 0;
    v12 = 1;
  }

  return v12;
}

uint64_t __53__EDSenderPersistence_bucketForSenderAddress_bucket___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bucketForSenderAddress:", *(_QWORD *)(a1 + 40));
}

- (id)_bucketForSenderAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__31;
  v18 = __Block_byref_object_dispose__31;
  v19 = 0;
  -[EDSenderPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence _bucketForSenderAddress:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__EDSenderPersistence__bucketForSenderAddress___block_invoke;
  v10[3] = &unk_1E94A1130;
  v7 = v4;
  v11 = v7;
  v12 = v20;
  v13 = &v14;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  return v8;
}

BOOL __47__EDSenderPersistence__bucketForSenderAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    v4 = +[EDMessagePersistence databaseIDForEmailAddress:connection:](EDMessagePersistence, "databaseIDForEmailAddress:connection:", *(_QWORD *)(a1 + 32), v3);
    v5 = *MEMORY[0x1E0D1DC08];
    if (v4 == *MEMORY[0x1E0D1DC08])
    {
      objc_msgSend(*(id *)(a1 + 32), "emailAddressValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "simpleAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "stringValue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v30[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:connection:](EDMessagePersistence, "allDatabaseIDsForSimpleAddresses:connection:", v8, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      if (v10)
        v4 = objc_msgSend(v10, "longLongValue");

    }
    if (v4 == v5)
    {
      v11 = 0;
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("bucket"), CFSTR("senders"));
      v14 = (id)objc_msgSend(v13, "join:sourceColumn:targetColumn:", CFSTR("sender_addresses"), *MEMORY[0x1E0D1EE00], CFSTR("sender"));
      objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("sender_addresses"), CFSTR("address"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "equalTo:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWhere:", v17);

      v24 = 0;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__EDSenderPersistence__bucketForSenderAddress___block_invoke_2;
      v25[3] = &unk_1E949B090;
      v25[4] = *(_QWORD *)(a1 + 48);
      LOBYTE(v15) = objc_msgSend(v3, "executeSelectStatement:withBlock:error:", v13, v25, &v24);
      v11 = v24;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v15;

    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (!*(_QWORD *)(v18 + 40))
      {
        *(_QWORD *)(v18 + 40) = &unk_1E94E4A78;

      }
    }
    EDSenderLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_INFO, "DB result for senders.bucket for EmailAddress:%@ is %@.", buf, 0x16u);
    }

    v12 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

void __47__EDSenderPersistence__bucketForSenderAddress___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bucket"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)bucketsForSenderAddresses:(id)a3 buckets:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v16;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v16;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v19 = 0;
        if (!-[EDSenderPersistence bucketForSenderAddress:bucket:](self, "bucketForSenderAddress:bucket:", v9, &v19))
        {
          if (a4)
            *a4 = 0;

          v14 = 0;
          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v13);

          v11 = (void *)v12;
        }
        objc_msgSend(v11, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (a4)
    *a4 = objc_retainAutorelease(v5);
  v14 = 1;
LABEL_17:

  return v14;
}

- (void)moveSender:(id)a3 toCategory:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  EDSenderPersistence *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceWillChangeSenders:", v8);

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  -[EDSenderPersistence database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence moveSender:toCategory:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__EDSenderPersistence_moveSender_toCategory___block_invoke;
  v15[3] = &unk_1E949C190;
  v18 = &v20;
  v11 = v6;
  v16 = v11;
  v17 = self;
  v19 = a4;
  objc_msgSend(v9, "__performWriteWithCaller:usingBlock:", v10, v15);

  objc_msgSend(v11, "addresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSenderPersistence _invalidateCachesForAddresses:](self, "_invalidateCachesForAddresses:", v12);

  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceDidChangeSenders:generation:", v14, v21[3]);

  _Block_object_dispose(&v20, 8);
}

uint64_t __45__EDSenderPersistence_moveSender_toCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "transactionGeneration");
  v4 = objc_msgSend(*(id *)(a1 + 32), "databaseID");
  if (v4 == *MEMORY[0x1E0D1DC08])
    v5 = objc_msgSend(*(id *)(a1 + 40), "_addNewSender:toCategoryType:connection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v3);
  else
    v5 = objc_msgSend(*(id *)(a1 + 40), "_moveSenderWithDatabaseID:toCategoryType:connection:", objc_msgSend(*(id *)(a1 + 32), "databaseID"), *(_QWORD *)(a1 + 56), v3);
  v6 = v5;

  return v6;
}

- (void)moveSendersWithEmailAddresses:(id)a3 toCategoryType:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;

  v9[4] = a4;
  v10 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke;
  v9[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  objc_msgSend(a3, "ef_compactMap:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSenderPersistence _moveSendersWithSimpleEmailAddresses:toCategoryType:sync:userInitiated:transactionGeneration:](self, "_moveSendersWithSimpleEmailAddresses:toCategoryType:sync:userInitiated:transactionGeneration:", v6, a4, 1, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSenderPersistence _invalidateCaches](self, "_invalidateCaches");
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistenceDidChangeSenders:generation:", v7, v10);

}

id __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "emailAddressValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simpleAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    EDSenderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke_cold_1(v7, a1, (uint64_t)v9, v6);
    }

  }
  return v5;
}

- (void)moveSenderWithEmailAddresses:(id)a3 toBucket:(int64_t)a4
{
  -[EDSenderPersistence _moveSenderWithEmailAddresses:toBucket:sync:userInitiated:](self, "_moveSenderWithEmailAddresses:toBucket:sync:userInitiated:", a3, a4, 1, 1);
}

- (void)_moveSenderWithEmailAddresses:(id)a3 toBucket:(int64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];

  v6 = a6;
  v7 = a5;
  v15[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[EDSenderPersistence _simpleAddressesForAddresses:](self, "_simpleAddressesForAddresses:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  -[EDSenderPersistence _moveSenderWithSimpleEmailAddresses:toBucket:sync:userInitiated:transactionGeneration:](self, "_moveSenderWithSimpleEmailAddresses:toBucket:sync:userInitiated:transactionGeneration:", v11, a4, v7, v6, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    EDSenderLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_map:", &__block_literal_global_69_1);
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _moveSenderWithEmailAddresses:toBucket:sync:userInitiated:].cold.1();
    }

  }
  -[EDSenderPersistence _invalidateCaches](self, "_invalidateCaches");
  -[EDSenderPersistence _setIsBlocked:forAddresses:](self, "_setIsBlocked:forAddresses:", a4 == 50, v10);
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistenceDidChangeSenders:generation:", v12, v15[0]);

}

id __81__EDSenderPersistence__moveSenderWithEmailAddresses_toBucket_sync_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "ef_publicDescription");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_moveSendersWithSimpleEmailAddresses:(id)a3 toCategoryType:(unint64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6 transactionGeneration:(int64_t *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  EDSenderPersistence *v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDSenderPersistence database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence _moveSendersWithSimpleEmailAddresses:toCategoryType:sync:userInitiated:transactionGeneration:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke;
  v20[3] = &unk_1E949E418;
  v24 = &v26;
  v14 = v10;
  v21 = v14;
  v22 = self;
  v25 = a4;
  v15 = v11;
  v23 = v15;
  v16 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v20);

  if (a7)
    *a7 = v27[3];
  if (v16)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  return v18;
}

BOOL __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  _BOOL8 v32;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id obj;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v35, "transactionGeneration");
  +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:connection:](EDMessagePersistence, "allDatabaseIDsForSimpleAddresses:connection:", a1[4], v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v40);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("sender"), CFSTR("sender_addresses"));
  objc_msgSend(v36, "addResultColumn:", CFSTR("address"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "in:", v40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWhere:", v4);

  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2;
  v62[3] = &unk_1E949C778;
  v5 = a1;
  v62[4] = a1[5];
  v6 = v35;
  v63 = v6;
  v39 = v34;
  v64 = v39;
  v44 = v38;
  v65 = v44;
  v7 = v37;
  v66 = v7;
  objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v36, v62, 0);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend((id)v5[5], "_emailAddressForDatabaseID:connection:", v11, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "emailAddressValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "simpleAddress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(v12, "stringValue");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        objc_msgSend(v44, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v43, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "addObject:", v11);
          }
          else
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v20, v18);
          }
        }
        else
        {
          objc_msgSend(v12, "stringValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v11, v20);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v8);
  }

  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  v21 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_74;
  v51[3] = &unk_1E94A1630;
  v22 = v5[5];
  v53 = &v54;
  v51[4] = v22;
  v23 = v6;
  v52 = v23;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v51);
  v46[0] = v21;
  v46[1] = 3221225472;
  v46[2] = __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_76;
  v46[3] = &unk_1E94A1658;
  v46[4] = v5[5];
  v24 = v23;
  v47 = v24;
  v25 = v5[8];
  v49 = &v54;
  v50 = v25;
  v48 = (id)v5[6];
  objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v46);
  if (*((_BYTE *)v55 + 24))
  {
    objc_msgSend((id)v5[5], "hookRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "persistenceWillChangeSendersForAddresses:", v27);

    v28 = (void *)v5[5];
    v29 = v5[8];
    v45 = 0;
    v30 = objc_msgSend(v28, "_addNewSendersForEmailAddresses:toBucket:categoryType:connection:newSenders:", v41, 0, v29, v24, &v45);
    v31 = v45;
    *((_BYTE *)v55 + 24) = v30;
    objc_msgSend((id)v5[6], "addObjectsFromArray:", v31);

    v32 = *((_BYTE *)v55 + 24) != 0;
  }
  else
  {
    v32 = 0;
  }

  _Block_object_dispose(&v54, 8);
  return v32;
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_emailAddressForDatabaseID:connection:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[NSObject addObject:](v9, "addObject:", v8);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, 0);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
    }
    objc_msgSend(v8, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "simpleAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v8, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        EDSenderLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v15 = objc_msgSend(v7, "unsignedLongLongValue");
          v16 = 2048;
          v17 = objc_msgSend(v5, "unsignedLongLongValue");
          v18 = 2114;
          v19 = v8;
          _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "Address with ID %llu (sender ID %llu) has no string representation: %{public}@", buf, 0x20u);
        }

        v12 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v12);
LABEL_11:

    goto LABEL_12;
  }
  EDSenderLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_cold_1((uint64_t)buf, objc_msgSend(v7, "unsignedLongLongValue"), objc_msgSend(v5, "unsignedLongLongValue"));
LABEL_12:

  objc_msgSend(*(id *)(a1 + 64), "removeObject:", v7);
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_74(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addAddressesWithDatabaseIDs:toSenderWithDatabaseID:connection:error:", v7, v8, *(_QWORD *)(a1 + 40), 0);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_76(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "longLongValue");
  v10 = objc_msgSend(*(id *)(a1 + 32), "_bucketForSenderWithDatabaseID:connection:", v9, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_contactIdentifierForSenderWithDatabaseID:connection:", v9, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E350]), "initWithDatabaseID:addresses:contactIdentifier:bucket:", v9, v8, v11, v10);
  objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceWillChangeSenders:", v14);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_moveSenderWithDatabaseID:toCategoryType:connection:", v9, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
  else
    *a4 = 1;

}

- (id)_moveSenderWithSimpleEmailAddresses:(id)a3 toBucket:(int64_t)a4 sync:(BOOL)a5 userInitiated:(BOOL)a6 transactionGeneration:(int64_t *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  EDSenderPersistence *v22;
  id v23;
  uint64_t *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDSenderPersistence database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence _moveSenderWithSimpleEmailAddresses:toBucket:sync:userInitiated:transactionGeneration:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke;
  v20[3] = &unk_1E949E418;
  v24 = &v26;
  v14 = v10;
  v21 = v14;
  v22 = self;
  v25 = a4;
  v15 = v11;
  v23 = v15;
  v16 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v20);

  if (a7)
    *a7 = v27[3];
  if (v16)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  return v18;
}

BOOL __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  _BOOL8 v32;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id obj;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v35, "transactionGeneration");
  +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:connection:](EDMessagePersistence, "allDatabaseIDsForSimpleAddresses:connection:", a1[4], v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v40);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("sender"), CFSTR("sender_addresses"));
  objc_msgSend(v36, "addResultColumn:", CFSTR("address"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "in:", v40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWhere:", v4);

  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2;
  v62[3] = &unk_1E949C778;
  v5 = a1;
  v62[4] = a1[5];
  v6 = v35;
  v63 = v6;
  v39 = v34;
  v64 = v39;
  v44 = v38;
  v65 = v44;
  v7 = v37;
  v66 = v7;
  objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v36, v62, 0);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend((id)v5[5], "_emailAddressForDatabaseID:connection:", v11, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "emailAddressValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "simpleAddress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(v12, "stringValue");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        objc_msgSend(v44, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v43, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "addObject:", v11);
          }
          else
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v20, v18);
          }
        }
        else
        {
          objc_msgSend(v12, "stringValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v11, v20);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v8);
  }

  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  v21 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_78;
  v51[3] = &unk_1E94A1630;
  v22 = v5[5];
  v53 = &v54;
  v51[4] = v22;
  v23 = v6;
  v52 = v23;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v51);
  v46[0] = v21;
  v46[1] = 3221225472;
  v46[2] = __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2_79;
  v46[3] = &unk_1E94A1658;
  v46[4] = v5[5];
  v24 = v23;
  v47 = v24;
  v25 = v5[8];
  v49 = &v54;
  v50 = v25;
  v48 = (id)v5[6];
  objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v46);
  if (*((_BYTE *)v55 + 24))
  {
    objc_msgSend((id)v5[5], "hookRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "persistenceWillChangeSendersForAddresses:", v27);

    v28 = (void *)v5[5];
    v29 = v5[8];
    v45 = 0;
    v30 = objc_msgSend(v28, "_addNewSendersForEmailAddresses:toBucket:connection:newSenders:", v41, v29, v24, &v45);
    v31 = v45;
    *((_BYTE *)v55 + 24) = v30;
    objc_msgSend((id)v5[6], "addObjectsFromArray:", v31);

    v32 = *((_BYTE *)v55 + 24) != 0;
  }
  else
  {
    v32 = 0;
  }

  _Block_object_dispose(&v54, 8);
  return v32;
}

void __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_emailAddressForDatabaseID:connection:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[NSObject addObject:](v9, "addObject:", v8);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, 0);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
    }
    objc_msgSend(v8, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "simpleAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v8, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        EDSenderLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v15 = objc_msgSend(v7, "unsignedLongLongValue");
          v16 = 2048;
          v17 = objc_msgSend(v5, "unsignedLongLongValue");
          v18 = 2114;
          v19 = v8;
          _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "Address with ID %llu (sender ID %llu) has no string representation: %{public}@", buf, 0x20u);
        }

        v12 = 0;
        goto LABEL_11;
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v12);
LABEL_11:

    goto LABEL_12;
  }
  EDSenderLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_cold_1((uint64_t)buf, objc_msgSend(v7, "unsignedLongLongValue"), objc_msgSend(v5, "unsignedLongLongValue"));
LABEL_12:

  objc_msgSend(*(id *)(a1 + 64), "removeObject:", v7);
}

void __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_78(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_addAddressesWithDatabaseIDs:toSenderWithDatabaseID:connection:error:", v7, v8, *(_QWORD *)(a1 + 40), 0);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;

}

void __109__EDSenderPersistence__moveSenderWithSimpleEmailAddresses_toBucket_sync_userInitiated_transactionGeneration___block_invoke_2_79(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "longLongValue");
  v10 = objc_msgSend(*(id *)(a1 + 32), "_bucketForSenderWithDatabaseID:connection:", v9, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_contactIdentifierForSenderWithDatabaseID:connection:", v9, *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E350]), "initWithDatabaseID:addresses:contactIdentifier:bucket:", v9, v8, v11, v10);
  objc_msgSend(*(id *)(a1 + 32), "hookRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistenceWillChangeSenders:", v14);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_moveSenderWithDatabaseID:toBucket:connection:", v9, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(v12, "setBucket:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
  }
  else
  {
    *a4 = 1;
  }

}

- (void)addAddresses:(id)a3 toSender:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "databaseID");
  if (v9 == *MEMORY[0x1E0D1DC08])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSenderPersistence.m"), 696, CFSTR("Sender must have valid database ID"));

  }
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistenceWillAddAddresses:toSender:", v7, v8);

  v11 = objc_msgSend(v8, "bucket");
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  -[EDSenderPersistence database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence addAddresses:toSender:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __45__EDSenderPersistence_addAddresses_toSender___block_invoke;
  v26[3] = &unk_1E949C190;
  v28 = &v30;
  v26[4] = self;
  v14 = v7;
  v27 = v14;
  v29 = v9;
  v15 = objc_msgSend(v12, "__performWriteWithCaller:usingBlock:", v13, v26);

  if (v15)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(v8, "addAddress:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19++), (_QWORD)v22);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v17);
    }

  }
  -[EDSenderPersistence _setIsBlocked:forAddresses:](self, "_setIsBlocked:forAddresses:", v11 == 50, v14);
  -[EDSenderPersistence _invalidateCaches](self, "_invalidateCaches");
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "persistenceDidAddAddresses:toSender:generation:", v14, v8, v31[3]);

  _Block_object_dispose(&v30, 8);
}

uint64_t __45__EDSenderPersistence_addAddresses_toSender___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "transactionGeneration");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("sender_addresses"));
  objc_msgSend(*(id *)(a1 + 32), "_addressIDsForAddresses:connection:", *(_QWORD *)(a1 + 40), v12);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        objc_msgSend(v3, "addValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("address"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("sender"));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v10 = objc_msgSend(v12, "executeInsertStatement:error:", v3, 0);
  return v10;
}

- (void)removeAddresses:(id)a3 fromSender:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "databaseID");
  if (v9 == *MEMORY[0x1E0D1DC08])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSenderPersistence.m"), 731, CFSTR("Sender must have valid database ID"));

  }
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistenceWillRemoveAddresses:fromSender:", v7, v8);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[EDSenderPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence removeAddresses:fromSender:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __50__EDSenderPersistence_removeAddresses_fromSender___block_invoke;
  v25[3] = &unk_1E949B890;
  v27 = &v28;
  v25[4] = self;
  v13 = v8;
  v26 = v13;
  v14 = objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v25);

  if (v14)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(v13, "removeAddress:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18++), (_QWORD)v21);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
      }
      while (v16);
    }

  }
  -[EDSenderPersistence _setIsBlocked:forAddresses:](self, "_setIsBlocked:forAddresses:", 0, v7, (_QWORD)v21);
  -[EDSenderPersistence _invalidateCaches](self, "_invalidateCaches");
  -[EDSenderPersistence hookRegistry](self, "hookRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "persistenceDidRemoveAddresses:fromSender:generation:", v7, v13, v29[3]);

  _Block_object_dispose(&v28, 8);
}

uint64_t __50__EDSenderPersistence_removeAddresses_fromSender___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "transactionGeneration");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_addressIDsForAddresses:connection:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D1EFE0]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "in:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTable:where:", CFSTR("sender_addresses"), v9);

  v11 = objc_msgSend(v3, "executeDeleteStatement:error:", v10, 0);
  return v11;
}

- (unint64_t)userHasSentToSenderAddress:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  EDSenderPersistence *v18;
  id v19;
  uint8_t *v20;
  uint64_t v21;
  uint8_t buf[8];
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0;
  if (!-[EDSenderPersistence bucketForSenderAddress:bucket:](self, "bucketForSenderAddress:bucket:", v4, &v21))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v23 = buf;
    *((_QWORD *)&v23 + 1) = 0x2020000000;
    v24 = 0;
    -[EDSenderPersistence sentToAddressesQueue](self, "sentToAddressesQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __50__EDSenderPersistence_userHasSentToSenderAddress___block_invoke;
    v17 = &unk_1E949BE18;
    v20 = buf;
    v18 = self;
    v8 = v4;
    v19 = v8;
    dispatch_sync(v7, &v14);

    v9 = *(_QWORD *)(v23 + 24);
    if (v9)
    {
      if (v9 == 1)
      {
        EDSenderLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "emailAddressValue", v14, v15, v16, v17, v18);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDSenderPersistence userHasSentToSenderAddress:].cold.2();
        }
        v5 = 1;
        goto LABEL_19;
      }
      if (v9 != 2)
      {
        v5 = 0;
        goto LABEL_21;
      }
      EDSenderLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "emailAddressValue", v14, v15, v16, v17, v18);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSenderPersistence userHasSentToSenderAddress:].cold.1();
      }
    }
    else
    {
      EDSenderLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "emailAddressValue", v14, v15, v16, v17, v18);
        objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSenderPersistence userHasSentToSenderAddress:].cold.3();
      }
    }
    v5 = 0;
LABEL_19:

LABEL_21:
    _Block_object_dispose(buf, 8);
    goto LABEL_22;
  }
  if (v21 == 200)
    v5 = 2;
  else
    v5 = 1;
  EDSenderLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "emailAddressValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v23) = 2114;
    *(_QWORD *)((char *)&v23 + 2) = v13;
    _os_log_debug_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEBUG, "Returning 'sentTo' result %u from protected database for address: %{public}@", buf, 0x12u);

  }
LABEL_22:

  return v5;
}

void __50__EDSenderPersistence_userHasSentToSenderAddress___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "sentToAddressesFilter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(id *)(a1 + 40);
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "mayHaveSentToSimpleAddress:", v7);
}

- (void)_loadSentToFilterFromDisk
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[EDSenderPersistence sentToAddressesQueue](self, "sentToAddressesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__EDSenderPersistence__loadSentToFilterFromDisk__block_invoke;
  v4[3] = &unk_1E949C258;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__EDSenderPersistence__loadSentToFilterFromDisk__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "sentToAddressesFilter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "loadFromDisk");

    WeakRetained = v3;
  }

}

- (void)_updateSentToFilter
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to request protected database background processing: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

uint64_t __42__EDSenderPersistence__updateSentToFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if ((objc_msgSend(v3, "protectedDatabaseAttached") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_simpleAddressesInBucket:connection:", 200, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "ef_dateHoursAgo:", 168);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_simpleAddressesNotInBucket:withMessagesNewerThan:connection:", 200, v8, v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  return 1;
}

void __42__EDSenderPersistence__updateSentToFilter__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sentToAddressesFilter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

- (BOOL)_addNewSender:(id)a3 toCategoryType:(unint64_t)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "addresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSenderPersistence _addressIDsForAddresses:connection:](self, "_addressIDsForAddresses:connection:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0D1DC08];
  objc_msgSend(v8, "contactIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:categoryType:connection:senderDatabaseID:](self, "_addNewSenderWithAddressIDs:contactIdentifier:toBucket:categoryType:connection:senderDatabaseID:", v11, v12, 0, a4, v9, &v14);

  objc_msgSend(v8, "setDatabaseID:", v14);
  return a4;
}

- (id)_addressIDsForAddresses:(id)a3 connection:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[EDSenderPersistence _simpleAddressesForAddresses:](self, "_simpleAddressesForAddresses:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:connection:](EDMessagePersistence, "allDatabaseIDsForSimpleAddresses:connection:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_addNewSenderWithAddressIDs:(id)a3 contactIdentifier:(id)a4 toBucket:(int64_t)a5 connection:(id)a6 senderDatabaseID:(int64_t *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  __CFString *v46;
  __CFString *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  EDSenderPersistence *v51;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint8_t buf[4];
  __CFString *v64;
  __int16 v65;
  __CFString *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("senders"));
  v14 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("contact_identifier"));
  if (!v11)

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("bucket"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("user_initiated"));
  v62 = 0;
  LODWORD(v15) = objc_msgSend(v12, "executeInsertStatement:error:", v13, &v62);
  v16 = v62;
  v17 = v16;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v18 = *MEMORY[0x1E0D1DC08];
  v61 = *MEMORY[0x1E0D1DC08];
  if ((_DWORD)v15)
  {
    v51 = self;
    v19 = objc_msgSend(v12, "lastInsertedDatabaseID");
    v59[3] = v19;
    goto LABEL_7;
  }
  if (!v11)
    goto LABEL_29;
  v51 = self;
  objc_msgSend(v16, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0D1EE10]) || objc_msgSend(v17, "code") != 19)
  {
    v22 = v17;
    goto LABEL_26;
  }
  objc_msgSend(v17, "userInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE18]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "integerValue") == 2067;

  if (!v32)
    goto LABEL_29;
  v33 = objc_alloc(MEMORY[0x1E0D1F040]);
  v34 = *MEMORY[0x1E0D1EE00];
  v50 = (void *)objc_msgSend(v33, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("contact_identifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "equalTo:", v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setWhere:", v36);

  v56 = v17;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __106__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_connection_senderDatabaseID___block_invoke;
  v57[3] = &unk_1E949B090;
  v57[4] = &v58;
  LODWORD(v36) = objc_msgSend(v12, "executeSelectStatement:withBlock:error:", v50, v57, &v56);
  v22 = v56;

  if (!(_DWORD)v36)
  {
LABEL_24:
    v29 = v50;
LABEL_26:

    goto LABEL_30;
  }
  if (v59[3] == v18)
  {
    EDSenderLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:].cold.1((uint64_t)v11, v37, v38);

    goto LABEL_24;
  }
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, CFSTR("bucket"));

  objc_msgSend(v39, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("user_initiated"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v34);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v59[3]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "equalTo:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWhereClause:", v43);

  v55 = v22;
  v44 = objc_msgSend(v12, "executeUpdateStatement:error:", v39, &v55);
  v17 = v55;

  if (!v44)
  {
LABEL_29:
    v22 = v17;
    goto LABEL_30;
  }
  v19 = v59[3];
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v17;
  v21 = -[EDSenderPersistence _addAddressesWithDatabaseIDs:toSenderWithDatabaseID:connection:error:](v51, "_addAddressesWithDatabaseIDs:toSenderWithDatabaseID:connection:error:", v53, v20, v12, &v54);
  v22 = v54;

  if (v21)
  {
    EDSenderLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (__CFString *)v59[3];
      v25 = CFSTR("default");
      if (a5 == 200)
        v25 = CFSTR("sentTo");
      if (a5 == 50)
        v25 = CFSTR("blocked");
      v26 = v25;
      v27 = objc_msgSend(v53, "count");
      *(_DWORD *)buf = 134219010;
      v64 = v24;
      v65 = 2114;
      v66 = v26;
      v67 = 2048;
      v68 = v27;
      v69 = 2114;
      v70 = v53;
      v71 = 2114;
      v72 = v11;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Added new sender (%lld) to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@", buf, 0x34u);

    }
    v28 = 1;
    goto LABEL_32;
  }
LABEL_30:
  EDSenderLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v46 = CFSTR("default");
    if (a5 == 200)
      v46 = CFSTR("sentTo");
    if (a5 == 50)
      v46 = CFSTR("blocked");
    v47 = v46;
    v48 = objc_msgSend(v53, "count");
    objc_msgSend(v22, "ef_publicDescription");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v64 = v47;
    v65 = 2048;
    v66 = (__CFString *)v48;
    v67 = 2114;
    v68 = (uint64_t)v53;
    v69 = 2114;
    v70 = v11;
    v71 = 2114;
    v72 = v49;
    _os_log_error_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_ERROR, "Failed to add new sender to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@, error: %{public}@", buf, 0x34u);

  }
  v28 = 0;
LABEL_32:

  if (a7)
    *a7 = v59[3];
  _Block_object_dispose(&v58, 8);

  return v28;
}

void __106__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_connection_senderDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (BOOL)_addNewSenderWithAddressIDs:(id)a3 contactIdentifier:(id)a4 toBucket:(int64_t)a5 categoryType:(unint64_t)a6 connection:(id)a7 senderDatabaseID:(int64_t *)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v47;
  __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  EDSenderPersistence *v54;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint8_t buf[4];
  __CFString *v68;
  __int16 v69;
  __CFString *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v13 = a4;
  v57 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("senders"));
  v15 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("contact_identifier"));
  if (!v13)

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("bucket"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("category"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("user_initiated"));
  v54 = self;
  v66 = 0;
  LODWORD(v17) = objc_msgSend(v57, "executeInsertStatement:error:", v14, &v66);
  v18 = v66;
  v19 = v18;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v20 = *MEMORY[0x1E0D1DC08];
  v65 = *MEMORY[0x1E0D1DC08];
  v21 = v56;
  if ((_DWORD)v17)
  {
    v22 = objc_msgSend(v57, "lastInsertedDatabaseID");
    v63[3] = v22;
    goto LABEL_7;
  }
  if (!v13)
    goto LABEL_29;
  objc_msgSend(v18, "domain");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0D1EE10]) || objc_msgSend(v19, "code") != 19)
  {
    v25 = v19;
    goto LABEL_26;
  }
  objc_msgSend(v19, "userInfo");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE18]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "integerValue") == 2067;

  if (!v34)
    goto LABEL_29;
  v35 = objc_alloc(MEMORY[0x1E0D1F040]);
  v51 = *MEMORY[0x1E0D1EE00];
  v53 = (void *)objc_msgSend(v35, "initWithResultColumn:table:");
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("contact_identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "equalTo:", v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setWhere:", v37);

  v60 = v19;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __119__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_categoryType_connection_senderDatabaseID___block_invoke;
  v61[3] = &unk_1E949B090;
  v61[4] = &v62;
  LODWORD(v37) = objc_msgSend(v57, "executeSelectStatement:withBlock:error:", v53, v61, &v60);
  v25 = v60;

  if (!(_DWORD)v37)
  {
LABEL_24:
    v32 = v53;
LABEL_26:

    goto LABEL_30;
  }
  if (v63[3] == v20)
  {
    EDSenderLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:].cold.1((uint64_t)v13, v38, v39);

    goto LABEL_24;
  }
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, CFSTR("bucket"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("category"));

  objc_msgSend(v40, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("user_initiated"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v51);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v63[3]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "equalTo:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWhereClause:", v45);

  v59 = v25;
  LODWORD(v43) = objc_msgSend(v57, "executeUpdateStatement:error:", v40, &v59);
  v19 = v59;

  if (!(_DWORD)v43)
  {
LABEL_29:
    v25 = v19;
    goto LABEL_30;
  }
  v22 = v63[3];
  v21 = v56;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v19;
  v24 = -[EDSenderPersistence _addAddressesWithDatabaseIDs:toSenderWithDatabaseID:connection:error:](v54, "_addAddressesWithDatabaseIDs:toSenderWithDatabaseID:connection:error:", v21, v23, v57, &v58);
  v25 = v58;

  if (v24)
  {
    EDSenderLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (__CFString *)v63[3];
      v28 = CFSTR("default");
      if (a5 == 200)
        v28 = CFSTR("sentTo");
      if (a5 == 50)
        v28 = CFSTR("blocked");
      v29 = v28;
      v30 = objc_msgSend(v56, "count");
      *(_DWORD *)buf = 134219010;
      v68 = v27;
      v69 = 2114;
      v70 = v29;
      v71 = 2048;
      v72 = v30;
      v73 = 2114;
      v74 = v56;
      v75 = 2114;
      v76 = v13;
      _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Added new sender (%lld) to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@", buf, 0x34u);

    }
    v31 = 1;
    goto LABEL_32;
  }
LABEL_30:
  EDSenderLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v47 = CFSTR("default");
    if (a5 == 200)
      v47 = CFSTR("sentTo");
    if (a5 == 50)
      v47 = CFSTR("blocked");
    v48 = v47;
    v49 = objc_msgSend(v56, "count");
    objc_msgSend(v25, "ef_publicDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v68 = v48;
    v69 = 2048;
    v70 = (__CFString *)v49;
    v71 = 2114;
    v72 = (uint64_t)v56;
    v73 = 2114;
    v74 = v13;
    v75 = 2114;
    v76 = v50;
    _os_log_error_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_ERROR, "Failed to add new sender to bucket %{public}@ with %lu addresses: %{public}@, contact identifier: %{public}@, error: %{public}@", buf, 0x34u);

  }
  v31 = 0;
LABEL_32:

  if (a8)
    *a8 = v63[3];
  _Block_object_dispose(&v62, 8);

  return v31;
}

void __119__EDSenderPersistence__addNewSenderWithAddressIDs_contactIdentifier_toBucket_categoryType_connection_senderDatabaseID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "databaseIDValue");

}

- (BOOL)_addAddressesWithDatabaseIDs:(id)a3 toSenderWithDatabaseID:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:conflictResolution:", CFSTR("sender_addresses"), 4);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        objc_msgSend(v10, "addValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("address"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, CFSTR("sender"));

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v17 = objc_msgSend(v20, "executeInsertStatement:error:", v10, a6);
  return v17;
}

- (BOOL)_moveSenderWithDatabaseID:(int64_t)a3 toCategoryType:(unint64_t)a4 connection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("category"));

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhereClause:", v12);

  v20 = 0;
  v13 = objc_msgSend(v7, "executeUpdateStatement:error:", v8, &v20);
  v14 = v20;
  if (v13)
  {
    EDSenderLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 - 1 > 2)
        v16 = CFSTR("default");
      else
        v16 = off_1E94A19D0[a4 - 1];
      *(_DWORD *)buf = 134218242;
      v22 = a3;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Moved sender (%lld) to category %{public}@", buf, 0x16u);
    }
  }
  else
  {
    EDSenderLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (a4 - 1 > 2)
        v17 = CFSTR("default");
      else
        v17 = off_1E94A19D0[a4 - 1];
      objc_msgSend(v14, "ef_publicDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v22 = a3;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v19;
      _os_log_error_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_ERROR, "Failed to move sender (%lld) to category %{public}@, error: %{public}@", buf, 0x20u);

    }
  }

  return v13;
}

- (BOOL)_moveSenderWithDatabaseID:(int64_t)a3 toBucket:(int64_t)a4 connection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  int64_t v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bucket"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("user_initiated"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "equalTo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhereClause:", v12);

  v22 = 0;
  v13 = objc_msgSend(v7, "executeUpdateStatement:error:", v8, &v22);
  v14 = v22;
  if (v13)
  {
    EDSenderLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("default");
      if (a4 == 200)
        v16 = CFSTR("sentTo");
      if (a4 == 50)
        v16 = CFSTR("blocked");
      *(_DWORD *)buf = 134218242;
      v24 = a3;
      v25 = 2114;
      v26 = v16;
      v17 = v16;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Moved sender (%lld) to bucket %{public}@", buf, 0x16u);

    }
  }
  else
  {
    EDSenderLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = CFSTR("default");
      if (a4 == 200)
        v19 = CFSTR("sentTo");
      if (a4 == 50)
        v19 = CFSTR("blocked");
      v20 = v19;
      objc_msgSend(v14, "ef_publicDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v24 = a3;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v21;
      _os_log_error_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_ERROR, "Failed to move sender (%lld) to bucket %{public}@, error: %{public}@", buf, 0x20u);

    }
  }

  return v13;
}

- (BOOL)_addNewSendersForEmailAddresses:(id)a3 toBucket:(int64_t)a4 connection:(id)a5 newSenders:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  id v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id obj;
  id v42;
  id v43;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  int64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  _QWORD aBlock[4];
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v38 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke;
  aBlock[3] = &unk_1E94A16D0;
  v40 = v8;
  v73 = v40;
  v32 = _Block_copy(aBlock);
  objc_msgSend(v40, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v71 = 0;
  -[EDSenderPersistence _addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:](self, "_addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:", v9, &v71, &v70);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v71;
  v37 = v70;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2;
  v68[3] = &unk_1E94A16F8;
  v34 = v32;
  v69 = v34;
  objc_msgSend(v10, "ef_mapValues:", v68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0;
  -[EDSenderPersistence _addressIDsGroupedByContactsForAddressesByContact:withConnection:addressesByID:](self, "_addressIDsGroupedByContactsForAddressesByContact:withConnection:addressesByID:", v37, v38, &v67);
  v12 = objc_claimAutoreleasedReturnValue();
  v39 = v67;
  v31 = (void *)v12;
  -[EDSenderPersistence _combineDictionary:withDictionary:](self, "_combineDictionary:withDictionary:", v11, v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v39, "count", v13))
    objc_msgSend(v13, "addEntriesFromDictionary:", v39);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_3;
  v65[3] = &unk_1E94A1720;
  v14 = v13;
  v66 = v14;
  objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v65);
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 1;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_4;
  v54[3] = &unk_1E94A1748;
  v59 = &v61;
  v60 = a4;
  v54[4] = self;
  v42 = v38;
  v55 = v42;
  v30 = v37;
  v56 = v30;
  v16 = v14;
  v57 = v16;
  v43 = v15;
  v58 = v43;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v54);
  if (*((_BYTE *)v62 + 24))
  {
    -[EDSenderPersistence _addressesGroupedBySimpleAddressForAddresses:](self, "_addressesGroupedBySimpleAddressForAddresses:", v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_93;
    v52[3] = &unk_1E94A1770;
    v53 = v34;
    objc_msgSend(v17, "ef_compactMap:", v52);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v74, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v49;
      v21 = *MEMORY[0x1E0D1DC08];
LABEL_6:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v22);
        v47 = v21;
        v24 = -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:](self, "_addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:", v23, 0, a4, v42, &v47);
        *((_BYTE *)v62 + 24) = v24;
        if (!v24)
          break;
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2_95;
        v45[3] = &unk_1E94A1798;
        v46 = v16;
        objc_msgSend(v23, "ef_compactMap:", v45);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc(MEMORY[0x1E0D1E350]);
        v27 = (void *)objc_msgSend(v26, "initWithDatabaseID:addresses:contactIdentifier:bucket:", v47, v25, 0, a4);
        objc_msgSend(v43, "addObject:", v27);

        if (v19 == ++v22)
        {
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v74, 16);
          if (v19)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  if (a6)
  {
    objc_msgSend(v43, "ef_notEmpty");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = *((_BYTE *)v62 + 24) != 0;

  _Block_object_dispose(&v61, 8);
  return v28;
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ef_compactMap:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v31 = *MEMORY[0x1E0D1DC08];
  v9 = *(void **)(a1 + 32);
  v25 = v8;
  v26 = v7;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v9, "_addNewSenderWithAddressIDs:contactIdentifier:toBucket:connection:senderDatabaseID:", v8, v10, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), &v31);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            EDSenderLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = objc_msgSend(v17, "unsignedLongLongValue");
              *(_DWORD *)buf = 134218240;
              v33 = v20;
              v34 = 2048;
              v35 = v31;
              _os_log_error_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_ERROR, "<nil> address for ID %llu (sender ID %llu)", buf, 0x16u);
            }

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v12, "count"))
    {
      v21 = objc_alloc(MEMORY[0x1E0D1E350]);
      v22 = v31;
      objc_msgSend(v26, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDatabaseID:addresses:contactIdentifier:bucket:", v22, v12, v23, *(_QWORD *)(a1 + 80));

      objc_msgSend(*(id *)(a1 + 64), "addObject:", v24);
    }

  }
  else
  {
    *a4 = 1;
  }

}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_93(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ef_compactMap:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_notEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __86__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_connection_newSenders___block_invoke_2_95(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_addNewSendersForEmailAddresses:(id)a3 toBucket:(int64_t)a4 categoryType:(unint64_t)a5 connection:(id)a6 newSenders:(id *)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  void *v28;
  BOOL v29;
  id v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id obj;
  id v43;
  id v45;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  int64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  _QWORD aBlock[4];
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v39 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke;
  aBlock[3] = &unk_1E94A16D0;
  v41 = v9;
  v76 = v41;
  v33 = _Block_copy(aBlock);
  objc_msgSend(v41, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v73 = 0;
  -[EDSenderPersistence _addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:](self, "_addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:", v10, &v74, &v73);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v74;
  v38 = v73;
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2;
  v71[3] = &unk_1E94A16F8;
  v35 = v33;
  v72 = v35;
  objc_msgSend(v11, "ef_mapValues:", v71);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0;
  -[EDSenderPersistence _addressIDsGroupedByContactsForAddressesByContact:withConnection:addressesByID:](self, "_addressIDsGroupedByContactsForAddressesByContact:withConnection:addressesByID:", v38, v39, &v70);
  v13 = objc_claimAutoreleasedReturnValue();
  v40 = v70;
  v32 = (void *)v13;
  -[EDSenderPersistence _combineDictionary:withDictionary:](self, "_combineDictionary:withDictionary:", v12, v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v40, "count"))
    objc_msgSend(v14, "addEntriesFromDictionary:", v40);
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_3;
  v68[3] = &unk_1E94A1720;
  v15 = v14;
  v69 = v15;
  objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v68);
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 1;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_4;
  v56[3] = &unk_1E94A17C0;
  v61 = &v64;
  v62 = a4;
  v56[4] = self;
  v63 = a5;
  v43 = v39;
  v57 = v43;
  v31 = v38;
  v58 = v31;
  v17 = v15;
  v59 = v17;
  v45 = v16;
  v60 = v45;
  objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v56);
  if (*((_BYTE *)v65 + 24))
  {
    -[EDSenderPersistence _addressesGroupedBySimpleAddressForAddresses:](self, "_addressesGroupedBySimpleAddressForAddresses:", v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_97;
    v54[3] = &unk_1E94A1770;
    v55 = v35;
    objc_msgSend(v18, "ef_compactMap:", v54);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v19;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v77, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v51;
      v22 = *MEMORY[0x1E0D1DC08];
LABEL_6:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v21)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v23);
        v49 = v22;
        v25 = -[EDSenderPersistence _addNewSenderWithAddressIDs:contactIdentifier:toBucket:categoryType:connection:senderDatabaseID:](self, "_addNewSenderWithAddressIDs:contactIdentifier:toBucket:categoryType:connection:senderDatabaseID:", v24, 0, a4, a5, v43, &v49);
        *((_BYTE *)v65 + 24) = v25;
        if (!v25)
          break;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2_98;
        v47[3] = &unk_1E94A1798;
        v48 = v17;
        objc_msgSend(v24, "ef_compactMap:", v47);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_alloc(MEMORY[0x1E0D1E350]);
        v28 = (void *)objc_msgSend(v27, "initWithDatabaseID:addresses:contactIdentifier:bucket:", v49, v26, 0, a4);
        objc_msgSend(v45, "addObject:", v28);

        if (v20 == ++v23)
        {
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v77, 16);
          if (v20)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  if (a7)
  {
    objc_msgSend(v45, "ef_notEmpty");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = *((_BYTE *)v65 + 24) != 0;

  _Block_object_dispose(&v64, 8);
  return v29;
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ef_compactMap:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

void __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v31 = *MEMORY[0x1E0D1DC08];
  v9 = *(void **)(a1 + 32);
  v25 = v8;
  v26 = v7;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v9, "_addNewSenderWithAddressIDs:contactIdentifier:toBucket:categoryType:connection:senderDatabaseID:", v8, v10, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), &v31);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            EDSenderLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = objc_msgSend(v17, "unsignedLongLongValue");
              *(_DWORD *)buf = 134218240;
              v33 = v20;
              v34 = 2048;
              v35 = v31;
              _os_log_error_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_ERROR, "<nil> address for ID %llu (sender ID %llu)", buf, 0x16u);
            }

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v12, "count"))
    {
      v21 = objc_alloc(MEMORY[0x1E0D1E350]);
      v22 = v31;
      objc_msgSend(v26, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithDatabaseID:addresses:contactIdentifier:bucket:", v22, v12, v23, *(_QWORD *)(a1 + 80));

      objc_msgSend(*(id *)(a1 + 64), "addObject:", v24);
    }

  }
  else
  {
    *a4 = 1;
  }

}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_97(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ef_compactMap:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ef_notEmpty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __99__EDSenderPersistence__addNewSendersForEmailAddresses_toBucket_categoryType_connection_newSenders___block_invoke_2_98(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_contactIdentifierForSenderWithDatabaseID:(int64_t)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("contact_identifier"), CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v9);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__31;
  v17 = __Block_byref_object_dispose__31;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__EDSenderPersistence__contactIdentifierForSenderWithDatabaseID_connection___block_invoke;
  v12[3] = &unk_1E949B090;
  v12[4] = &v13;
  objc_msgSend(v5, "executeSelectStatement:withBlock:error:", v6, v12, 0);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __76__EDSenderPersistence__contactIdentifierForSenderWithDatabaseID_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (int64_t)_bucketForSenderWithDatabaseID:(int64_t)a3 connection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("bucket"), CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "equalTo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v9);

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__EDSenderPersistence__bucketForSenderWithDatabaseID_connection___block_invoke;
  v12[3] = &unk_1E949B090;
  v12[4] = &v13;
  objc_msgSend(v5, "executeSelectStatement:withBlock:error:", v6, v12, 0);
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __65__EDSenderPersistence__bucketForSenderWithDatabaseID_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

- (id)_emailAddressForDatabaseID:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[EDSenderPersistence databaseIDToEmailAddressCache](self, "databaseIDToEmailAddressCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke;
  v13[3] = &unk_1E94A1810;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "objectForKey:generator:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id v39;

  v39 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v39);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v39;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "equalTo:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWhere:", v5);

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__31;
  v37 = __Block_byref_object_dispose__31;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__31;
  v31 = __Block_byref_object_dispose__31;
  v32 = 0;
  v6 = *(void **)(a1 + 40);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke_2;
  v23 = &unk_1E94A17E8;
  v25 = &v33;
  v7 = v3;
  v24 = v7;
  v26 = &v27;
  objc_msgSend(v6, "executeSelectStatement:withBlock:error:", v2, &v20, 0);
  v8 = (void *)v34[5];
  v9 = (id)v28[5];
  v10 = v8;
  v11 = objc_alloc(MEMORY[0x1E0D1E6C0]);
  v12 = (void *)objc_msgSend(v11, "initWithString:", v9, v20, v21, v22, v23);
  objc_msgSend(v12, "setDisplayName:", v10);
  objc_msgSend(v12, "emailAddressValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v12, "stringValue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = v9;
    v15 = v18;

  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v15;
}

void __61__EDSenderPersistence__emailAddressForDatabaseID_connection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)_simpleAddressesInBucket:(int64_t)a3 connection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v5 = a4;
  v23 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  v8 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v6, "join:sourceColumn:targetColumn:", CFSTR("sender_addresses"), *MEMORY[0x1E0D1EE00], CFSTR("address"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "join:sourceColumn:targetColumn:", CFSTR("senders"), CFSTR("sender"), v8);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("senders"), CFSTR("bucket"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "equalTo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWhere:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__EDSenderPersistence__simpleAddressesInBucket_connection___block_invoke;
  v20[3] = &unk_1E949E598;
  v15 = v7;
  v21 = v15;
  v22 = v14;
  v16 = v14;
  if (objc_msgSend(v5, "executeSelectStatement:withBlock:error:", v6, v20, 0))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

void __59__EDSenderPersistence__simpleAddressesInBucket_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

- (id)_simpleAddressesNotInBucket:(int64_t)a3 withMessagesNewerThan:(id)a4 connection:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v6 = a4;
  v7 = a5;
  v8 = objc_alloc(MEMORY[0x1E0D1F040]);
  +[EDMessagePersistence messagesSenderColumnName](EDMessagePersistence, "messagesSenderColumnName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithResultColumn:table:", v9, v10);

  v12 = (void *)MEMORY[0x1E0D1EFC0];
  +[EDMessagePersistence messagesDateReceivedColumnName](EDMessagePersistence, "messagesDateReceivedColumnName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "column:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "greaterThan:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWhere:", v15);

  v29 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", *MEMORY[0x1E0D1EE00]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "in:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWhere:", v19);

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__EDSenderPersistence__simpleAddressesNotInBucket_withMessagesNewerThan_connection___block_invoke;
  v26[3] = &unk_1E949E598;
  v21 = v17;
  v27 = v21;
  v28 = v20;
  v22 = v20;
  if (objc_msgSend(v7, "executeSelectStatement:withBlock:error:", v16, v26, 0))
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  return v24;
}

void __84__EDSenderPersistence__simpleAddressesNotInBucket_withMessagesNewerThan_connection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

- (void)_setIsBlocked:(BOOL)a3 forAddresses:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  EDSenderLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "count");
    v9 = CFSTR("Unblocking");
    if (v4)
      v9 = CFSTR("Blocking");
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu addresses", buf, 0x16u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "emailAddressValue", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[EDSenderPersistence blockedSenderManager](self, "blockedSenderManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "simpleAddress");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
            objc_msgSend(v15, "blockEmailAddress:", v16);
          else
            objc_msgSend(v15, "unblockEmailAddress:", v16);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)_blockedSendersDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DBB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__EDSenderPersistence__blockedSendersDidChange___block_invoke;
  v11[3] = &unk_1E94A1838;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __48__EDSenderPersistence__blockedSendersDidChange___block_invoke_2;
  v9[3] = &unk_1E94A1838;
  v9[4] = self;
  v7 = v12;
  v10 = v7;
  -[EDSenderPersistence _updateBlockedSendersWithBlockedSenderAddresses:newlyBlockedAddresses:newlyUnblockedAddresses:](self, "_updateBlockedSendersWithBlockedSenderAddresses:newlyBlockedAddresses:newlyUnblockedAddresses:", v5, v11, v9);
  -[EDSenderPersistence _invalidateCaches](self, "_invalidateCaches");

}

id __48__EDSenderPersistence__blockedSendersDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D1DBA8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addressesToDatabaseIDsForSimpleAddresses:connection:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __48__EDSenderPersistence__blockedSendersDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D1DBC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addressesToDatabaseIDsForSimpleAddresses:connection:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_addressesToDatabaseIDsForSimpleAddresses:(id)a3 connection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a4;
  +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:connection:](EDMessagePersistence, "allDatabaseIDsForSimpleAddresses:connection:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v8, "addResultColumn:alias:", *MEMORY[0x1E0D1EE00], CFSTR("address_id"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "in:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v12);

  -[EDSenderPersistence _addressesToDatabaseIDsForSelect:addressColumns:connection:error:](self, "_addressesToDatabaseIDsForSelect:addressColumns:connection:error:", v8, v9, v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_reloadBlockedSendersWithAddresses:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke;
  v4[3] = &unk_1E94A1860;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke_2;
  v3[3] = &unk_1E94A1860;
  -[EDSenderPersistence _updateBlockedSendersWithBlockedSenderAddresses:newlyBlockedAddresses:newlyUnblockedAddresses:](self, "_updateBlockedSendersWithBlockedSenderAddresses:newlyBlockedAddresses:newlyUnblockedAddresses:", a3, v4, v3);
}

id __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_newlyBlockedAddressesForBlockedAddressDatabaseIDs:connection:", a2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __58__EDSenderPersistence__reloadBlockedSendersWithAddresses___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_newlyUnblockedAddressesForBlockedAddressDatabaseIDs:connection:", a2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateBlockedSendersWithBlockedSenderAddresses:(id)a3 newlyBlockedAddresses:(id)a4 newlyUnblockedAddresses:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  EDSenderPersistence *v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__31;
  v36 = __Block_byref_object_dispose__31;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__31;
  v30 = __Block_byref_object_dispose__31;
  v31 = 0;
  -[EDSenderPersistence database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDSenderPersistence _updateBlockedSendersWithBlockedSenderAddresses:newlyBlockedAddresses:newlyUnblockedAddresses:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __117__EDSenderPersistence__updateBlockedSendersWithBlockedSenderAddresses_newlyBlockedAddresses_newlyUnblockedAddresses___block_invoke;
  v19 = &unk_1E94A1888;
  v13 = v8;
  v20 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v10;
  v21 = self;
  v23 = v15;
  v24 = &v32;
  v25 = &v26;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, &v16);

  if (objc_msgSend((id)v33[5], "count", v16, v17, v18, v19))
    -[EDSenderPersistence _setIsBlocked:forAddresses:](self, "_setIsBlocked:forAddresses:", 1, v33[5]);
  if (objc_msgSend((id)v27[5], "count"))
    -[EDSenderPersistence _setIsBlocked:forAddresses:](self, "_setIsBlocked:forAddresses:", 0, v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

uint64_t __117__EDSenderPersistence__updateBlockedSendersWithBlockedSenderAddresses_newlyBlockedAddresses_newlyUnblockedAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  id obj;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence allDatabaseIDsForSimpleAddresses:connection:](EDMessagePersistence, "allDatabaseIDsForSimpleAddresses:connection:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count")
    && (v8 = *(void **)(a1 + 40),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
        obj = *(id *)(v9 + 40),
        v10 = objc_msgSend(v8, "_blockOrUnblockSendersForAddresses:block:blockedAddressDatabaseIDs:connection:addressesToUpdate:", v6, 1, v5, v3, &obj), objc_storeStrong((id *)(v9 + 40), obj), !v10))
  {
    v13 = 0;
  }
  else if (objc_msgSend(v7, "count"))
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "_blockOrUnblockSendersForAddresses:block:blockedAddressDatabaseIDs:connection:addressesToUpdate:", v7, 0, v5, v3, &v15);
    objc_storeStrong((id *)(v12 + 40), v15);
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)_newlyBlockedAddressesForBlockedAddressDatabaseIDs:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  v10 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v8, "addResultColumn:alias:", *MEMORY[0x1E0D1EE00], CFSTR("address_id"));
  objc_msgSend(v8, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("sender_addresses"), v10, CFSTR("address"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("senders"), CFSTR("sender"), v10);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "in:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("senders"), CFSTR("bucket"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "isNot:", &unk_1E94E4AA8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D1EF90];
  v26[0] = v14;
  v26[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "combined:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v19);

  v24 = 0;
  -[EDSenderPersistence _addressesToDatabaseIDsForSelect:addressColumns:connection:error:](self, "_addressesToDatabaseIDsForSelect:addressColumns:connection:error:", v8, v9, v7, &v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v24;
  if (!v20)
  {
    EDSenderLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _newlyBlockedAddressesForBlockedAddressDatabaseIDs:connection:].cold.1();
    }

  }
  return v20;
}

- (id)_newlyUnblockedAddressesForBlockedAddressDatabaseIDs:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  v10 = *MEMORY[0x1E0D1EE00];
  objc_msgSend(v8, "addResultColumn:alias:", *MEMORY[0x1E0D1EE00], CFSTR("address_id"));
  objc_msgSend(v8, "join:sourceColumn:targetColumn:", CFSTR("sender_addresses"), v10, CFSTR("address"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "join:sourceColumn:targetColumn:", CFSTR("senders"), CFSTR("sender"), v10);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("senders"), CFSTR("bucket"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "is:", &unk_1E94E4AA8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address_id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notIn:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D1EF90];
  v26[0] = v14;
  v26[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "combined:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWhere:", v19);

  v24 = 0;
  -[EDSenderPersistence _addressesToDatabaseIDsForSelect:addressColumns:connection:error:](self, "_addressesToDatabaseIDsForSelect:addressColumns:connection:error:", v8, v9, v7, &v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v24;
  if (!v20)
  {
    EDSenderLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _newlyUnblockedAddressesForBlockedAddressDatabaseIDs:connection:].cold.1();
    }

  }
  return v20;
}

- (id)_addressesToDatabaseIDsForSelect:(id)a3 addressColumns:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__EDSenderPersistence__addressesToDatabaseIDsForSelect_addressColumns_connection_error___block_invoke;
  v18[3] = &unk_1E949E598;
  v13 = v10;
  v19 = v13;
  v20 = v12;
  v14 = v12;
  if (objc_msgSend(v11, "executeSelectStatement:withBlock:error:", v9, v18, a6))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

void __88__EDSenderPersistence__addressesToDatabaseIDsForSelect_addressColumns_connection_error___block_invoke(uint64_t a1, void *a2)
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("address_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = v7;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v11);
  objc_msgSend(v13, "setDisplayName:", v12);
  objc_msgSend(v13, "emailAddressValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v13, "stringValue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = v11;
    v16 = v19;

  }
  v20 = *(void **)(a1 + 40);
  objc_msgSend(v16, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v4, v21);

}

- (BOOL)_blockOrUnblockSendersForAddresses:(id)a3 block:(BOOL)a4 blockedAddressDatabaseIDs:(id)a5 connection:(id)a6 addressesToUpdate:(id *)a7
{
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  const __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  BOOL v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  __CFString *v52;
  __CFString *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  _BOOL4 v65;
  void *v66;
  id v67;
  _BOOL4 v68;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  __CFString *v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  id obj;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  BOOL v99;
  id v100;
  id v101;
  _QWORD v102[4];
  id v103;
  __CFString *v104;
  id v105;
  id v106;
  _BYTE v107[128];
  uint8_t v108[128];
  uint8_t buf[4];
  const __CFString *v110;
  __int16 v111;
  __CFString *v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  uint64_t v117;

  v9 = a4;
  v117 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v74 = a5;
  v80 = a6;
  v11 = 50;
  if (!v9)
    v11 = 0;
  v83 = v11;
  v70 = v10;
  v77 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v72 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v73 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v68 = v9;
  v106 = 0;
  +[EDMessagePersistence selectAddressesStatementWithResultColumns:](EDMessagePersistence, "selectAddressesStatementWithResultColumns:", &v106);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v106;
  v14 = *MEMORY[0x1E0D1EE00];
  v78 = v12;
  objc_msgSend(v12, "addResultColumn:alias:", *MEMORY[0x1E0D1EE00], CFSTR("address_id"));
  objc_msgSend(v12, "leftOuterJoin:sourceColumn:targetColumn:", CFSTR("sender_addresses"), v14, CFSTR("address"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addResultColumn:", CFSTR("sender"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address_id"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "in:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWhere:", v17);

  v18 = MEMORY[0x1E0C809B0];
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __119__EDSenderPersistence__blockOrUnblockSendersForAddresses_block_blockedAddressDatabaseIDs_connection_addressesToUpdate___block_invoke;
  v102[3] = &unk_1E949C8B8;
  v19 = v13;
  v103 = v19;
  v76 = (__CFString *)v72;
  v104 = v76;
  v20 = v73;
  v105 = v20;
  v101 = 0;
  LODWORD(v15) = objc_msgSend(v80, "executeSelectStatement:withBlock:error:", v12, v102, &v101);
  v79 = v101;
  if (!(_DWORD)v15)
  {
    v47 = 0;
    goto LABEL_40;
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("senders"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v83);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, CFSTR("bucket"));

  -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("user_initiated"));
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "in:", v76);
  v24 = objc_claimAutoreleasedReturnValue();
  -[NSObject setWhereClause:](v21, "setWhereClause:", v24);

  v100 = v79;
  LOBYTE(v24) = objc_msgSend(v80, "executeUpdateStatement:error:", v21, &v100);
  v25 = v100;

  if ((v24 & 1) == 0)
  {
    EDSenderLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v52 = CFSTR("default");
      if (v68)
        v52 = CFSTR("blocked");
      v53 = v52;
      objc_msgSend(v25, "ef_publicDescription");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v54;
      v56 = CFSTR("unblocked");
      *(_DWORD *)buf = 138544130;
      if (v68)
        v56 = CFSTR("blocked");
      v110 = v56;
      v111 = 2114;
      v112 = v53;
      v113 = 2114;
      v114 = (uint64_t)v76;
      v115 = 2114;
      v116 = v54;
      _os_log_error_impl(&dword_1D2F2C000, v48, OS_LOG_TYPE_ERROR, "Failed to move %{public}@ senders to bucket %{public}@: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    v47 = 0;
    goto LABEL_39;
  }

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("sender_addresses"));
  +[EDMessagePersistence addJoinsForAddressToSelectComponent:withSourceAddressColumn:](EDMessagePersistence, "addJoinsForAddressToSelectComponent:withSourceAddressColumn:", v21, CFSTR("address"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("sender"));
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v26, "in:", v76);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setWhere:](v21, "setWhere:", v27);

  v95[0] = v18;
  v95[1] = 3221225472;
  v95[2] = __119__EDSenderPersistence__blockOrUnblockSendersForAddresses_block_blockedAddressDatabaseIDs_connection_addressesToUpdate___block_invoke_112;
  v95[3] = &unk_1E94A18B0;
  v99 = v68;
  v96 = v74;
  v67 = v66;
  v97 = v67;
  v28 = v77;
  v98 = v28;
  v94 = v25;
  LOBYTE(v26) = objc_msgSend(v80, "executeSelectStatement:withBlock:error:", v21, v95, &v94);
  v79 = v94;

  if ((v26 & 1) == 0)
  {
    EDSenderLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v79, "ef_publicDescription");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v57;
      v59 = CFSTR("unblocked");
      *(_DWORD *)buf = 138543874;
      if (v68)
        v59 = CFSTR("blocked");
      v110 = v59;
      v111 = 2114;
      v112 = v76;
      v113 = 2114;
      v114 = v57;
      _os_log_error_impl(&dword_1D2F2C000, v49, OS_LOG_TYPE_ERROR, "Failed to look up additional addresses for %{public}@ senders: %{public}@, error: %{public}@", buf, 0x20u);

    }
    v47 = 0;
    goto LABEL_38;
  }

  v93 = 0;
  v29 = -[EDSenderPersistence _addNewSendersForEmailAddresses:toBucket:connection:newSenders:](self, "_addNewSendersForEmailAddresses:toBucket:connection:newSenders:", v20, v83, v80, &v93);
  v30 = v93;
  v65 = v29;
  if (!v29)
  {
    EDSenderLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v60 = CFSTR("default");
      if (v68)
        v60 = CFSTR("blocked");
      v61 = v60;
      objc_msgSend(v79, "ef_publicDescription");
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v62;
      v64 = CFSTR("unblocked");
      *(_DWORD *)buf = 138544130;
      if (v68)
        v64 = CFSTR("blocked");
      v110 = v64;
      v111 = 2114;
      v112 = v61;
      v113 = 2114;
      v114 = (uint64_t)v76;
      v115 = 2114;
      v116 = v62;
      _os_log_error_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_ERROR, "Failed to add new %{public}@ senders to bucket %{public}@: %{public}@, error: %{public}@", buf, 0x2Au);

    }
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v30;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
  if (v32)
  {
    v82 = *(_QWORD *)v90;
    do
    {
      v84 = v32;
      for (i = 0; i != v84; ++i)
      {
        if (*(_QWORD *)v90 != v82)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v34, "addresses");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v86 != v37)
                objc_enumerationMutation(v35);
              v39 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
              objc_msgSend(v39, "stringValue");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v41 == 0;

              if (v42)
              {
                objc_msgSend(v39, "stringValue");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v43);

              }
            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
          }
          while (v36);
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
    }
    while (v32);
  }

  if (v65)
  {
    EDSenderLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v44 = CFSTR("unblocked");
      if (v68)
        v44 = CFSTR("blocked");
      *(_DWORD *)buf = 138543874;
      v110 = v44;
      v45 = CFSTR("default");
      v111 = 2114;
      if (v68)
        v45 = CFSTR("blocked");
      v112 = v45;
      v113 = 2114;
      v114 = (uint64_t)v76;
      v46 = v45;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "Moved %{public}@ senders to bucket %{public}@: %{public}@", buf, 0x20u);

    }
    v47 = 1;
LABEL_38:
    v19 = v67;
    v25 = v79;
LABEL_39:

    v79 = v25;
    goto LABEL_40;
  }
  v47 = 0;
  v19 = v67;
LABEL_40:
  if (a7)
  {
    objc_msgSend(v77, "allObjects");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSenderPersistence _simpleAddressesForAddresses:](self, "_simpleAddressesForAddresses:", v50);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v47;
}

void __119__EDSenderPersistence__blockOrUnblockSendersForAddresses_block_blockedAddressDatabaseIDs_connection_addressesToUpdate___block_invoke(uint64_t a1, void *a2)
{
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
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("sender"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("address_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "second");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  v14 = v9;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v13);
  objc_msgSend(v15, "setDisplayName:", v14);
  objc_msgSend(v15, "emailAddressValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(v15, "stringValue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v13;
    v18 = v21;

  }
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    v22 = *(void **)(a1 + 48);
    objc_msgSend(v18, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v6, v23);

  }
}

void __119__EDSenderPersistence__blockOrUnblockSendersForAddresses_block_blockedAddressDatabaseIDs_connection_addressesToUpdate___block_invoke_112(uint64_t a1, void *a2)
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = *(unsigned __int8 *)(a1 + 56);
  if ((_DWORD)v3 != objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "first");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    v12 = v7;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v11);
    objc_msgSend(v13, "setDisplayName:", v12);
    objc_msgSend(v13, "emailAddressValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v13, "stringValue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = v11;
      v16 = v19;

    }
    if (v16)
    {
      v20 = *(void **)(a1 + 48);
      objc_msgSend(v16, "stringValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

    }
  }

}

- (id)_simpleAddressesForAddresses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "emailAddressValue", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "simpleAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v9, "stringValue");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        objc_msgSend(v4, "ef_addOptionalObject:", v14);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_addressesGroupedBySimpleAddressForAddresses:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ef_groupBy:", &__block_literal_global_113_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __68__EDSenderPersistence__addressesGroupedBySimpleAddressForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_combineDictionary:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v14 = v6;
LABEL_6:
    v13 = v14;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v14 = v5;
    goto LABEL_6;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke;
  v19[3] = &unk_1E949FD08;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v19);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke_2;
  v16[3] = &unk_1E949FD08;
  v17 = v5;
  v11 = v10;
  v18 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
  v12 = v18;
  v13 = v11;

LABEL_7:
  return v13;
}

void __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v6;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_flatten");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);
  }

}

void __57__EDSenderPersistence__combineDictionary_withDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);

}

- (id)_addressesGroupedByContactForAddresses:(id)a3 unmatchedAddresses:(id *)a4 otherAddressesByContact:(id *)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  char v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id obj;
  void *v76;
  id v77;
  id v78;
  uint64_t k;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint8_t v105[128];
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  uint64_t v109;
  _BYTE v110[128];
  _QWORD v111[6];

  v111[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0C966C0];
  v111[0] = *MEMORY[0x1E0C966D0];
  v111[1] = v7;
  v111[2] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v80 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v100 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v11, "emailAddressValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v81, "addObject:", v12);
          objc_msgSend(v12, "simpleAddress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "ef_addOptionalObject:", v13);
        }
        else
        {
          objc_msgSend(v11, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addObject:", v13);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
    }
    while (v8);
  }

  v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EDSenderPersistence contactStore](self, "contactStore");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(obj, "count") < 0x3E9)
    goto LABEL_38;
  v98 = 0;
  objc_msgSend(v72, "unifiedContactCountWithError:", &v98);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v98;
  v76 = v15;
  if (!v15)
  {
    EDSenderLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:].cold.1();
    }

    goto LABEL_37;
  }
  EDSenderLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 138412546;
    v107 = v15;
    v108 = 2048;
    v109 = v18;
    _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Contacts count: %@, addresses count: %lu", buf, 0x16u);
  }

  v19 = objc_msgSend(obj, "count");
  if (v19 <= 5 * objc_msgSend(v15, "unsignedIntegerValue"))
  {
LABEL_37:

LABEL_38:
    objc_msgSend(obj, "sortedArrayUsingComparator:", &__block_literal_global_116);
    v78 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  v97 = v16;
  objc_msgSend(v72, "allContactEmailAddressesWithError:", &v97);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v97;

  if (v73)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v73);
    v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v21 = obj;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v94 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          objc_msgSend(v25, "emailAddressValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "simpleAddress");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            v29 = v27;
          }
          else
          {
            objc_msgSend(v25, "stringValue");
            v29 = (id)objc_claimAutoreleasedReturnValue();
          }
          v30 = v29;

          if (-[NSObject containsObject:](v20, "containsObject:", v30))
          {
            objc_msgSend(v78, "addObject:", v25);
          }
          else
          {
            v31 = v25;
            objc_msgSend(v31, "emailAddressValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
            {
              v34 = v32;
            }
            else
            {
              objc_msgSend(v31, "stringValue");
              v34 = (id)objc_claimAutoreleasedReturnValue();
            }
            v35 = v34;

            objc_msgSend(v67, "addObject:", v35);
          }

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
      }
      while (v22);
    }

    objc_msgSend(v78, "sortUsingComparator:", &__block_literal_global_116);
  }
  else
  {
    EDSenderLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v69, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDSenderPersistence _addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:].cold.2();
    }
    v78 = 0;
  }

  if (!v78)
    goto LABEL_38;
LABEL_39:
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v66 = v78;
  v74 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
  if (v74)
  {
    v70 = *(_QWORD *)v90;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v90 != v70)
          objc_enumerationMutation(v66);
        v37 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
        objc_msgSend(v72, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v37, v71, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend(v68, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v77 = v39;
            objc_msgSend(v39, "addObject:", v37);
          }
          else
          {
            v77 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v37, 0);
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v77, v38);
          }
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          objc_msgSend(v38, "emailAddresses");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "ef_compactMapSelector:", sel_value);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
          if (v45)
          {
            v46 = *(_QWORD *)v86;
            do
            {
              for (m = 0; m != v45; ++m)
              {
                if (*(_QWORD *)v86 != v46)
                  objc_enumerationMutation(v44);
                v48 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * m);
                objc_msgSend(v48, "emailAddressValue");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "displayName");
                v50 = (void *)objc_claimAutoreleasedReturnValue();

                if (v50)
                {
                  if ((objc_msgSend(v81, "containsObject:", v49) & 1) != 0)
                    goto LABEL_69;
LABEL_62:
                  if (v49)
                    v56 = v49;
                  else
                    v56 = v48;
                  v57 = v56;
                  objc_msgSend(v14, "objectForKeyedSubscript:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = v58;
                  if (v58)
                  {
                    objc_msgSend(v58, "ef_addObjectIfAbsent:", v38);
                  }
                  else
                  {
                    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v38, 0);
                    objc_msgSend(v14, "setObject:forKeyedSubscript:", v59, v57);
                  }

                  goto LABEL_69;
                }
                objc_msgSend(v49, "simpleAddress");
                v51 = objc_claimAutoreleasedReturnValue();
                v52 = (void *)v51;
                if (v51)
                  v53 = (void *)v51;
                else
                  v53 = v48;
                v54 = v53;

                v55 = objc_msgSend(v80, "containsObject:", v54);
                if ((v55 & 1) == 0)
                  goto LABEL_62;
LABEL_69:

              }
              v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
            }
            while (v45);
          }

        }
        else
        {
          v40 = v37;
          objc_msgSend(v40, "emailAddressValue");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v41)
          {
            v77 = v41;
          }
          else
          {
            objc_msgSend(v40, "stringValue");
            v77 = (id)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v67, "addObject:", v77);
        }

      }
      v74 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
    }
    while (v74);
  }

  v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __105__EDSenderPersistence__addressesGroupedByContactForAddresses_unmatchedAddresses_otherAddressesByContact___block_invoke_120;
  v82[3] = &unk_1E94A1938;
  v61 = v71;
  v83 = v61;
  v62 = v60;
  v84 = v62;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v82);
  if (a4)
    *a4 = objc_retainAutorelease(v67);
  if (a5)
    *a5 = objc_retainAutorelease(v62);

  return v68;
}

uint64_t __105__EDSenderPersistence__addressesGroupedByContactForAddresses_unmatchedAddresses_otherAddressesByContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simpleAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v5, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v5, "stringValue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v10, "compare:", v15);
  return v16;
}

void __105__EDSenderPersistence__addressesGroupedByContactForAddresses_unmatchedAddresses_otherAddressesByContact___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v11, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x1E0C97200], "em_bestMatchForName:fromContacts:keysToCheck:", v7, v5, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "ef_addObjectIfAbsent:", v11);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
    }

  }
}

- (id)_addressIDsGroupedByContactsForAddressesByContact:(id)a3 withConnection:(id)a4 addressesByID:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EFC0], "allColumns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithResult:table:", v11, CFSTR("addresses"));

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke;
  v18[3] = &unk_1E94A1960;
  v19 = v12;
  v13 = v8;
  v20 = v13;
  v14 = v9;
  v21 = v14;
  v15 = v12;
  objc_msgSend(v7, "ef_mapValues:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v16;
}

id __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t i;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id obj;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v22;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "emailAddressValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "simpleAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9)
        {
          objc_msgSend(v6, "stringValue");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v2;
        }
        objc_msgSend(v7, "equalTo:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)

        objc_msgSend(v6, "emailAddressValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("comment"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "equalTo:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_alloc(MEMORY[0x1E0D1EF90]);
          v33[0] = v11;
          v33[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithExpressions:", v17);
          objc_msgSend(*(id *)(a1 + 32), "setWhere:", v18);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "setWhere:", v11);
        }
        v20 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(a1 + 40);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke_2;
        v26[3] = &unk_1E949C8B8;
        v26[4] = v6;
        v27 = v25;
        v28 = *(id *)(a1 + 48);
        objc_msgSend(v19, "executeSelectStatement:withBlock:error:", v20, v26, 0);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

  return v25;
}

void __102__EDSenderPersistence__addressIDsGroupedByContactsForAddressesByContact_withConnection_addressesByID___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D1E6C0]);
  objc_msgSend(a1[4], "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "setDisplayName:", v6);
  objc_msgSend(a1[5], "addObject:", v4);
  v10 = objc_alloc(MEMORY[0x1E0D1E6B8]);
  objc_msgSend(v9, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v12, v4);
}

- (void)_persistenceDidAddMessages:(id)a3
{
  id v4;

  objc_msgSend(a3, "ef_filter:", &__block_literal_global_128_0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[EDSenderPersistence _moveAddressesFromSentMessagesToPrimaryForMessages:](self, "_moveAddressesFromSentMessagesToPrimaryForMessages:", v4);

}

BOOL __50__EDSenderPersistence__persistenceDidAddMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 4;

  return v3;
}

- (void)_moveAddressesFromSentMessagesToPrimaryForMessages:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  EDSenderPersistence *v9;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

void __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "to");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        objc_msgSend(v7, "cc");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v9);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v4);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke_2;
  v15[3] = &unk_1E94A1988;
  v15[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "ef_filter:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    EDSenderLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v12;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Updating %ld addresses based on sent messages .", buf, 0xCu);
    }

    v13 = *(void **)(a1 + 40);
    objc_msgSend(v10, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "moveSenderWithEmailAddresses:toBucket:", v14, 200);

  }
}

BOOL __74__EDSenderPersistence__moveAddressesFromSentMessagesToPrimaryForMessages___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "bucketForSenderAddress:bucket:", a2, &v3);
  return v3 == 0;
}

- (unint64_t)handleReconciliationMergeErrorForTable:(id)a3 columnName:(id)a4 statement:(id)a5 journalRowID:(id)a6 protectedRowID:(id)a7 connection:(id)a8 rowsUpdated:(unint64_t *)a9 error:(id *)a10
{
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  unint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  __CFString *v69;
  id v70;
  id v71;
  id v72;
  uint8_t v73[16];
  id v74;
  _QWORD v75[5];
  id v76;
  id v77;
  _QWORD v78[6];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  _QWORD v84[7];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  const __CFString *v93;
  void *v94;
  _BYTE v95[24];
  uint64_t v96;
  _QWORD v97[2];
  _BYTE v98[24];
  uint64_t v99;
  _BYTE buf[24];
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a3;
  v15 = (__CFString *)a4;
  v71 = a6;
  v70 = a7;
  v72 = a8;
  v68 = v14;
  v69 = v15;
  if (v14 == CFSTR("sender_addresses") && v15 == CFSTR("address"))
  {
    EDSenderLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = CFSTR("sender_addresses");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("address");
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Handling merge conflict for %{public}@.%{public}@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v17 = *MEMORY[0x1E0D1DC08];
    v101 = *MEMORY[0x1E0D1DC08];
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x2020000000;
    v88 = 0;
    v18 = objc_alloc(MEMORY[0x1E0D1F040]);
    v19 = *MEMORY[0x1E0D1EE00];
    v20 = (void *)objc_msgSend(v18, "initWithResultColumn:table:", *MEMORY[0x1E0D1EE00], CFSTR("senders"));
    objc_msgSend(v20, "addResultColumn:", CFSTR("bucket"));
    objc_msgSend(v20, "addResultColumn:", CFSTR("user_initiated"));
    v21 = (id)objc_msgSend(v20, "join:sourceColumn:targetColumn:", CFSTR("sender_addresses"), v19, CFSTR("sender"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("sender_addresses"), CFSTR("address"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "equalTo:", v71);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWhere:", v23);

    v83 = 0;
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke;
    v84[3] = &unk_1E94A19B0;
    v84[4] = buf;
    v84[5] = &v89;
    v84[6] = &v85;
    objc_msgSend(v72, "executeSelectStatement:withBlock:error:", v20, v84, &v83);
    v24 = v83;
    EDSenderLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      v27 = v90[3];
      *(_DWORD *)v98 = 134218240;
      *(_QWORD *)&v98[4] = v26;
      *(_WORD *)&v98[12] = 2048;
      *(_QWORD *)&v98[14] = v27;
      _os_log_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEFAULT, "Merge Conflict:Duplicate Sender: %ld : bucket %ld", v98, 0x16u);
    }

    *(_QWORD *)v98 = 0;
    *(_QWORD *)&v98[8] = v98;
    *(_QWORD *)&v98[16] = 0x2020000000;
    v99 = v17;
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", v19, CFSTR("senders"));
    objc_msgSend(v28, "addResultColumn:", CFSTR("bucket"));
    objc_msgSend(v28, "addResultColumn:", CFSTR("user_initiated"));
    v29 = (id)objc_msgSend(v28, "join:sourceColumn:targetColumn:", CFSTR("sender_addresses"), v19, CFSTR("sender"));
    objc_msgSend(MEMORY[0x1E0D1EFC0], "table:column:", CFSTR("sender_addresses"), CFSTR("address"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "equalTo:", v70);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWhere:", v31);

    v77 = v24;
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_130;
    v78[3] = &unk_1E94A04E8;
    v78[4] = v98;
    v78[5] = &v79;
    objc_msgSend(v72, "executeSelectStatement:withBlock:error:", v28, v78, &v77);
    v32 = v77;

    EDSenderLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *(_QWORD *)(*(_QWORD *)&v98[8] + 24);
      v35 = v80[3];
      *(_DWORD *)v95 = 134218240;
      *(_QWORD *)&v95[4] = v34;
      *(_WORD *)&v95[12] = 2048;
      *(_QWORD *)&v95[14] = v35;
      _os_log_impl(&dword_1D2F2C000, v33, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Existing Sender Sender %ld : Bucket %ld", v95, 0x16u);
    }

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) != v17 && *(_QWORD *)(*(_QWORD *)&v98[8] + 24) != v17)
    {
      v36 = v90[3];
      if (v36 && v36 != v80[3])
      {
        EDSenderLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = v90[3];
          *(_DWORD *)v95 = 134217984;
          *(_QWORD *)&v95[4] = v41;
          _os_log_impl(&dword_1D2F2C000, v40, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Updating sender bucket to %ld", v95, 0xCu);
        }

        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("senders"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v90[3]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("bucket"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v86 + 24));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, CFSTR("user_initiated"));

        objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v19);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)&v98[8] + 24));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "equalTo:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setWhereClause:", v47);

        v76 = v32;
        objc_msgSend(v72, "executeUpdateStatement:error:", v42, &v76);
        v37 = v76;

      }
      else
      {
        v37 = v32;
      }
      v48 = objc_alloc(MEMORY[0x1E0D1EF90]);
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "equalTo:", v71);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v49;
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("sender"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "equalTo:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v48, "initWithExpressions:", v53);

      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:where:", CFSTR("sender_addresses"), v67);
      objc_msgSend(v72, "executeDeleteStatement:error:", v54, 0);
      if (a9)
        *a9 = sqlite3_changes((sqlite3 *)objc_msgSend(v72, "sqlDB"));
      *(_QWORD *)v95 = 0;
      *(_QWORD *)&v95[8] = v95;
      *(_QWORD *)&v95[16] = 0x2020000000;
      v96 = 0;
      objc_msgSend(v72, "preparedStatementForQueryString:", CFSTR("SELECT count(*) AS associations FROM sender_addresses WHERE sender = :duplicate_sender"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR(":duplicate_sender");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v37;
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_136;
      v75[3] = &unk_1E949B090;
      v75[4] = v95;
      objc_msgSend(v66, "executeWithNamedBindings:usingBlock:error:", v56, v75, &v74);
      v32 = v74;

      if (!*(_QWORD *)(*(_QWORD *)&v95[8] + 24))
      {
        EDSenderLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v73 = 0;
          _os_log_impl(&dword_1D2F2C000, v57, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Deleting duplicate sender", v73, 2u);
        }

        v58 = objc_alloc(MEMORY[0x1E0D1EFE0]);
        objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", v19);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "equalTo:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v58, "initWithTable:where:", CFSTR("sender_addresses"), v61);

        objc_msgSend(v72, "executeDeleteStatement:error:", v62, 0);
      }

      _Block_object_dispose(v95, 8);
    }
    if (v32)
    {
      EDSenderLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v32, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSenderPersistence handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:].cold.1();
      }
      v39 = 2;
    }
    else
    {
      EDSenderLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v95 = 0;
        _os_log_impl(&dword_1D2F2C000, v63, OS_LOG_TYPE_DEFAULT, "Merge Conflict: Successfully resolved conflict", v95, 2u);
      }
      v39 = 0;
    }

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(v98, 8);

    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(buf, 8);
    if (a10 && v32)
    {
      v32 = objc_retainAutorelease(v32);
      *a10 = v32;
    }
  }
  else
  {
    EDSenderLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[EDSenderPersistence handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:].cold.2((uint64_t)v14, (uint64_t)v15, v38);

    v32 = 0;
    v39 = 2;
  }

  return v39;
}

void __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v3, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bucket"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v4, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("user_initiated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v5, "BOOLValue");

}

void __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_130(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EE00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bucket"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "integerValue");

}

void __140__EDSenderPersistence_handleReconciliationMergeErrorForTable_columnName_statement_journalRowID_protectedRowID_connection_rowsUpdated_error___block_invoke_136(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if (a3 == 2)
    -[EDSenderPersistence _updateSentToFilter](self, "_updateSentToFilter", 2, a4);
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (EFLazyCache)emailAddressToBucketCache
{
  return self->_emailAddressToBucketCache;
}

- (EFLazyCache)databaseIDToEmailAddressCache
{
  return self->_databaseIDToEmailAddressCache;
}

- (_EDSentToFilter)sentToAddressesFilter
{
  return self->_sentToAddressesFilter;
}

- (OS_dispatch_queue)sentToAddressesQueue
{
  return self->_sentToAddressesQueue;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_sentToAddressesQueue, 0);
  objc_storeStrong((id *)&self->_sentToAddressesFilter, 0);
  objc_storeStrong((id *)&self->_databaseIDToEmailAddressCache, 0);
  objc_storeStrong((id *)&self->_emailAddressToBucketCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __47__EDSenderPersistence_relevantSendersForSearch__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Error occurred when searching for relavant senders: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __68__EDSenderPersistence_moveSendersWithEmailAddresses_toCategoryType___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a2 + 32);
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Attempting to move sender with invalid email address %@ to category %lu", (uint8_t *)a3, a4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_moveSenderWithEmailAddresses:toBucket:sync:userInitiated:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to move addresses: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __116__EDSenderPersistence__moveSendersWithSimpleEmailAddresses_toCategoryType_sync_userInitiated_transactionGeneration___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_12_1(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "<nil> address for ID %llu (sender ID %llu)", v3, v4);
}

- (void)userHasSentToSenderAddress:.cold.1()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11_0();
  *v2 = 67109378;
  OUTLINED_FUNCTION_10_1(v3, (uint64_t)v2);
  OUTLINED_FUNCTION_8_2(&dword_1D2F2C000, v4, v5, "Returning 'sentTo' result %u from bloom filter for address: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)userHasSentToSenderAddress:.cold.2()
{
  void *v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11_0();
  *v2 = 67109378;
  v2[1] = 1;
  OUTLINED_FUNCTION_10_1(v3, (uint64_t)v2);
  OUTLINED_FUNCTION_8_2(&dword_1D2F2C000, v4, v5, "Returning 'sentTo' result %u from bloom filter for address: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)userHasSentToSenderAddress:.cold.3()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  int v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_11_0();
  *v2 = 67109378;
  OUTLINED_FUNCTION_10_1(v3, (uint64_t)v2);
  OUTLINED_FUNCTION_8_2(&dword_1D2F2C000, v4, v5, "Returning default 'sentTo' result %u for address: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_addNewSenderWithAddressIDs:(uint64_t)a3 contactIdentifier:toBucket:connection:senderDatabaseID:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Unable to find sender for contact identifier: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_newlyBlockedAddressesForBlockedAddressDatabaseIDs:connection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to determine newly blocked addresses, error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_newlyUnblockedAddressesForBlockedAddressDatabaseIDs:connection:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to determine newly unblocked addresses, error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to get contacts count: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_addressesGroupedByContactForAddresses:unmatchedAddresses:otherAddressesByContact:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Unable to get contact email addresses: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)handleReconciliationMergeErrorForTable:columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Merge Conflict: Error occured during merge: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)handleReconciliationMergeErrorForTable:(os_log_t)log columnName:statement:journalRowID:protectedRowID:connection:rowsUpdated:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Merge Conflict: Unsupported merge conflict for %{public}@.%{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
