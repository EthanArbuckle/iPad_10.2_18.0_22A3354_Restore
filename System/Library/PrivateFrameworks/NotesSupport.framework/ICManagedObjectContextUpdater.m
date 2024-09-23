@implementation ICManagedObjectContextUpdater

- (id)persistentStoreCoordinator
{
  void *v3;
  void *v4;
  void *v5;

  -[ICManagedObjectContextUpdater context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ICManagedObjectContextUpdater store](self, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentStoreCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)startListeningForRemoteContextDidChangeNotifications
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1DDAA5000, v1, OS_LOG_TYPE_DEBUG, "Starting to listen to %@ for %@", v2, 0x16u);
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setListening:(BOOL)a3
{
  self->_listening = a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[ICManagedObjectContextUpdater isListening](self, "isListening"))
    -[ICManagedObjectContextUpdater stopListeningForRemoteContextDidChangeNotifications](self, "stopListeningForRemoteContextDidChangeNotifications");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICManagedObjectContextUpdater;
  -[ICManagedObjectContextUpdater dealloc](&v4, sel_dealloc);
}

- (BOOL)isListening
{
  return self->_listening;
}

- (ICManagedObjectContextUpdater)initWithStore:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  ICManagedObjectContextUpdater *v8;
  ICManagedObjectContextUpdater *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  ICSelectorDelayer *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICManagedObjectContextUpdater;
  v8 = -[ICManagedObjectContextUpdater init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICManagedObjectContextUpdater setStore:](v8, "setStore:", v6);
    -[ICManagedObjectContextUpdater setContext:](v9, "setContext:", v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.notes.contextupdater", v10);
    -[ICManagedObjectContextUpdater setQueue:](v9, "setQueue:", v11);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICManagedObjectContextUpdater setPreviousHistoryDate:](v9, "setPreviousHistoryDate:", v12);

    v13 = -[ICSelectorDelayer initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:]([ICSelectorDelayer alloc], "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v9, sel_fetchChangeHistory, 0, 1, 0.1);
    -[ICManagedObjectContextUpdater setDelayer:](v9, "setDelayer:", v13);

  }
  return v9;
}

- (void)setStore:(id)a3
{
  objc_storeWeak((id *)&self->_store, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setPreviousHistoryDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousHistoryDate, a3);
}

- (void)setDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_delayer, a3);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousHistoryDate, 0);
  objc_storeStrong((id *)&self->_previousHistoryToken, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_store);
}

- (ICManagedObjectContextUpdater)init
{
  -[ICManagedObjectContextUpdater doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)stopListeningForRemoteContextDidChangeNotifications
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v2, v3, "Stopping listening to store changes for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

- (void)requestUpdate
{
  id v2;

  -[ICManagedObjectContextUpdater delayer](self, "delayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestFire");

}

- (void)handlePersistentStoreRemoteChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICManagedObjectContextUpdater *v9;

  v4 = a3;
  -[ICManagedObjectContextUpdater queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke;
  v7[3] = &unk_1EA823F20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v5 = (id *)(a1 + 40);
    objc_msgSend(v6, "persistentStoreCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if (v8)
    {
      objc_msgSend(*v5, "setNumberOfCoalescedNotifications:", objc_msgSend(*v5, "numberOfCoalescedNotifications") + 1);
      v9 = os_log_create("com.apple.notes", "PersistentHistory");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke_cold_1(v5);

      objc_msgSend(*v5, "delayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestFire");

    }
  }
}

- (void)fetchChangeHistory
{
  NSObject *v3;
  _QWORD block[5];

  -[ICManagedObjectContextUpdater queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  objc_class *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *context;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "PersistentHistory");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_2(a1, v2);

  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "setNumberOfCoalescedNotifications:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("UsePersistentHistoryTokens"));

  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_1(v3);

    v8 = (void *)MEMORY[0x1E0C97BD8];
    objc_msgSend(*v3, "previousHistoryToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchHistoryAfterToken:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C97BD8];
    objc_msgSend(*v3, "previousHistoryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchHistoryAfterDate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  objc_msgSend(v12, "setResultType:", 5);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__2;
  v54 = __Block_byref_object_dispose__2;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  v49 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(*v3, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistentStoreCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPersistentStoreCoordinator:", v15);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_20;
  v39[3] = &unk_1EA824680;
  v42 = &v44;
  v16 = v13;
  v40 = v16;
  v36 = v12;
  v41 = v36;
  v43 = &v50;
  objc_msgSend(v16, "performBlockAndWait:", v39);
  if (v51[5])
  {
    v17 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v3, "context");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v51[5];
      *(_DWORD *)buf = 138412802;
      v57 = v32;
      v58 = 2112;
      v59 = v33;
      v60 = 2112;
      v61 = v34;
      _os_log_error_impl(&dword_1DDAA5000, v17, OS_LOG_TYPE_ERROR, "Error executing %@ for %@: %@", buf, 0x20u);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    context = (void *)MEMORY[0x1DF0E07C8]();
    v18 = (id)v45[5];
    v19 = (void *)objc_opt_class();
    objc_msgSend(*v3, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transactionAuthor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = 0;
    objc_msgSend(v19, "contextSaveNotificationFromPersistentHistoryResult:ignoringContextName:fromTransactionAuthor:latestToken:latestTimestamp:", v18, v21, v23, &v38, &v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v38;
    v26 = v37;

    if (v25)
      objc_msgSend(*v3, "setPreviousHistoryToken:", v25, context);
    if (v26)
      objc_msgSend(*v3, "setPreviousHistoryDate:", v26);
    if (v24)
      objc_msgSend(*v3, "mergeWithDictionary:", v24);

    objc_autoreleasePoolPop(context);
  }
  else if (v45[5])
  {
    v27 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)objc_opt_class();
      v29 = (void *)v45[5];
      *(_DWORD *)buf = 138412546;
      v57 = v28;
      v58 = 2112;
      v59 = v29;
      v30 = v28;
      _os_log_impl(&dword_1DDAA5000, v27, OS_LOG_TYPE_INFO, "Result from persistent history request was an unknown type %@: %@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_20(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)mergeWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICManagedObjectContextUpdater *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ICManagedObjectContextUpdater context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ICManagedObjectContextUpdater_mergeWithDictionary___block_invoke;
  v8[3] = &unk_1EA823DD8;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

void __53__ICManagedObjectContextUpdater_mergeWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B88];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeChangesFromRemoteContextSave:intoContexts:", v3, v5);

  objc_msgSend(*(id *)(a1 + 40), "store");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 40), "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isReadOnly");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "ic_save");

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v15 = CFSTR("ICManagedObjectContextUpdaterChangeDictionaryKey");
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("ICManagedObjectContextUpdaterDidMergeNotification"), v13, v14);

}

+ (id)contextSaveNotificationFromPersistentHistoryResult:(id)a3 ignoringContextName:(id)a4 fromTransactionAuthor:(id)a5 latestToken:(id *)a6 latestTimestamp:(id *)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  id v63;
  id *v65;
  id *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  id obj;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[3];
  _QWORD v87[3];
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v69 = a4;
  v68 = a5;
  objc_msgSend(v11, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(a4) = objc_opt_isKindOfClass();

  if ((a4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    v67 = v11;
    objc_msgSend(v11, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[ICManagedObjectContextUpdater contextSaveNotificationFromPersistentHistoryResult:ignoringContextName:fromTransactionAuthor:latestToken:latestTimestamp:].cold.1(v16);
    v70 = (void *)v15;
    v71 = v13;
    v72 = v14;
    v65 = a6;
    v66 = a7;

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = v16;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v80 = 0;
      v21 = *(_QWORD *)v83;
      if (v69)
        v22 = v68 == 0;
      else
        v22 = 1;
      v23 = !v22;
      v78 = v23;
      v76 = *MEMORY[0x1E0C97870];
      v74 = *MEMORY[0x1E0C97A18];
      v75 = *MEMORY[0x1E0C97838];
      v24 = 0x1E0C97000uLL;
      v73 = *(_QWORD *)v83;
      do
      {
        v25 = 0;
        v77 = v19;
        do
        {
          if (*(_QWORD *)v83 != v21)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v25);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = (void *)MEMORY[0x1DF0E07C8]();
            v28 = v26;
            v29 = v28;
            if (!v20
              || (objc_msgSend(v28, "timestamp"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v30, "timeIntervalSinceReferenceDate"),
                  v32 = v31,
                  objc_msgSend(v20, "timeIntervalSinceReferenceDate"),
                  v34 = v33,
                  v30,
                  v32 > v34))
            {
              objc_msgSend(v29, "token", v65, v66);
              v35 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "timestamp");
              v36 = objc_claimAutoreleasedReturnValue();
              v37 = v20;
              v20 = (void *)v36;

              v80 = (void *)v35;
            }
            objc_msgSend(v29, "contextName", v65, v66);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "author");
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)v39;
            if (v38)
              v41 = v78;
            else
              v41 = 0;
            v42 = v41 != 1 || v39 == 0;
            if (v42
              || !objc_msgSend(v69, "isEqualToString:", v38)
              || (objc_msgSend(v68, "isEqualToString:", v40) & 1) == 0)
            {
              v81 = v27;
              v43 = v20;
              objc_msgSend(v29, "objectIDNotification");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "userInfo");
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v45, "objectForKeyedSubscript:", v76);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v46, "count"))
                -[NSObject unionSet:](v71, "unionSet:", v46);
              v47 = v24;
              objc_msgSend(v45, "objectForKeyedSubscript:", v75);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v48, "count"))
                -[NSObject unionSet:](v72, "unionSet:", v48);
              objc_msgSend(v45, "objectForKeyedSubscript:", v74);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
                objc_msgSend(v70, "unionSet:", v49);

              v20 = v43;
              v21 = v73;
              v19 = v77;
              v24 = v47;
              v27 = v81;
            }

            objc_autoreleasePoolPop(v27);
          }
          else
          {
            v50 = os_log_create("com.apple.notes", "PersistentHistory");
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v89 = v51;
              v90 = 2112;
              v91 = v26;
              v52 = v51;
              _os_log_impl(&dword_1DDAA5000, v50, OS_LOG_TYPE_DEFAULT, "Found unknown type %@ in persistent history sub-result array: %@", buf, 0x16u);

            }
          }
          ++v25;
        }
        while (v19 != v25);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
      v80 = 0;
    }
    v58 = v20;

    v61 = v71;
    v53 = v72;
    if (-[NSObject count](v71, "count") || -[NSObject count](v72, "count") || objc_msgSend(v70, "count"))
    {
      v62 = *MEMORY[0x1E0C97838];
      v86[0] = *MEMORY[0x1E0C97870];
      v86[1] = v62;
      v87[0] = v71;
      v87[1] = v72;
      v86[2] = *MEMORY[0x1E0C97A18];
      v87[2] = v70;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 3, v65, v66);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = 0;
    }
    a7 = v66;
    v11 = v67;
    a6 = v65;

    v59 = v80;
  }
  else
  {
    v53 = os_log_create("com.apple.notes", "PersistentHistory");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "result");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_opt_class();
      v56 = v55;
      objc_msgSend(v11, "result");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v89 = v55;
      v90 = 2112;
      v91 = v57;
      _os_log_impl(&dword_1DDAA5000, v53, OS_LOG_TYPE_DEFAULT, "Subresult in persistent history result was an unknown type %@: %@", buf, 0x16u);

    }
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = v53;
  }

  if (a6)
    *a6 = objc_retainAutorelease(v59);
  if (a7)
    *a7 = objc_retainAutorelease(v58);
  v63 = v60;

  return v63;
}

- (NSPersistentStore)store
{
  return (NSPersistentStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (NSPersistentHistoryToken)previousHistoryToken
{
  return self->_previousHistoryToken;
}

- (void)setPreviousHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_previousHistoryToken, a3);
}

- (NSDate)previousHistoryDate
{
  return self->_previousHistoryDate;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)numberOfCoalescedNotifications
{
  return self->_numberOfCoalescedNotifications;
}

- (void)setNumberOfCoalescedNotifications:(unint64_t)a3
{
  self->_numberOfCoalescedNotifications = a3;
}

- (ICSelectorDelayer)delayer
{
  return self->_delayer;
}

void __79__ICManagedObjectContextUpdater_handlePersistentStoreRemoteChangeNotification___block_invoke_cold_1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*a1, "numberOfCoalescedNotifications");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v1, v2, "Received distributed save notification. numberOfCoalescedNotifications=%ld", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "previousHistoryToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v2, v3, "Previous persistent history token: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_13();
}

void __51__ICManagedObjectContextUpdater_fetchChangeHistory__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*v3, "numberOfCoalescedNotifications");
  objc_msgSend(*v3, "previousHistoryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = 138412802;
  v9 = v4;
  v10 = 2048;
  v11 = v5;
  v12 = 2048;
  v13 = v7;
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Fetching change history for %@ with %ld coalesced notifications since date (%f)", (uint8_t *)&v8, 0x20u);

}

+ (void)contextSaveNotificationFromPersistentHistoryResult:(void *)a1 ignoringContextName:fromTransactionAuthor:latestToken:latestTimestamp:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v1, v2, "Received a persistent history result with %ld subresults", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

@end
