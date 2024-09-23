@implementation CommunicationsFilterBlockListCache

- (CommunicationsFilterBlockListCache)init
{
  CommunicationsFilterBlockListCache *v2;
  CMFNotificationObserver *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  CMFNotificationObserver *blockListUpdateObserver;
  uint64_t v10;
  NSMutableArray *recentItems;
  _QWORD handler[4];
  CommunicationsFilterBlockListCache *v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CommunicationsFilterBlockListCache;
  v2 = -[CommunicationsFilterBlockListCache init](&v18, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [CMFNotificationObserver alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(CMFSyncAgentBlockListUpdated, "UTF8String"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC9B8];
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __42__CommunicationsFilterBlockListCache_init__block_invoke;
    v15[3] = &unk_24C0A7320;
    objc_copyWeak(&v16, &location);
    v8 = -[CMFNotificationObserver initWithName:queue:callback:](v3, "initWithName:queue:callback:", v4, v5, v15);
    blockListUpdateObserver = v2->_blockListUpdateObserver;
    v2->_blockListUpdateObserver = (CMFNotificationObserver *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    recentItems = v2->_recentItems;
    v2->_recentItems = (NSMutableArray *)v10;

    v2->_listIsEmpty = 0;
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __42__CommunicationsFilterBlockListCache_init__block_invoke_2;
    handler[3] = &unk_24C0A7348;
    v14 = v2;
    notify_register_dispatch("_CMFBlockListIsEmptyToken", &v2->_notifyEmptyListToken, MEMORY[0x24BDAC9B8], handler);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setResponse:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v6;
  CommunicationsFilterBlockListCache *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  CommunicationFilterItemCache *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  _BOOL4 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7->_recentItems;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "matchesItem:", v6, (_QWORD)v16) & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v12;

    if (!v13)
      goto LABEL_12;
    -[NSMutableArray removeObject:](v7->_recentItems, "removeObject:", v13);
    -[NSMutableArray insertObject:atIndex:](v7->_recentItems, "insertObject:atIndex:", v13, 0);
    objc_msgSend(v13, "setIsInList:", v4);
  }
  else
  {
LABEL_9:

LABEL_12:
    if ((unint64_t)-[NSMutableArray count](v7->_recentItems, "count", (_QWORD)v16) >= 0xA)
      -[NSMutableArray removeLastObject](v7->_recentItems, "removeLastObject");
    v14 = -[CommunicationFilterItemCache initWithFilterItem:isInList:]([CommunicationFilterItemCache alloc], "initWithFilterItem:isInList:", v6, -1);
    -[NSMutableArray insertObject:atIndex:](v7->_recentItems, "insertObject:atIndex:", v14, 0);

    v13 = 0;
  }
  CMFDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v21 = v4;
    _os_log_impl(&dword_20849D000, v15, OS_LOG_TYPE_DEFAULT, "cache setResponse = %d", buf, 8u);
  }

  objc_sync_exit(v7);
}

- (int64_t)cachedResponseForItem:(id)a3
{
  id v4;
  CommunicationsFilterBlockListCache *v5;
  NSObject *v6;
  int64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_listIsEmpty)
  {
    CMFDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20849D000, v6, OS_LOG_TYPE_DEFAULT, "Since _listIsEmpty return NO", buf, 2u);
    }
    v7 = 0;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5->_recentItems;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "matchesItem:", v4, (_QWORD)v14) & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v6 = v12;

      if (!v6)
        goto LABEL_16;
      v7 = -[NSObject isInList](v6, "isInList");
    }
    else
    {
LABEL_13:

      v6 = 0;
LABEL_16:
      v7 = -1;
    }
  }

  objc_sync_exit(v5);
  return v7;
}

void __42__CommunicationsFilterBlockListCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_blockListChanged");
    WeakRetained = v2;
  }

}

void __42__CommunicationsFilterBlockListCache_init__block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  CMFDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20849D000, v3, OS_LOG_TYPE_DEFAULT, "Notify empty token changed.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "syncListEmptyState");
  objc_sync_exit(v2);

}

- (void)removeItemFromCache:(id)a3
{
  id v4;
  CommunicationsFilterBlockListCache *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5->_recentItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "matchesItem:", v4) & 1) != 0)
        {
          v11 = v10;

          if (v11)
            -[NSMutableArray removeObject:](v5->_recentItems, "removeObject:", v11);
          goto LABEL_12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = 0;
LABEL_12:
  CMFDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_20849D000, v12, OS_LOG_TYPE_DEFAULT, (const char *)&unk_2084A1DC9, v13, 2u);
  }

  -[CommunicationsFilterBlockListCache syncListEmptyState](v5, "syncListEmptyState");
  objc_sync_exit(v5);

}

- (void)syncListEmptyState
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;
  uint64_t state64;

  state64 = self->_listIsEmpty;
  notify_get_state(self->_notifyEmptyListToken, &state64);
  v3 = state64;
  self->_listIsEmpty = state64 != 0;
  CMFDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 0;
      v6 = "Our list is empty.";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_20849D000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    v8 = 0;
    v6 = "Our list is not empty.";
    v7 = (uint8_t *)&v8;
    goto LABEL_6;
  }

}

- (void)_blockListChanged
{
  NSObject *v3;
  CommunicationsFilterBlockListCache *v4;
  void *v5;
  uint8_t v6[16];

  CMFDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20849D000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_2084A1DC9, v6, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[CommunicationsFilterBlockListCache syncListEmptyState](v4, "syncListEmptyState");
  -[NSMutableArray removeAllObjects](v4->_recentItems, "removeAllObjects");
  objc_sync_exit(v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("CMFBlockListUpdatedNotification"), 0);

}

- (CMFNotificationObserver)blockListUpdateObserver
{
  return self->_blockListUpdateObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockListUpdateObserver, 0);
  objc_storeStrong((id *)&self->_recentItems, 0);
}

@end
