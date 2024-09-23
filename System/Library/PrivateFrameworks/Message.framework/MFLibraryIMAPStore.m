@implementation MFLibraryIMAPStore

- (void)updateServerUnreadCountClosingConnection:(BOOL)a3
{
  if (self)
    self = (MFLibraryIMAPStore *)self->_taskManager;
  -[MFLibraryIMAPStore updateServerUnreadCountClosingConnection:](self, "updateServerUnreadCountClosingConnection:", a3);
}

- (void)setLibrary:(id)a3
{
  id v5;
  id v6;
  MFIMAPMailboxTaskManager *taskManager;
  void *v8;
  EFFuture *v9;
  EFFuture *serverMessagePersistenceFuture;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;
  objc_super v15;

  v5 = a3;
  -[MFLibraryStore library](self, "library");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)MFLibraryIMAPStore;
    -[MFLibraryStore setLibrary:](&v15, sel_setLibrary_, v5);
    if (self)
      taskManager = self->_taskManager;
    else
      taskManager = 0;
    -[MFIMAPMailboxTaskManager setLibrary:](taskManager, "setLibrary:", v5);
    if (v5)
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0D1EEC0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __33__MFLibraryIMAPStore_setLibrary___block_invoke;
      v11[3] = &unk_1E4E89580;
      objc_copyWeak(v13, &location);
      v13[1] = (id)a2;
      v12 = v5;
      objc_msgSend(v8, "lazyFutureWithBlock:", v11);
      v9 = (EFFuture *)objc_claimAutoreleasedReturnValue();
      serverMessagePersistenceFuture = self->_serverMessagePersistenceFuture;
      self->_serverMessagePersistenceFuture = v9;

      objc_destroyWeak(v13);
      objc_destroyWeak(&location);
    }
  }

}

- (BOOL)allowsAppend
{
  return (*(_BYTE *)&self->super._flags & 1) == 0;
}

- (MFLibraryIMAPStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4
{
  MFLegacyIMAPMailboxTaskManager *v4;
  void *v5;
  _BOOL8 v6;
  id v8;
  MFLibraryIMAPStore *v9;
  void *v10;
  void *v11;
  MFSwiftIMAPMailboxTaskManager *v12;
  MFLegacyIMAPMailboxTaskManager *v13;
  objc_super v15;

  v6 = a4;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFLibraryIMAPStore;
  v9 = -[MFLibraryStore initWithMailbox:readOnly:](&v15, sel_initWithMailbox_readOnly_, v8, v6);
  if (v9)
  {
    objc_msgSend(v8, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "taskManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = [MFSwiftIMAPMailboxTaskManager alloc];
      objc_msgSend(v8, "account");
      v4 = (MFLegacyIMAPMailboxTaskManager *)objc_claimAutoreleasedReturnValue();
      -[MFLegacyIMAPMailboxTaskManager taskManager](v4, "taskManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MFSwiftIMAPMailboxTaskManager initWithMailbox:taskManager:](v12, "initWithMailbox:taskManager:", v8, v5);
    }
    else
    {
      v13 = -[MFLegacyIMAPMailboxTaskManager initWithMailbox:]([MFLegacyIMAPMailboxTaskManager alloc], "initWithMailbox:", v8);
    }
    objc_storeStrong((id *)&v9->_taskManager, v13);
    if (v11)
    {

      v13 = v4;
    }

  }
  return v9;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  id v8;
  MFIMAPMailboxTaskManager *taskManager;
  int64_t v10;

  v8 = a4;
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  v10 = -[MFIMAPMailboxTaskManager fetchNumMessages:preservingUID:options:](taskManager, "fetchNumMessages:preservingUID:options:", a3, v8, a5);

  return v10;
}

+ (id)log
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MFLibraryIMAPStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (id)log_log_2;
}

void __25__MFLibraryIMAPStore_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

- (id)mailboxPersistence
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "library");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "persistence");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mailboxPersistence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)mailboxRowID
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "mailbox");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mailboxRowID");

  return v2;
}

- (void)close
{
  void *v4;
  MFIMAPMailboxTaskManager *taskManager;
  id v6;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[NSInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", a2, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInvocation:", v4);

  }
  else
  {
    if (self)
      taskManager = self->_taskManager;
    else
      taskManager = 0;
    -[MFIMAPMailboxTaskManager close](taskManager, "close");
  }
}

id __33__MFLibraryIMAPStore_setLibrary___block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
    *a2 = 0;
  objc_msgSend(WeakRetained, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store %@ has no mailboxURL"), v5);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    qword_1EE7AB6A8 = objc_msgSend(v8, "UTF8String");
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), v5, CFSTR("LibraryIMAPStore.m"), 100, CFSTR("We have a library IMAP store without a mailboxURL"));

  }
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverMessagePersistenceFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailbox");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverMessagePersistenceForMailboxURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setAllowsAppend:(BOOL)a3
{
  self->super._flags = ($835FD4CD3CFECF79DE90309A635A882F)(*(_DWORD *)&self->super._flags & 0xFFFFFFFE | !a3);
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 1;
}

- (BOOL)canCompact
{
  void *v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFLibraryIMAPStore;
  if (-[MFLibraryStore canCompact](&v6, sel_canCompact) && self->super._state == 3)
  {
    -[MFLibraryStore account](self, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isOffline") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canFetchMessageIDs
{
  if (self)
    self = (MFLibraryIMAPStore *)self->_taskManager;
  return -[MFLibraryIMAPStore canFetchMessageIDs](self, "canFetchMessageIDs");
}

- (BOOL)canFetchSearchResults
{
  return 1;
}

- (unint64_t)growFetchWindow
{
  MFLibraryIMAPStore *v2;
  objc_super v4;

  v2 = self;
  if (self)
    self = (MFLibraryIMAPStore *)self->_taskManager;
  -[MFLibraryIMAPStore growFetchWindow](self, "growFetchWindow");
  v4.receiver = v2;
  v4.super_class = (Class)MFLibraryIMAPStore;
  return -[MFLibraryStore growFetchWindow](&v4, sel_growFetchWindow);
}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  id v6;
  MFIMAPMailboxTaskManager *taskManager;
  int64_t v8;

  v6 = a3;
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  v8 = -[MFIMAPMailboxTaskManager fetchMessagesWithMessageIDs:andSetFlags:](taskManager, "fetchMessagesWithMessageIDs:andSetFlags:", v6, a4);

  return v8;
}

- (id)messageIdRollCall:(id)a3
{
  id v4;
  MFIMAPMailboxTaskManager *taskManager;
  void *v6;

  v4 = a3;
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  -[MFIMAPMailboxTaskManager messageIdRollCall:](taskManager, "messageIdRollCall:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_serverMessageIndexer
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "library");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "persistence");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serverMessagesIndexer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v8;
  MFServerMessagesIndexQuery *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MFIMAPMailboxTaskManager *v18;
  char v19;
  char v20;
  MFServerMessagesIndexQuery *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  MFIMAPMailboxTaskManager *taskManager;
  MFIMAPMailboxTaskManager *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  MFIMAPMailboxTaskManager *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  MFServerMessagesIndexQuery *v51;
  _QWORD v52[5];
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD v56[5];
  _QWORD v57[4];
  id v58;
  id v59;
  uint8_t buf[4];
  MFServerMessagesIndexQuery *v61;
  __int16 v62;
  MFLibraryIMAPStore *v63;
  _QWORD v64[4];

  v7 = a7;
  v8 = *(_QWORD *)&a5;
  v64[1] = *MEMORY[0x1E0C80C00];
  v11 = (MFServerMessagesIndexQuery *)a3;
  v12 = a4;
  -[MFLibraryStore mailbox](self, "mailbox");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MFLibraryStore mailbox](self, "mailbox");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v7)
      {
        -[MFLibraryIMAPStore _serverMessageIndexer](self);
        v18 = (MFIMAPMailboxTaskManager *)objc_claimAutoreleasedReturnValue();
        v19 = _os_feature_enabled_impl();
        if (v18)
          v20 = v19;
        else
          v20 = 0;
        if ((v20 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = [MFServerMessagesIndexQuery alloc];
          -[MFServerMessagesIndexQuery suggestion](v11, "suggestion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[MFServerMessagesIndexQuery initWithSuggestion:accountID:mailboxes:limit:](v21, "initWithSuggestion:accountID:mailboxes:limit:", v22, v17, v23, v8);

          +[MFLibraryIMAPStore log]();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v61 = v51;
            v62 = 2112;
            v63 = self;
            _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "Performing ServerMessageIndexer search for %@ in store: %@", buf, 0x16u);
          }

          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke;
          v57[3] = &unk_1E4E895A8;
          v25 = v50;
          v58 = v25;
          v59 = v14;
          -[MFIMAPMailboxTaskManager performSearchQuery:completion:](v18, "performSearchQuery:completion:", v51, v57);
          objc_msgSend(v25, "future");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "result:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            if (self)
              taskManager = self->_taskManager;
            else
              taskManager = 0;
            v29 = taskManager;
            -[MFIMAPMailboxTaskManager downloadSearchResults:](v29, "downloadSearchResults:", v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_36;
            v56[3] = &unk_1E4E895D0;
            v56[4] = self;
            objc_msgSend(v30, "map:", v56);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            +[MFLibraryIMAPStore log]();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4F90000, v47, OS_LOG_TYPE_DEFAULT, "No results from local index of server messages", buf, 2u);
            }

            v48 = (void *)MEMORY[0x1E0D1EEC0];
            v29 = (MFIMAPMailboxTaskManager *)objc_opt_new();
            objc_msgSend(v48, "futureWithResult:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v45 = (void *)MEMORY[0x1E0D1EEC0];
          v46 = (void *)objc_opt_new();
          objc_msgSend(v45, "futureWithResult:", v46);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_34;
      }
      if (!objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 18))
      {
        +[MFLibraryIMAPStore log]();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v61 = v11;
          v62 = 2112;
          v63 = self;
          _os_log_impl(&dword_1A4F90000, v40, OS_LOG_TYPE_DEFAULT, "Performing remote server search for %@ in store: %@", buf, 0x16u);
        }

        if (self)
          v41 = self->_taskManager;
        else
          v41 = 0;
        v18 = v41;
        -[MFIMAPMailboxTaskManager searchWithCriterion:limit:](v18, "searchWithCriterion:limit:", v12, v8);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = MEMORY[0x1E0C809B0];
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_39;
        v53[3] = &unk_1E4E89620;
        v53[4] = self;
        v54 = v14;
        v55 = v17;
        objc_msgSend(v42, "then:", v53);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v43;
        v52[1] = 3221225472;
        v52[2] = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_43;
        v52[3] = &unk_1E4E895D0;
        v52[4] = self;
        objc_msgSend(v44, "map:", v52);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
      +[MFLibraryIMAPStore log]();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v11;
        _os_log_impl(&dword_1A4F90000, v36, OS_LOG_TYPE_DEFAULT, "#search-manager: Skipping server-side search for search context: %@", buf, 0xCu);
      }
    }
    else
    {
      +[MFLibraryIMAPStore log]();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        -[MFLibraryStore mailbox](self, "mailbox");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ef_publicDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFLibraryIMAPStore storeSearchResultMatchingQuery:criterion:limit:offset:useLocalIndex:].cold.2(v38, (uint64_t)buf, v36, v37);
      }
    }

    v39 = (void *)MEMORY[0x1E0D1EEC0];
    v18 = (MFIMAPMailboxTaskManager *)objc_opt_new();
    objc_msgSend(v39, "futureWithResult:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

    goto LABEL_35;
  }
  +[MFLibraryIMAPStore log]();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    -[MFLibraryStore mailbox](self, "mailbox");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "ef_publicDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryIMAPStore storeSearchResultMatchingQuery:criterion:limit:offset:useLocalIndex:].cold.1(v34, (uint64_t)buf, v32, v33);
  }

  v35 = (void *)MEMORY[0x1E0D1EEC0];
  v17 = (void *)objc_opt_new();
  objc_msgSend(v35, "futureWithResult:", v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v31;
}

void __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFLibraryIMAPStore log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "Received %lu results from SearchIndexer.", (uint8_t *)&v8, 0xCu);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "finishWithResult:", v7);
  if (!v6)

}

id __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "uids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addRemoteIDs:mailbox:", v5, v6);

  return v4;
}

id __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v3 = a2;
  -[MFLibraryIMAPStore _serverMessageIndexer](*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _os_feature_enabled_impl();
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_opt_new();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_2;
    v16 = &unk_1E4E895F8;
    v17 = v3;
    v10 = v7;
    v18 = v10;
    objc_msgSend(v4, "excludeIndexedUIDsInMailbox:ofAccount:fromUIDs:completion:", v8, v9, v17, &v13);
    objc_msgSend(v10, "future", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFLibraryIMAPStore log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count") - objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "#search-manager: Filtered out %@ results using SearchIndexer", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v3);

}

id __90__MFLibraryIMAPStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "uids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addRemoteIDs:mailbox:", v5, v6);

  return v4;
}

- (void)doCompact
{
  if (self)
    self = (MFLibraryIMAPStore *)self->_taskManager;
  -[MFLibraryIMAPStore compact](self, "compact");
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  if (self)
    self = (MFLibraryIMAPStore *)self->_taskManager;
  -[MFLibraryIMAPStore deleteMessagesOlderThanNumberOfDays:compact:](self, "deleteMessagesOlderThanNumberOfDays:compact:", *(_QWORD *)&a3, a4);
}

- (id)_dataForMessage:(int)a3 readHeadersOnly:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ((objc_msgSend(v5, "hasTemporaryUid") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_10:
      a1 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v6, "messageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = v7;
    if (a3 && v7)
    {
      v9 = objc_msgSend(v7, "mf_rangeOfRFC822HeaderData");
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(a1, "mf_subdataWithRange:", v9, v8);
        v12 = objc_claimAutoreleasedReturnValue();

        a1 = (void *)v12;
        goto LABEL_11;
      }
      +[MFLibraryIMAPStore log]();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_INFO, "-[MFLibraryIMAPStore _dataForMessage:] bad message data", v13, 2u);
      }

      goto LABEL_10;
    }
  }
LABEL_11:

  return a1;
}

- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  MFIMAPMailboxTaskManager *taskManager;
  char v14;
  char v15;
  BOOL v17;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a6;
  v17 = 0;
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  v14 = -[MFIMAPMailboxTaskManager fetchDataForMimePart:range:isComplete:consumer:](taskManager, "fetchDataForMimePart:range:isComplete:consumer:", v11, location, length, &v17, v12);
  v15 = v14 ^ 1;
  if (!a5)
    v15 = 1;
  if ((v15 & 1) == 0)
    *a5 = v17;

  return v14;
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  MFIMAPMailboxTaskManager *taskManager;
  char v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EE809DF0) & 1) != 0)
  {
    if (self)
      taskManager = self->_taskManager;
    else
      taskManager = 0;
    v13 = -[MFIMAPMailboxTaskManager downloadMimePartNumber:message:withProgressBlock:](taskManager, "downloadMimePartNumber:message:withProgressBlock:", v8, v11, v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_fetchFullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 didDownload:(BOOL *)a6
{
  id v9;
  MFIMAPMailboxTaskManager *taskManager;
  MFIMAPMailboxTaskManager *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v9 = a3;
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  v11 = taskManager;
  -[MFIMAPMailboxTaskManager fetchDataForMessage:didDownload:](v11, "fetchDataForMessage:didDownload:", v9, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (v13 = objc_msgSend(v12, "mf_rangeOfRFC822HeaderData"),
        v15 = v14,
        v16 = v13 + v14,
        v13 + v14 <= (unint64_t)objc_msgSend(v12, "length")))
  {
    objc_msgSend(v12, "mf_subdataWithRange:", v13 + v15, objc_msgSend(v12, "length") - v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v17, 0, 0);
      v19 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v9, v18);
      if (a6)
        *a6 = 1;

    }
    if (a4)
    {
      objc_msgSend(v12, "mf_subdataWithRange:", v13, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  MFIMAPMailboxTaskManager *taskManager;
  MFIMAPMailboxTaskManager *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  objc_super v20;

  v7 = a5;
  v10 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordTransportType:", 1);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v20.receiver = self,
        v20.super_class = (Class)MFLibraryIMAPStore,
        -[MFLibraryStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:](&v20, sel__fetchBodyDataForMessage_andHeaderDataIfReadilyAvailable_downloadIfNecessary_partial_, v10, a4, v7, a6), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MFLibraryIMAPStore _dataForMessage:readHeadersOnly:](self, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 && v7)
    {
      if (self)
        taskManager = self->_taskManager;
      else
        taskManager = 0;
      v15 = taskManager;
      -[MFIMAPMailboxTaskManager fetchDataForMessage:partial:](v15, "fetchDataForMessage:partial:", v10, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v13)
    {
      v16 = objc_msgSend(v13, "mf_rangeOfRFC822HeaderData");
      v18 = v17;
      if (v17 > objc_msgSend(v13, "length"))
      {
        v12 = 0;
        if (!a4)
          goto LABEL_15;
        goto LABEL_14;
      }
      objc_msgSend(v13, "mf_subdataWithRange:", v16 + v18, objc_msgSend(v13, "length") - (v16 + v18));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
LABEL_14:
        objc_msgSend(v13, "mf_subdataWithRange:", v16, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_15:

  }
  return v12;
}

- (id)_fetchHeaderDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  MFIMAPMailboxTaskManager *taskManager;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v12.receiver = self,
        v12.super_class = (Class)MFLibraryIMAPStore,
        -[MFLibraryStore _fetchHeaderDataForMessage:downloadIfNecessary:](&v12, sel__fetchHeaderDataForMessage_downloadIfNecessary_, v6, v4), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "uid");
      -[MFLibraryIMAPStore _dataForMessage:readHeadersOnly:](self, v6, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v9;
      if (v4 && !v9 && v8)
      {
        if (self)
          taskManager = self->_taskManager;
        else
          taskManager = 0;
        -[MFIMAPMailboxTaskManager fetchHeadersForMessage:](taskManager, "fetchHeadersForMessage:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  MFIMAPMailboxTaskManager *taskManager;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MFLibraryIMAPStore;
  -[MFLibraryStore _handleFlagsChangedForMessages:flags:oldFlagsByMessage:](&v12, sel__handleFlagsChangedForMessages_flags_oldFlagsByMessage_, v8, v9, v10);
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  -[MFIMAPMailboxTaskManager handleFlagsChangedForMessages:flags:oldFlagsByMessage:](taskManager, "handleFlagsChangedForMessages:flags:oldFlagsByMessage:", v8, v9, v10);

}

- (id)messageForRemoteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MFLibraryStore library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWithRemoteID:inRemoteMailbox:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMessageStore:", self);
  return v8;
}

- (id)messagesWithRemoteIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFLibraryStore copyMessagesWithRemoteIDs:options:inMailbox:](self, "copyMessagesWithRemoteIDs:options:inMailbox:", v4, 7346239, v5);

  return v6;
}

- (id)flagsForRemoteIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MFLibraryStore library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flagsForRemoteIDs:inRemoteMailbox:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)copyRemoteIDForTemporaryUid:(unsigned int)a3
{
  void *v4;
  void *v5;

  if (copyRemoteIDForTemporaryUid__sRemoteIDHandlerPred != -1)
    dispatch_once(&copyRemoteIDForTemporaryUid__sRemoteIDHandlerPred, &__block_literal_global_10);
  __50__MFLibraryIMAPStore_copyRemoteIDForTemporaryUid___block_invoke_2(copyRemoteIDForTemporaryUid__sRemoteIDHandler, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __50__MFLibraryIMAPStore_copyRemoteIDForTemporaryUid___block_invoke()
{
  void *v0;

  v0 = (void *)copyRemoteIDForTemporaryUid__sRemoteIDHandler;
  copyRemoteIDForTemporaryUid__sRemoteIDHandler = (uint64_t)&__block_literal_global_62;

}

id __50__MFLibraryIMAPStore_copyRemoteIDForTemporaryUid___block_invoke_2(uint64_t a1, unsigned int a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("temp-%lu"), a2);
}

- (EDServerMessagePersistence)serverMessagePersistence
{
  return (EDServerMessagePersistence *)-[EFFuture result:](self->_serverMessagePersistenceFuture, "result:", 0);
}

- (unsigned)uidNext
{
  MFLibraryIMAPStore *v2;
  void *v3;

  v2 = self;
  -[MFLibraryIMAPStore mailboxPersistence](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "uidNextForMailbox:", -[MFLibraryIMAPStore mailboxRowID](v2));

  return v2;
}

- (void)setUidNext:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[MFLibraryIMAPStore mailboxPersistence](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUidNext:forMailbox:", v3, -[MFLibraryIMAPStore mailboxRowID](self));

}

- (unsigned)uidValidity
{
  MFLibraryIMAPStore *v2;
  void *v3;

  v2 = self;
  -[MFLibraryIMAPStore mailboxPersistence](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "uidValidityForMailbox:", -[MFLibraryIMAPStore mailboxRowID](v2));

  return v2;
}

- (void)setUidValidity:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[MFLibraryIMAPStore mailboxPersistence](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUidValidity:forMailbox:", v3, -[MFLibraryIMAPStore mailboxRowID](self));

}

- (id)replayAction:(id)a3
{
  id v4;
  MFIMAPMailboxTaskManager *taskManager;
  void *v6;

  v4 = a3;
  if (self)
    taskManager = self->_taskManager;
  else
    taskManager = 0;
  -[MFIMAPMailboxTaskManager replayAction:](taskManager, "replayAction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reselectMailbox
{
  if (self)
    self = (MFLibraryIMAPStore *)self->_taskManager;
  -[MFLibraryIMAPStore reselectMailbox](self, "reselectMailbox");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_serverMessagePersistenceFuture, 0);
}

- (void)storeSearchResultMatchingQuery:(NSObject *)a3 criterion:(void *)a4 limit:offset:useLocalIndex:.cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "No mailbox URL for mailbox: %{public}@", (uint8_t *)a2);

}

- (void)storeSearchResultMatchingQuery:(NSObject *)a3 criterion:(void *)a4 limit:offset:useLocalIndex:.cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "No account identifier for mailbox: %{public}@", (uint8_t *)a2);

}

@end
