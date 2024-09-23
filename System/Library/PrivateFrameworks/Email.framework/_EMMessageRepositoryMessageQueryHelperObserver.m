@implementation _EMMessageRepositoryMessageQueryHelperObserver

- (_EMMessageRepositoryMessageQueryHelperObserver)initWithThreadCollection:(id)a3 repository:(id)a4 observer:(id)a5 observationIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _EMMessageRepositoryMessageQueryHelperObserver *v14;
  _EMMessageRepositoryMessageQueryHelperObserver *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_EMMessageRepositoryMessageQueryHelperObserver;
  v14 = -[_EMMessageRepositoryMessageQueryHelperObserver init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_threadCollection, v10);
    objc_storeWeak((id *)&v15->_repository, v11);
    objc_storeWeak((id *)&v15->_resultsObserver, v12);
    objc_storeStrong((id *)&v15->_observationIdentifier, a6);
  }

  return v15;
}

- (void)_addMessagesToThreadCollection:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_repository);
  objc_msgSend(WeakRetained, "prepareRepositoryObjects:", v6);

  -[_EMMessageRepositoryMessageQueryHelperObserver setDidUseThreadCollection:](self, "setDidUseThreadCollection:", 1);
  v5 = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(v5, "messagesWereAdded:", v6);

}

- (void)queryHelperDidFindMessages:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  int v7;
  _EMMessageRepositoryMessageQueryHelperObserver *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Found %u messages.", (uint8_t *)&v7, 0x12u);
  }

  -[_EMMessageRepositoryMessageQueryHelperObserver _addMessagesToThreadCollection:](self, "_addMessagesToThreadCollection:", v4);
}

- (void)queryHelperDidFindAllMessages
{
  EMInMemoryThreadCollection **p_threadCollection;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _BYTE buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_threadCollection = &self->_threadCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%p: Finished initial load.", buf, 0xCu);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v6 = objc_loadWeakRetained((id *)p_threadCollection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79___EMMessageRepositoryMessageQueryHelperObserver_queryHelperDidFindAllMessages__block_invoke;
  v8[3] = &unk_1E70F1F78;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v6, "performBlockOnSchedulerIfNecessary:", v8);

  v7 = objc_loadWeakRetained((id *)p_threadCollection);
  objc_msgSend(v7, "initializeOldestThreadsByMailbox");

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)queryHelperDidAddMessages:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  int v7;
  _EMMessageRepositoryMessageQueryHelperObserver *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Added %u messages", (uint8_t *)&v7, 0x12u);
  }

  -[_EMMessageRepositoryMessageQueryHelperObserver _addMessagesToThreadCollection:](self, "_addMessagesToThreadCollection:", v4);
}

- (void)queryHelperMessageFlagsDidChangeForMessages:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  uint8_t buf[4];
  _EMMessageRepositoryMessageQueryHelperObserver *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = self;
    v13 = 1024;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v6, OS_LOG_TYPE_DEFAULT, "%p: Flags changed for %u messages", buf, 0x12u);
  }

  v7 = objc_loadWeakRetained((id *)&self->_repository);
  objc_msgSend(v7, "prepareRepositoryObjects:", v4);

  v8 = objc_loadWeakRetained((id *)&self->_threadCollection);
  v10[0] = CFSTR("flags");
  v10[1] = CFSTR("hasUnflagged");
  v10[2] = CFSTR("flagColors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messagesWereChanged:forKeyPaths:deleted:", v4, v9, 0);

}

- (void)queryHelperDidUpdateMessages:(id)a3 forKeyPaths:(id)a4
{
  id v6;
  id v7;
  EMInMemoryThreadCollection **p_threadCollection;
  id WeakRetained;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  _EMMessageRepositoryMessageQueryHelperObserver *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_threadCollection = &self->_threadCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218498;
    v14 = self;
    v15 = 2114;
    v16 = v7;
    v17 = 1024;
    v18 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "%p: Key paths %{public}@ changed for %u messages", (uint8_t *)&v13, 0x1Cu);
  }

  v11 = objc_loadWeakRetained((id *)&self->_repository);
  objc_msgSend(v11, "prepareRepositoryObjects:", v6);

  v12 = objc_loadWeakRetained((id *)p_threadCollection);
  objc_msgSend(v12, "messagesWereChanged:forKeyPaths:deleted:", v6, v7, 0);

}

- (void)queryHelperObjectIDDidChangeForMessage:(id)a3 oldObjectID:(id)a4 oldConversationID:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id WeakRetained;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  size_t v19;
  id v20;
  _QWORD __b[81];
  int v22[2];
  int v23;
  pid_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionItemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
    objc_msgSend(WeakRetained, "logClient");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "itemID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(__b[0]) = 134218754;
      *(_QWORD *)((char *)__b + 4) = self;
      WORD2(__b[1]) = 2112;
      *(_QWORD *)((char *)&__b[1] + 6) = v18;
      HIWORD(__b[2]) = 2112;
      __b[3] = v8;
      LOWORD(__b[4]) = 2112;
      *(_QWORD *)((char *)&__b[4] + 2) = v9;
      _os_log_debug_impl(&dword_1B99BB000, v14, OS_LOG_TYPE_DEBUG, "%p: itemID not changed %@\nchangedMessage %@\noldObjectID %@", (uint8_t *)__b, 0x2Au);

    }
    memset(__b, 170, sizeof(__b));
    LODWORD(__b[4]) = 0;
    *(_QWORD *)v22 = 0xE00000001;
    v23 = 1;
    v24 = getpid();
    v19 = 648;
    if (!sysctl(v22, 4u, __b, &v19, 0, 0) && (__b[4] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1B9A37ED0);
    }
  }
  else
  {
    v15 = objc_loadWeakRetained((id *)&self->_repository);
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareRepositoryObjects:", v16);

    v17 = objc_loadWeakRetained((id *)&self->_threadCollection);
    objc_msgSend(v17, "objectIDDidChangeForMessage:oldObjectID:oldConversationID:", v8, v9, a5);

  }
}

- (void)queryHelperDidDeleteMessages:(id)a3
{
  id v4;
  EMInMemoryThreadCollection **p_threadCollection;
  id WeakRetained;
  NSObject *v7;
  id v8;
  id v9;
  int v10;
  _EMMessageRepositoryMessageQueryHelperObserver *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_threadCollection = &self->_threadCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218240;
    v11 = self;
    v12 = 1024;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "%p: Deleted %u messages", (uint8_t *)&v10, 0x12u);
  }

  v8 = objc_loadWeakRetained((id *)&self->_repository);
  objc_msgSend(v8, "prepareRepositoryObjects:", v4);

  v9 = objc_loadWeakRetained((id *)p_threadCollection);
  objc_msgSend(v9, "messagesWereChanged:forKeyPaths:deleted:", v4, 0, 1);

}

- (void)queryHelperConversationIDDidChangeForMessages:(id)a3 fromConversationID:(int64_t)a4
{
  id v6;
  EMInMemoryThreadCollection **p_threadCollection;
  id WeakRetained;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  _EMMessageRepositoryMessageQueryHelperObserver *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_threadCollection = &self->_threadCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218496;
    v13 = self;
    v14 = 2048;
    v15 = a4;
    v16 = 1024;
    v17 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "%p: ConversationIDs changed from %lld for %u messages", (uint8_t *)&v12, 0x1Cu);
  }

  v10 = objc_loadWeakRetained((id *)&self->_repository);
  objc_msgSend(v10, "prepareRepositoryObjects:", v6);

  v11 = objc_loadWeakRetained((id *)p_threadCollection);
  objc_msgSend(v11, "conversationIDDidChangeForMessages:fromConversationID:", v6, a4);

}

- (void)queryHelperConversationNotificationLevelDidChangeForConversation:(int64_t)a3 conversationID:(int64_t)a4
{
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  v10 = WeakRetained;
  if (a4)
  {
    objc_msgSend(WeakRetained, "conversationNotificationLevelDidChangeForConversation:conversationID:", a3, a4);

  }
  else
  {
    objc_msgSend(WeakRetained, "logClient");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_EMMessageRepositoryMessageQueryHelperObserver queryHelperConversationNotificationLevelDidChangeForConversation:conversationID:].cold.1((uint64_t)self, v8, v9);

  }
}

- (void)queryHelperDidFinishRemoteSearch
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  _EMMessageRepositoryMessageQueryHelperObserver *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_threadCollection);
  objc_msgSend(WeakRetained, "logClient");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "%p: Helper did finish remote search.", (uint8_t *)&v7, 0xCu);
  }

  -[_EMMessageRepositoryMessageQueryHelperObserver resultsObserver](self, "resultsObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMMessageRepositoryMessageQueryHelperObserver observationIdentifier](self, "observationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observerDidFinishRemoteSearch:", v6);

}

- (EMInMemoryThreadCollection)threadCollection
{
  return (EMInMemoryThreadCollection *)objc_loadWeakRetained((id *)&self->_threadCollection);
}

- (EMMessageRepository)repository
{
  return (EMMessageRepository *)objc_loadWeakRetained((id *)&self->_repository);
}

- (void)setRepository:(id)a3
{
  objc_storeWeak((id *)&self->_repository, a3);
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  return (EMMessageListItemQueryResultsObserver *)objc_loadWeakRetained((id *)&self->_resultsObserver);
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (BOOL)didUseThreadCollection
{
  return self->_didUseThreadCollection;
}

- (void)setDidUseThreadCollection:(BOOL)a3
{
  self->_didUseThreadCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_destroyWeak((id *)&self->_resultsObserver);
  objc_destroyWeak((id *)&self->_repository);
  objc_destroyWeak((id *)&self->_threadCollection);
}

- (void)queryHelperConversationNotificationLevelDidChangeForConversation:(uint64_t)a3 conversationID:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = 0;
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, a2, a3, "%p: Received invalid converationID:%lld", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
