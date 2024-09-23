@implementation SKClientBroker

void __31__SKClientBroker_defaultBroker__block_invoke()
{
  SKClientBroker *v0;
  void *v1;

  v0 = objc_alloc_init(SKClientBroker);
  v1 = (void *)defaultBroker_sharedClient;
  defaultBroker_sharedClient = (uint64_t)v0;

}

- (SKClientBroker)init
{
  SKClientBroker *v2;
  uint64_t v3;
  NSMapTable *clients;
  uint64_t v5;
  NSHashTable *subscriptionStatusListeners;
  uint64_t v7;
  NSHashTable *transactionListeners;
  uint64_t v9;
  NSHashTable *messageListeners;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKClientBroker;
  v2 = -[SKClientBroker init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0x10000, 5);
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    subscriptionStatusListeners = v2->_subscriptionStatusListeners;
    v2->_subscriptionStatusListeners = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    transactionListeners = v2->_transactionListeners;
    v2->_transactionListeners = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    messageListeners = v2->_messageListeners;
    v2->_messageListeners = (NSHashTable *)v9;

    *(_QWORD *)&v2->_unfinishedTransactionsToken = -1;
  }
  return v2;
}

+ (id)defaultBroker
{
  if (defaultBroker_onceToken != -1)
    dispatch_once(&defaultBroker_onceToken, &__block_literal_global);
  return (id)defaultBroker_sharedClient;
}

- (void)registerClient:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMapTable *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  _QWORD handler[5];

  v6 = a3;
  v7 = a4;
  v8 = self->_clients;
  objc_sync_enter(v8);
  -[NSMapTable setObject:forKey:](self->_clients, "setObject:forKey:", v6, v7);
  if (!notify_is_valid_token(self->_unfinishedTransactionsToken))
  {
    -[SKClientBroker _unfinishedTransactionsNotificationName](self, "_unfinishedTransactionsNotificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __48__SKClientBroker_registerClient_withIdentifier___block_invoke;
      handler[3] = &unk_1E5B266E0;
      handler[4] = self;
      notify_register_dispatch(v11, &self->_unfinishedTransactionsToken, v12, handler);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[SKClientBroker registerClient:withIdentifier:].cold.1((uint64_t)self);
    }

  }
  objc_sync_exit(v8);

}

- (id)_unfinishedTransactionsNotificationName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    SKDistributedNotificationUnfinishedTransactionsForBundleID((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)unregisterClientWithIdentifier:(id)a3
{
  NSMapTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_clients;
  objc_sync_enter(v4);
  -[NSMapTable removeObjectForKey:](self->_clients, "removeObjectForKey:", v5);
  if (!-[NSMapTable count](self->_clients, "count") && notify_is_valid_token(self->_unfinishedTransactionsToken))
  {
    notify_cancel(self->_unfinishedTransactionsToken);
    self->_unfinishedTransactionsToken = -1;
  }
  objc_sync_exit(v4);

}

- (void)dealloc
{
  objc_super v3;

  -[SKClientBroker _cancelNotifyTokenIfValid:](self, "_cancelNotifyTokenIfValid:", self->_unfinishedTransactionsToken);
  v3.receiver = self;
  v3.super_class = (Class)SKClientBroker;
  -[SKClientBroker dealloc](&v3, sel_dealloc);
}

- (BOOL)hasTransactionListener
{
  SKClientBroker *v2;
  NSHashTable *v3;

  v2 = self;
  v3 = self->_transactionListeners;
  objc_sync_enter(v3);
  LOBYTE(v2) = -[NSHashTable count](v2->_transactionListeners, "count") != 0;
  objc_sync_exit(v3);

  return (char)v2;
}

uint64_t __48__SKClientBroker_registerClient_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUnfinishedTransactionsNotification");
}

- (void)registerSubscriptionStatusListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_subscriptionStatusListeners;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_subscriptionStatusListeners, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterSubscriptionStatusListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_subscriptionStatusListeners;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_subscriptionStatusListeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)registerTransactionListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_transactionListeners;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_transactionListeners, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterTransactionListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_transactionListeners;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_transactionListeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)registerMessageListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_messageListeners;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_messageListeners, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterMessageListener:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_messageListeners;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_messageListeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)pendingMessages:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_messageListeners;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable objectEnumerator](self->_messageListeners, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "pendingMessages:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)askToShowMessageWithReplyBlock:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "askToShowMessageWithReplyBlock:", v4);

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  v4[2](v4, 0, 1);
LABEL_11:
  objc_sync_exit(v5);

}

- (void)hasAnyMessageListenersWithReply:(id)a3
{
  NSHashTable *v4;
  _BOOL8 v5;
  void (**v6)(id, _BOOL8);

  v6 = (void (**)(id, _BOOL8))a3;
  v4 = self->_messageListeners;
  objc_sync_enter(v4);
  v5 = -[NSHashTable count](self->_messageListeners, "count") != 0;
  objc_sync_exit(v4);

  v6[2](v6, v5);
}

- (void)removedEntitlementsForProductIdentifiers:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "removedEntitlementsForProductIdentifiers:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)updatedTransactions:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSHashTable *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "updatedTransactions:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "objectForKeyedSubscript:", SKServerKeyTransactionReceipt);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count"))
  {
    v17 = self->_transactionListeners;
    objc_sync_enter(v17);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSHashTable objectEnumerator](self->_transactionListeners, "objectEnumerator", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "receivedTransactions:", v11);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

    objc_sync_exit(v17);
  }

}

- (void)removedTransactions:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "removedTransactions:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadAdded:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "downloadAdded:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadStatusChanged:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "downloadStatusChanged:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)downloadRemoved:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "downloadRemoved:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)receivedStatuses:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_subscriptionStatusListeners;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable objectEnumerator](self->_subscriptionStatusListeners, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "receivedStatuses:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)receivedTransactions:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_transactionListeners;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable objectEnumerator](self->_transactionListeners, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "receivedTransactions:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "handleAuthenticateRequest:resultHandler:", v6, v7);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "handleDialogRequest:resultHandler:", v6, v7);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "handleEngagementRequest:resultHandler:", v6, v7);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_cancelNotifyTokenIfValid:(int)a3
{
  if (notify_is_valid_token(a3))
    notify_cancel(a3);
}

- (void)_handleUnfinishedTransactionsNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke;
  v7[3] = &unk_1E5B26708;
  v7[4] = self;
  objc_msgSend(v3, "storeKitServiceWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30;
  v6[3] = &unk_1E5B26730;
  v6[4] = self;
  objc_msgSend(v5, "checkServerQueueForClientIfNecessary:forceCheck:reply:", 0, 1, v6);

}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_cold_1();
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30_cold_1();
  }
  else if (objc_msgSend(v5, "count"))
  {
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    objc_sync_enter(v7);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectEnumerator", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "updatedTransactions:", v5);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListeners, 0);
  objc_storeStrong((id *)&self->_transactionListeners, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusListeners, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)registerClient:(uint64_t)a1 withIdentifier:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ Not registering for unfinished transaction notifications because no bundle ID was available", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy getting unfinished transactions: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __59__SKClientBroker__handleUnfinishedTransactionsNotification__block_invoke_30_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error getting unfinished transactions: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

@end
