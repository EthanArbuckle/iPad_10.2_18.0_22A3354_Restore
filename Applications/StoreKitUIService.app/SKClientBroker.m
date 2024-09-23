@implementation SKClientBroker

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
  v2 = -[SKClientBroker init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 0x10000, 5));
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    subscriptionStatusListeners = v2->_subscriptionStatusListeners;
    v2->_subscriptionStatusListeners = (NSHashTable *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    transactionListeners = v2->_transactionListeners;
    v2->_transactionListeners = (NSHashTable *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    messageListeners = v2->_messageListeners;
    v2->_messageListeners = (NSHashTable *)v9;

    *(_QWORD *)&v2->_unfinishedTransactionsToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SKClientBroker _cancelNotifyTokenIfValid:](self, "_cancelNotifyTokenIfValid:", self->_unfinishedTransactionsToken);
  v3.receiver = self;
  v3.super_class = (Class)SKClientBroker;
  -[SKClientBroker dealloc](&v3, "dealloc");
}

+ (id)defaultBroker
{
  if (qword_1000632A0 != -1)
    dispatch_once(&qword_1000632A0, &stru_100048EE8);
  return (id)qword_100063298;
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

- (void)registerClient:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMapTable *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  _QWORD handler[5];

  v6 = a3;
  v7 = a4;
  v8 = self->_clients;
  objc_sync_enter(v8);
  -[NSMapTable setObject:forKey:](self->_clients, "setObject:forKey:", v6, v7);
  if (!notify_is_valid_token(self->_unfinishedTransactionsToken))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKClientBroker _unfinishedTransactionsNotificationName](self, "_unfinishedTransactionsNotificationName"));
    v10 = v9;
    if (v9)
    {
      v11 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v12 = &_dispatch_main_q;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100003FF4;
      handler[3] = &unk_100048F10;
      handler[4] = self;
      notify_register_dispatch(v11, &self->_unfinishedTransactionsToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000296B8((uint64_t)self);
    }

  }
  objc_sync_exit(v8);

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
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_messageListeners;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable objectEnumerator](self->_messageListeners, "objectEnumerator", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "pendingMessages:", v4);
        v9 = (char *)v9 + 1;
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "askToShowMessageWithReplyBlock:") & 1) != 0)
        {
          objc_msgSend(v10, "askToShowMessageWithReplyBlock:", v4);

          goto LABEL_11;
        }
      }
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "removedEntitlementsForProductIdentifiers:") & 1) != 0)
          objc_msgSend(v10, "removedEntitlementsForProductIdentifiers:", v4);
      }
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  NSHashTable *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *k;
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

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "updatedTransactions:") & 1) != 0)
          objc_msgSend(v10, "updatedTransactions:", v4);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
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
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j), "objectForKeyedSubscript:", off_100061D40));
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v11, "addObject:", v16);

      }
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
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable objectEnumerator](self->_transactionListeners, "objectEnumerator", 0));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)k), "receivedTransactions:", v11);
        }
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "removedTransactions:") & 1) != 0)
          objc_msgSend(v10, "removedTransactions:", v4);
      }
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "downloadAdded:") & 1) != 0)
          objc_msgSend(v10, "downloadAdded:", v4);
      }
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "downloadStatusChanged:") & 1) != 0)
          objc_msgSend(v10, "downloadStatusChanged:", v4);
      }
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
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "downloadRemoved:") & 1) != 0)
          objc_msgSend(v10, "downloadRemoved:", v4);
      }
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
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_subscriptionStatusListeners;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable objectEnumerator](self->_subscriptionStatusListeners, "objectEnumerator", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "receivedStatuses:", v4);
        v9 = (char *)v9 + 1;
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
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_transactionListeners;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable objectEnumerator](self->_transactionListeners, "objectEnumerator", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "receivedTransactions:", v4);
        v9 = (char *)v9 + 1;
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
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "handleAuthenticateRequest:resultHandler:") & 1) != 0)
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
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "handleDialogRequest:resultHandler:") & 1) != 0)
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
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_clients, "objectEnumerator", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "handleEngagementRequest:resultHandler:") & 1) != 0)
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

- (id)_unfinishedTransactionsNotificationName
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  if (v3)
  {
    v4 = sub_100008A04((uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_cancelNotifyTokenIfValid:(int)a3
{
  if (notify_is_valid_token(a3))
    notify_cancel(a3);
}

- (void)_handleUnfinishedTransactionsNotification
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000583C;
  v6[3] = &unk_100048F38;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeKitServiceWithErrorHandler:", v6));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005880;
  v5[3] = &unk_100048F60;
  v5[4] = self;
  objc_msgSend(v4, "checkServerQueueForClientIfNecessary:forceCheck:reply:", 0, 1, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListeners, 0);
  objc_storeStrong((id *)&self->_transactionListeners, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusListeners, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
