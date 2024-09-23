@implementation EDInteractionEventLogPersistence

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__EDInteractionEventLogPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_36 != -1)
    dispatch_once(&log_onceToken_36, block);
  return (OS_os_log *)(id)log_log_36;
}

void __39__EDInteractionEventLogPersistence_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_36;
  log_log_36 = (uint64_t)v1;

}

- (EDInteractionEventLogPersistence)initWithDatabase:(id)a3
{
  id v5;
  EDInteractionEventLogPersistence *v6;
  EDInteractionEventLogPersistence *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *writeQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDInteractionEventLogPersistence;
  v6 = -[EDInteractionEventLogPersistence init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.email.EDDatabaseInteractionEventLog.writeQueue", v9);
    writeQueue = v7->_writeQueue;
    v7->_writeQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a6;
  -[EDInteractionEventLogPersistence _partialEventForMessage:](self, "_partialEventForMessage:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v13);
  objc_msgSend(v12, "setDate:", v10);
  objc_msgSend(v12, "setData:", v11);
  -[EDInteractionEventLogPersistence _asyncPersistEvent:](self, "_asyncPersistEvent:", v12);

}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a6;
  -[EDInteractionEventLogPersistence _partialEventForMessage:](self, "_partialEventForMessage:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConversationID:", a5);
  objc_msgSend(v12, "setName:", v13);
  objc_msgSend(v12, "setDate:", v10);
  objc_msgSend(v12, "setData:", v11);
  -[EDInteractionEventLogPersistence _asyncPersistEvent:](self, "_asyncPersistEvent:", v12);

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[EDInteractionEventLogPersistence _partialEventForMessage:](self, "_partialEventForMessage:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v7);
  -[EDInteractionEventLogPersistence _asyncPersistEvent:](self, "_asyncPersistEvent:", v6);

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  -[EDInteractionEventLogPersistence _partialEventForMessage:](self, "_partialEventForMessage:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v11);
  if (v8)
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccountID:", v10);

  }
  -[EDInteractionEventLogPersistence _asyncPersistEvent:](self, "_asyncPersistEvent:", v9);

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[EDInteractionEventLogPersistence _partialEventForMessage:](self, "_partialEventForMessage:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", v10);
  objc_msgSend(v13, "setDate:", v11);
  v18 = CFSTR("mailbox_id");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "persistentID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "longLongValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setData:", v17);

  -[EDInteractionEventLogPersistence _asyncPersistEvent:](self, "_asyncPersistEvent:", v13);
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[EDInteractionEventLogPersistence _partialEventForMessage:](self, "_partialEventForMessage:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v10);
  objc_msgSend(v12, "setDate:", v11);
  v15 = CFSTR("mailbox_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setData:", v14);

  -[EDInteractionEventLogPersistence _asyncPersistEvent:](self, "_asyncPersistEvent:", v12);
}

- (id)_partialEventForMessage:(id)a3
{
  id v3;
  EDInteractionEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(EDInteractionEvent);
  -[EDInteractionEvent setVersion:](v4, "setVersion:", 15);
  objc_msgSend(v3, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionEvent setAccountID:](v4, "setAccountID:", v6);

  objc_msgSend(v3, "mailbox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionEvent setMailboxID:](v4, "setMailboxID:", objc_msgSend(v8, "longLongValue"));

  -[EDInteractionEvent setConversationID:](v4, "setConversationID:", objc_msgSend(v3, "conversationID"));
  objc_msgSend(v3, "messageIDHeaderHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionEvent setMessageIDHash:](v4, "setMessageIDHash:", objc_msgSend(v9, "int64Value"));

  objc_msgSend(v3, "persistentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDInteractionEvent setMessagePersistentID:](v4, "setMessagePersistentID:", objc_msgSend(v10, "longLongValue"));

  return v4;
}

- (void)_asyncPersistEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDate:", v6);

  }
  -[EDInteractionEventLogPersistence writeQueue](self, "writeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__EDInteractionEventLogPersistence__asyncPersistEvent___block_invoke;
  v9[3] = &unk_1E949B6D0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __55__EDInteractionEventLogPersistence__asyncPersistEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "persistEvent:", *(_QWORD *)(a1 + 40));
}

- (void)persistEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(void *, char *);
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
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[5];

  v4 = a3;
  if (persistEvent__onceToken != -1)
    dispatch_once(&persistEvent__onceToken, &__block_literal_global_22);
  -[EDInteractionEventLogPersistence database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyMapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&persistEvent__propertyMapper);

  if (v6 != WeakRetained)
  {
    objc_msgSend((id)persistEvent__nameCache, "removeAllObjects");
    -[EDInteractionEventLogPersistence database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyMapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&persistEvent__propertyMapper, v9);

  }
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_2;
  aBlock[3] = &unk_1E949C5C0;
  aBlock[4] = self;
  v11 = (void (**)(void *, char *))_Block_copy(aBlock);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("interaction_log"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_version);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(v4, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_date);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v16);

  objc_msgSend(v4, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_name);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v18);

  objc_msgSend(v4, "accountID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2](v11, sel_accountID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v21);

  if (!v19)
  if (objc_msgSend(v4, "mailboxID"))
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "mailboxID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_mailboxID);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v23);

  if (objc_msgSend(v4, "conversationID"))
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_conversationID);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v25);

  if (objc_msgSend(v4, "messageIDHash"))
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "messageIDHash"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_messageIDHash);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, v27);

  if (objc_msgSend(v4, "messagePersistentID"))
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "messagePersistentID"));
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, sel_messagePersistentID);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, v29);

  objc_msgSend(v4, "data");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    v32 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v4, "data");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dataWithJSONObject:options:error:", v33, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v11[2](v11, sel_data);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, v35);

  }
  -[EDInteractionEventLogPersistence database](self, "database");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDInteractionEventLogPersistence persistEvent:]");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_4;
  v39[3] = &unk_1E949B7F0;
  v38 = v12;
  v40 = v38;
  objc_msgSend(v36, "__performWriteWithCaller:usingBlock:", v37, v39);

}

void __49__EDInteractionEventLogPersistence_persistEvent___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D1EED8]);
  v1 = (void *)persistEvent__nameCache;
  persistEvent__nameCache = (uint64_t)v0;

}

id __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_2(uint64_t a1, SEL aSelector)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v4 = (void *)persistEvent__nameCache;
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_3;
  v8[3] = &unk_1E949C598;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = aSelector;
  objc_msgSend(v4, "objectForKey:generator:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyMapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columnNameForClass:property:", objc_opt_class(), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__EDInteractionEventLogPersistence_persistEvent___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executeInsertStatement:error:", *(_QWORD *)(a1 + 32), 0);
}

- (id)recentRecipients
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  v43 = 0;
  -[EDInteractionEventLogPersistence database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableForName:", CFSTR("recipients"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v28, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (!v5)
  {

    v6 = 0;
    v29 = 0;
    goto LABEL_17;
  }
  v29 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("address"));

      if (v11)
      {
        objc_msgSend(v9, "name");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v6 = (void *)v12;
      }
      else
      {
        objc_msgSend(v9, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("message"));

        if (!v15)
          continue;
        objc_msgSend(v9, "name");
        v16 = objc_claimAutoreleasedReturnValue();
        v13 = v29;
        v29 = (void *)v16;
      }

    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  }
  while (v5);

  if (!v29 || !v6)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDInteractionEventLogPersistence-BlackPearl.m"), 188, CFSTR("Could not find message and address columns in schema"));

  }
  -[EDInteractionEventLogPersistence database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EDInteractionEventLogPersistence recentRecipients]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke;
  v30[3] = &unk_1E949AF00;
  v20 = v29;
  v31 = v20;
  v21 = v6;
  v32 = v21;
  v33 = &v38;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v30);

  v22 = (void *)v39[5];
  if (v22)
  {
    v23 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select distinct AD.address from interaction_log LOG join mailboxes MB on MB.rowid = LOG.mailbox join messages MSG on MSG.message_id = LOG.message_id_hash join recipients RE on RE.%@ = MSG.rowID join addresses AD on AD.rowid = RE.%@ where MB.url like '%%/Sent%%' and LOG.name = 'message_fetched' and MSG.date_received >= ?"), a1[4], a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedStatementForQueryString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke_2;
  v15[3] = &unk_1E949AF78;
  v9 = v7;
  v16 = v9;
  v10 = objc_msgSend(v5, "executeWithIndexedBindings:usingBlock:error:", v8, v15, 0);

  if (objc_msgSend(v9, "count"))
  {
    v11 = objc_msgSend(v9, "copy");
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  return v10;
}

void __52__EDInteractionEventLogPersistence_recentRecipients__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddressValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_writeQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
