@implementation EMInMemoryThread

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__EMInMemoryThread_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_17 != -1)
    dispatch_once(&log_onceToken_17, block);
  return (OS_os_log *)(id)log_log_17;
}

void __23__EMInMemoryThread_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_17;
  log_log_17 = (uint64_t)v1;

}

- (EMInMemoryThread)initWithMessages:(id)a3 originatingQuery:(id)a4 threadScope:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMInMemoryThread *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *messages;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  EMThreadObjectID *v22;
  uint64_t v23;
  EMThread *thread;
  EMInMemoryThread *v25;
  objc_super v27;
  uint8_t buf[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)EMInMemoryThread;
  v11 = -[EMInMemoryThread init](&v27, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "ef_filter:", &__block_literal_global_17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    messages = v11->_messages;
    v11->_messages = (NSMutableArray *)v13;

    if (!-[NSMutableArray count](v11->_messages, "count"))
    {
      v25 = 0;
      goto LABEL_10;
    }
    objc_storeStrong((id *)&v11->_originatingQuery, a4);
    objc_storeStrong((id *)&v11->_threadScope, a5);
    v15 = v11->_messages;
    objc_msgSend((id)objc_opt_class(), "_dateSortDescriptors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](v15, "sortUsingDescriptors:", v16);

    -[EMInMemoryThread _recalculateDisplayMessage](v11, "_recalculateDisplayMessage");
    -[NSMutableArray firstObject](v11->_messages, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "conversationID");

    if (!v18)
    {
      +[EMInMemoryThread log](EMInMemoryThread, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[NSMutableArray firstObject](v11->_messages, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ef_publicDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:].cold.1(v21, buf, v19, v20);
      }

    }
    v22 = -[EMThreadObjectID initWithConversationID:threadScope:]([EMThreadObjectID alloc], "initWithConversationID:threadScope:", v18, v11->_threadScope);
    -[EMInMemoryThread _createThreadWithObjectID:](v11, "_createThreadWithObjectID:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    thread = v11->_thread;
    v11->_thread = (EMThread *)v23;

  }
  v25 = v11;
LABEL_10:

  return v25;
}

uint64_t __66__EMInMemoryThread_initWithMessages_originatingQuery_threadScope___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleted") ^ 1;

  return v3;
}

- (id)_createThreadWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EMThread *v7;
  void *v8;
  id v9;
  id v10;
  EMThread *v11;
  _QWORD v13[4];
  id v14;
  EMInMemoryThread *v15;
  id v16;

  v4 = a3;
  -[EMInMemoryThread displayMessage](self, "displayMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThread newestMessage](self, "newestMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [EMThread alloc];
  -[EMInMemoryThread originatingQuery](self, "originatingQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__EMInMemoryThread__createThreadWithObjectID___block_invoke;
  v13[3] = &unk_1E70F30C8;
  v9 = v6;
  v14 = v9;
  v15 = self;
  v10 = v5;
  v16 = v10;
  v11 = -[EMThread initWithObjectID:originatingQuery:builder:](v7, "initWithObjectID:originatingQuery:builder:", v4, v8, v13);

  return v11;
}

void __46__EMInMemoryThread__createThreadWithObjectID___block_invoke(id *a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(a1[4], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDate:", v3);

  objc_msgSend(a1[5], "_newestDisplayDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDisplayDate:", v4);

  objc_msgSend(a1[5], "_combinedReadLater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setReadLater:", v5);

  objc_msgSend(a1[6], "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSubject:", v6);

  objc_msgSend(a1[6], "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSummary:", v7);

  objc_msgSend(a1[5], "_combinedSenderList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSenderList:", v8);

  objc_msgSend(a1[5], "_combinedToList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setToList:", v9);

  objc_msgSend(a1[5], "_combinedCCList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCcList:", v10);

  objc_msgSend(a1[5], "_combinedFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFlags:", v11);

  objc_msgSend(v19, "setHasUnflagged:", objc_msgSend(a1[5], "_combinedHasUnflagged"));
  objc_msgSend(a1[5], "_combinedFlagColors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFlagColors:", v12);

  objc_msgSend(v19, "setIsVIP:", objc_msgSend(a1[5], "_combinedIsVIP"));
  objc_msgSend(v19, "setIsBlocked:", objc_msgSend(a1[5], "_combinedIsBlocked"));
  objc_msgSend(v19, "setUnsubscribeType:", objc_msgSend(a1[6], "unsubscribeType"));
  objc_msgSend(v19, "setHasAttachments:", objc_msgSend(a1[5], "_combinedHasAttachments"));
  objc_msgSend(v19, "setIsAuthenticated:", objc_msgSend(a1[6], "isAuthenticated"));
  objc_msgSend(v19, "setConversationNotificationLevel:", objc_msgSend(a1[6], "conversationNotificationLevel"));
  objc_msgSend(v19, "setCount:", objc_msgSend(*((id *)a1[5] + 1), "count"));
  objc_msgSend(a1[5], "_combinedMailboxes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMailboxes:", v13);

  objc_msgSend(a1[6], "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDisplayMessageItemID:", v14);

  objc_msgSend(a1[6], "followUp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFollowUp:", v15);

  objc_msgSend(a1[6], "brandIndicatorLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBrandIndicatorLocation:", v16);

  objc_msgSend(a1[4], "generatedSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGeneratedSummary:", v17);

  objc_msgSend(a1[6], "category");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCategory:", v18);

}

- (id)copyWithZone:(_NSZone *)a3
{
  EMInMemoryThread *v4;
  NSMutableArray *messages;
  void *v6;
  EMInMemoryThread *v7;

  v4 = [EMInMemoryThread alloc];
  messages = self->_messages;
  -[EMInMemoryThread originatingQuery](self, "originatingQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMInMemoryThread initWithMessages:originatingQuery:threadScope:](v4, "initWithMessages:originatingQuery:threadScope:", messages, v6, self->_threadScope);

  return v7;
}

- (EMMessageListItem)messageListItem
{
  -[EMInMemoryThread thread](self, "thread");
  return (EMMessageListItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)messages
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_messages, "copy");
}

- (EMMessage)newestMessage
{
  return (EMMessage *)-[NSMutableArray firstObject](self->_messages, "firstObject");
}

- (EMMessage)oldestMessage
{
  return (EMMessage *)-[NSMutableArray lastObject](self->_messages, "lastObject");
}

- (id)addMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "ef_filter:", &__block_literal_global_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMInMemoryThread _addMessagesToThread:](self, "_addMessagesToThread:", v5);
  -[EMInMemoryThread _recalculateDisplayMessage](self, "_recalculateDisplayMessage");
  -[EMInMemoryThread _calculateAndApplyChange](self, "_calculateAndApplyChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __32__EMInMemoryThread_addMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleted") ^ 1;

  return v3;
}

- (void)_addMessagesToThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_dateSortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  EFComparatorFromSortDescriptors();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        -[NSMutableArray ef_insertObjectIfAbsent:usingComparator:](self->_messages, "ef_insertObjectIfAbsent:usingComparator:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v6, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)changeMessages:(id)a3 forKeyPaths:(id)a4 threadIsEmpty:(BOOL *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  EMInMemoryThread *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = self;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "flags");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "deleted");

        if (v17)
          v18 = v9;
        else
          v18 = v10;
        objc_msgSend(v18, "addObject:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  +[EMMessageListItemChange changesForKeyPaths:ofItems:](EMMessageListItemChange, "changesForKeyPaths:ofItems:", v23, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThread _calculateChangesAfterRemovingMessages:applyingChanges:threadIsEmpty:](v22, "_calculateChangesAfterRemovingMessages:applyingChanges:threadIsEmpty:", v9, v19, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)removeMessages:(id)a3 threadIsEmpty:(BOOL *)a4
{
  -[EMInMemoryThread _calculateChangesAfterRemovingMessages:applyingChanges:threadIsEmpty:](self, "_calculateChangesAfterRemovingMessages:applyingChanges:threadIsEmpty:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateMessage:(id)a3 fromOldObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  EMMessageListItemChange *v12;
  void *v13;
  void *v14;
  EMMessageListItemChange *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  EMInMemoryThread *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  -[EMInMemoryThread thread](self, "thread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayMessageItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_alloc_init(EMMessageListItemChange);
    objc_msgSend(v6, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionItemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageListItemChange setDisplayMessageItemID:](v12, "setDisplayMessageItemID:", v14);

    v15 = v12;
  }
  else
  {
    v15 = 0;
  }
  -[EMInMemoryThread messages](self, "messages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__EMInMemoryThread_updateMessage_fromOldObjectID___block_invoke;
  v20[3] = &unk_1E70F30F0;
  v17 = v7;
  v21 = v17;
  v22 = self;
  v18 = v6;
  v23 = v18;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

  return v15;
}

void __50__EMInMemoryThread_updateMessage_fromOldObjectID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", a1[4]);

  if (v5)
  {
    v12 = 0;
    v6 = (void *)a1[5];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "removeMessages:threadIsEmpty:", v7, &v12);

    v9 = (void *)a1[5];
    v13 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "addMessages:", v10);

  }
}

- (id)_calculateChangesAfterRemovingMessages:(id)a3 applyingChanges:(id)a4 threadIsEmpty:(BOOL *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20 = v8;
  if (objc_msgSend(v8, "count"))
    -[NSMutableArray removeObjectsInArray:](self->_messages, "removeObjectsInArray:", v8);
  if (objc_msgSend(v9, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_messages;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "objectID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v16, "applyToMessageListItem:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

  }
  -[EMInMemoryThread _recalculateDisplayMessage](self, "_recalculateDisplayMessage");
  -[EMInMemoryThread _calculateAndApplyChange](self, "_calculateAndApplyChange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    -[EMInMemoryThread thread](self, "thread");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v18, "count") == 0;

  }
  return v17;
}

- (id)_calculateAndApplyChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[EMInMemoryThread thread](self, "thread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMInMemoryThread _createThreadWithObjectID:](self, "_createThreadWithObjectID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMInMemoryThread thread](self, "thread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMMessageListItemChange changeFrom:to:](EMMessageListItemChange, "changeFrom:to:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[EMInMemoryThread setThread:](self, "setThread:", v5);
    v8 = v7;
  }

  return v7;
}

+ (id)_dateSortDescriptors
{
  if (_dateSortDescriptors_onceToken != -1)
    dispatch_once(&_dateSortDescriptors_onceToken, &__block_literal_global_11);
  return (id)_dateSortDescriptors_sDateSortDescriptors;
}

void __40__EMInMemoryThread__dateSortDescriptors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  +[EMMessageListItemPredicates sortDescriptorForDateAscending:](EMMessageListItemPredicates, "sortDescriptorForDateAscending:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_dateSortDescriptors_sDateSortDescriptors;
  _dateSortDescriptors_sDateSortDescriptors = v1;

}

- (BOOL)_isSortedByDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_dateSortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  return v8;
}

- (id)_combinedReadLater
{
  NSMutableArray *v2;
  EMReadLater *v3;
  NSMutableArray *v4;
  uint64_t v5;
  EMReadLater *i;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_messages;
  v3 = (EMReadLater *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; i = (EMReadLater *)((char *)i + 1))
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "readLater", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (!v9)
        {
          if (!v4
            || (objc_msgSend(v7, "readLater"),
                v10 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v10, "date"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = -[NSMutableArray ef_isLaterThanDate:](v4, "ef_isLaterThanDate:", v11),
                v11,
                v10,
                v12))
          {
            objc_msgSend(v7, "readLater");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "date");
            v14 = objc_claimAutoreleasedReturnValue();

            v4 = (NSMutableArray *)v14;
          }
        }
      }
      v3 = (EMReadLater *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);

    if (!v4)
    {
      v3 = 0;
      return v3;
    }
    v3 = -[EMReadLater initWithDate:]([EMReadLater alloc], "initWithDate:", v4);
    v2 = v4;
  }

  return v3;
}

- (id)_combinedSenderList
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[EMInMemoryThread displayMessage](self, "displayMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_messages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (v10 != v4)
        {
          objc_msgSend(v10, "senderList", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_combinedToList
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_messages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "toList", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_combinedCCList
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_messages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "ccList", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_combinedFlags
{
  return +[EMMessage combinedFlagsForMessageListItems:](EMMessage, "combinedFlagsForMessageListItems:", self->_messages);
}

- (BOOL)_combinedHasUnflagged
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_messages;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasUnflagged", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_combinedFlagColors
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_combinedFlagColors_onceToken != -1)
    dispatch_once(&_combinedFlagColors_onceToken, &__block_literal_global_16);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_messages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "flagColors", (_QWORD)v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addIndexes:", v8);

      if ((objc_msgSend(v3, "containsIndexes:", _combinedFlagColors_sAllFlagColors) & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_5;
        break;
      }
    }
  }

  if (objc_msgSend(v3, "count"))
    v9 = v3;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

void __39__EMInMemoryThread__combinedFlagColors__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, 7);
  v1 = (void *)_combinedFlagColors_sAllFlagColors;
  _combinedFlagColors_sAllFlagColors = v0;

}

- (BOOL)_combinedIsVIP
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_messages;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isVIP", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_combinedIsBlocked
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_messages;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isBlocked", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_combinedHasAttachments
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_messages;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasAttachments", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_newestDisplayDate
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_messages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "displayDate", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "ef_isLaterThanDate:", v3);

        if (v10)
        {
          objc_msgSend(v8, "displayDate");
          v11 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)_combinedMailboxes
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_messages;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "mailboxes", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_recalculateDisplayMessage
{
  uint64_t v3;
  id v4;

  v3 = -[NSMutableArray indexOfObjectPassingTest:](self->_messages, "indexOfObjectPassingTest:", &__block_literal_global_21);
  if (v3)
  {
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray lastObject](self->_messages, "lastObject");
    else
      -[NSMutableArray objectAtIndexedSubscript:](self->_messages, "objectAtIndexedSubscript:", v3 - 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThread setDisplayMessage:](self, "setDisplayMessage:");
  }
  else
  {
    -[NSMutableArray firstObject](self->_messages, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EMInMemoryThread setDisplayMessage:](self, "setDisplayMessage:");
  }

}

uint64_t __46__EMInMemoryThread__recalculateDisplayMessage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "read");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMInMemoryThread thread](self, "thread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> conversationID:%lld"), v4, self, objc_msgSend(v5, "conversationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (EMThread)thread
{
  return self->_thread;
}

- (void)setThread:(id)a3
{
  objc_storeStrong((id *)&self->_thread, a3);
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EMQuery)originatingQuery
{
  return self->_originatingQuery;
}

- (EMMessage)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
  objc_storeStrong((id *)&self->_displayMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_originatingQuery, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (void)initWithMessages:(os_log_t)log originatingQuery:(void *)a4 threadScope:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Message %{public}@ had conversationID 0", buf, 0xCu);

}

@end
