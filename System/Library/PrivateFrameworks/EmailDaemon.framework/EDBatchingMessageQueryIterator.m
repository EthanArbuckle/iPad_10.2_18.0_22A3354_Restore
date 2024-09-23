@implementation EDBatchingMessageQueryIterator

- (EDBatchingMessageQueryIterator)initWithMessagePersistence:(id)a3 query:(id)a4 batchSize:(int64_t)a5 firstBatchSize:(int64_t)a6 limit:(int64_t)a7 handler:(id)a8
{
  id v15;
  id v16;
  id v17;
  EDBatchingMessageQueryIterator *v18;
  EDBatchingMessageQueryIterator *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  EMMailboxScope *mailboxScope;
  EFCancelationToken *v25;
  EFCancelationToken *cancelationToken;
  NSMutableSet *v27;
  NSMutableSet *seenGlobalMessages;
  void *v29;
  id handler;
  int64_t v31;
  int64_t v32;
  void *v33;
  uint64_t v34;
  EFQueue *messageQueue;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v40.receiver = self;
  v40.super_class = (Class)EDBatchingMessageQueryIterator;
  v18 = -[EDBatchingMessageQueryIterator init](&v40, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messagePersistence, a3);
    v20 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v16, "predicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mailboxPersistence");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mailboxScopeForPredicate:withMailboxTypeResolver:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    mailboxScope = v19->_mailboxScope;
    v19->_mailboxScope = (EMMailboxScope *)v23;

    v25 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
    cancelationToken = v19->_cancelationToken;
    v19->_cancelationToken = v25;

    v19->_remaining = a7;
    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    seenGlobalMessages = v19->_seenGlobalMessages;
    v19->_seenGlobalMessages = v27;

    v29 = _Block_copy(v17);
    handler = v19->_handler;
    v19->_handler = v29;

    if (a5 >= a7)
      v31 = a7;
    else
      v31 = a5;
    v19->_batchSize = v31;
    if (a6 <= 0)
      v32 = a5;
    else
      v32 = a6;
    if (v32 < a7)
      a7 = v32;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v33 = (void *)MEMORY[0x1E0D1EF78];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __106__EDBatchingMessageQueryIterator_initWithMessagePersistence_query_batchSize_firstBatchSize_limit_handler___block_invoke;
    v37[3] = &unk_1E949B478;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v33, "bufferedQueueWithCapacity:batchHandler:", a7, v37);
    v34 = objc_claimAutoreleasedReturnValue();
    messageQueue = v19->_messageQueue;
    v19->_messageQueue = (EFQueue *)v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v19;
}

void __106__EDBatchingMessageQueryIterator_initWithMessagePersistence_query_batchSize_firstBatchSize_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processMessages:forceFlush:", v6, 0);
  if (!WeakRetained[9])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", WeakRetained[10]);
    v5 = (void *)WeakRetained[9];
    WeakRetained[9] = v4;

  }
}

- (void)_processMessages:(id)a3 forceFlush:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *batchedMessages;
  void (**handler)(id, NSMutableArray *, _QWORD);
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void (**v14)(id, void *, _QWORD);
  id v15;
  _QWORD v16[5];

  v15 = a3;
  -[EDBatchingMessageQueryIterator _deduplicateMessages:](self, "_deduplicateMessages:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_remaining && (unint64_t)objc_msgSend(v6, "count") > self->_remaining)
  {
    objc_msgSend(v7, "subarrayWithRange:", 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if ((-[EFCancelationToken isCanceled](self->_cancelationToken, "isCanceled") & 1) != 0)
  {
    v9 = v7;
  }
  else
  {
    if (objc_msgSend(v7, "count"))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__EDBatchingMessageQueryIterator__processMessages_forceFlush___block_invoke;
      v16[3] = &unk_1E949B4A0;
      v16[4] = self;
      objc_msgSend(v7, "ef_filter:", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      self->_remaining -= objc_msgSend(v9, "count");
      batchedMessages = self->_batchedMessages;
      if (batchedMessages)
      {
        -[NSMutableArray addObjectsFromArray:](batchedMessages, "addObjectsFromArray:", v9);
        if (a4 || -[NSMutableArray count](self->_batchedMessages, "count") >= self->_batchSize || self->_remaining <= 0)
        {
          handler = (void (**)(id, NSMutableArray *, _QWORD))self->_handler;
          if (handler)
            handler[2](handler, self->_batchedMessages, 0);
          -[NSMutableArray removeAllObjects](self->_batchedMessages, "removeAllObjects");
        }
      }
      else
      {
        v14 = (void (**)(id, void *, _QWORD))self->_handler;
        if (v14)
          v14[2](v14, v9, 0);
      }
    }
    else
    {
      v9 = v7;
      if (!v7)
      {
        v12 = (void (**)(id, _QWORD, void *))self->_handler;
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Couldn't get messages for persisted messages"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, 0, v13);

        }
        v9 = 0;
      }
    }
    if (self->_remaining <= 0)
      -[EDBatchingMessageQueryIterator cancel](self, "cancel");
  }

}

uint64_t __62__EDBatchingMessageQueryIterator__processMessages_forceFlush___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "globalMessageID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", v5);
  if ((v6 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v5);

  return v6 ^ 1u;
}

- (void)flush
{
  id handler;
  NSMutableArray *batchedMessages;
  void (**v5)(void);
  id v6;
  id v7;

  if (-[EFCancelationToken isCanceled](self->_cancelationToken, "isCanceled"))
  {
    handler = self->_handler;
    self->_handler = 0;
  }
  else
  {
    -[EFQueue drain](self->_messageQueue, "drain");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[EDBatchingMessageQueryIterator _processMessages:forceFlush:](self, "_processMessages:forceFlush:", v7, 1);
    }
    else
    {
      batchedMessages = self->_batchedMessages;
      if (batchedMessages)
      {
        v5 = (void (**)(void))self->_handler;
        if (v5)
        {
          v5[2]();
          batchedMessages = self->_batchedMessages;
        }
        -[NSMutableArray removeAllObjects](batchedMessages, "removeAllObjects");
      }
    }
    v6 = self->_handler;
    self->_handler = 0;

    handler = v7;
  }

}

- (void)addMessage:(id)a3 withDatabaseID:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[EFCancelationToken isCanceled](self->_cancelationToken, "isCanceled") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0D1EF38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairWithFirst:second:", v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EFQueue enqueue:](self->_messageQueue, "enqueue:", v8);
  }

}

- (id)_deduplicateMessages:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _EDCombinedMessageInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v3 = (void *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v19;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "second", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v11, "globalMessageID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v14 = objc_alloc_init(_EDCombinedMessageInfo);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v12);
          v13 = v14;
          objc_msgSend(v20, "addObject:", v14);
        }
        objc_msgSend(v8, "second");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "first");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addMessage:withDatabaseID:", v15, objc_msgSend(v16, "longLongValue"));

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  objc_msgSend(v20, "ef_compactMap:", &__block_literal_global_69);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __55__EDBatchingMessageQueryIterator__deduplicateMessages___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "deduplicatedMessage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldCancel
{
  return -[EFCancelationToken isCanceled](self->_cancelationToken, "isCanceled");
}

- (void)cancel
{
  id handler;

  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
  handler = self->_handler;
  self->_handler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchedMessages, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_seenGlobalMessages, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end
