@implementation QLNotificationCenter

- (QLNotificationCenter)init
{
  QLNotificationCenter *v2;
  uint64_t v3;
  NSMutableArray *bufferedNotifications;
  uint64_t v5;
  NSPointerArray *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLNotificationCenter;
  v2 = -[QLNotificationCenter init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    bufferedNotifications = v2->_bufferedNotifications;
    v2->_bufferedNotifications = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)_QLNotificationCenterSharedInstance;
  if (!_QLNotificationCenterSharedInstance)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__QLNotificationCenter_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken != -1)
      dispatch_once(&sharedInstance_onceToken, block);
    v2 = (void *)_QLNotificationCenterSharedInstance;
  }
  return v2;
}

void __38__QLNotificationCenter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_QLNotificationCenterSharedInstance;
  _QLNotificationCenterSharedInstance = (uint64_t)v1;

}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  QLNotificationCenter *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (!-[QLNotificationCenter _tryPostingNotificationName:userInfo:](v7, "_tryPostingNotificationName:userInfo:", v10, v6))
  {
    v8 = (void *)objc_msgSend(v10, "copy");
    v9 = (void *)objc_msgSend(v6, "copy");
    -[QLNotificationCenter _bufferNotificationName:userInfo:](v7, "_bufferNotificationName:userInfo:", v8, v9);

  }
  objc_sync_exit(v7);

}

- (BOOL)_tryPostingNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  QLNotificationCenter *v8;
  uint64_t v9;
  QLNotificationCenterProtocol *remoteNotificationCenter;
  NSPointerArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[NSPointerArray count](v8->_observers, "count");
  remoteNotificationCenter = v8->_remoteNotificationCenter;
  if (v9)
  {
    if (!remoteNotificationCenter)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = v8->_observers;
      v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "notification:userInfo:", v6, v7, (_QWORD)v17);
          }
          v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

      goto LABEL_13;
    }
  }
  else if (!remoteNotificationCenter)
  {
    v15 = 0;
    goto LABEL_14;
  }
  -[QLNotificationCenterProtocol postNotificationName:userInfo:](remoteNotificationCenter, "postNotificationName:userInfo:", v6, v7);
LABEL_13:
  v15 = 1;
LABEL_14:
  objc_sync_exit(v8);

  return v15;
}

- (void)_bufferNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  QLNotificationCenter *v8;
  NSMutableArray *bufferedNotifications;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  bufferedNotifications = v8->_bufferedNotifications;
  v12[0] = CFSTR("_notificationName");
  v12[1] = CFSTR("_userInfo");
  v13[0] = v6;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](bufferedNotifications, "addObject:", v11);

  if (!v7)
  objc_sync_exit(v8);

}

- (void)registerObserver:(id)a3
{
  QLNotificationCenter *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[QLNotificationCenter _indexOfObserver:](v4, "_indexOfObserver:", v5) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSPointerArray addPointer:](v4->_observers, "addPointer:", v5);
    -[QLNotificationCenter _sendEnqueuedNotifications](v4, "_sendEnqueuedNotifications");
  }
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  QLNotificationCenter *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[QLNotificationCenter _indexOfObserver:](v4, "_indexOfObserver:", v6);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSPointerArray removePointerAtIndex:](v4->_observers, "removePointerAtIndex:", v5);
    -[NSPointerArray compact](v4->_observers, "compact");
  }
  objc_sync_exit(v4);

}

- (void)setRemoteNotificationCenter:(id)a3
{
  QLNotificationCenter *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_remoteNotificationCenter, a3);
  if (v5->_remoteNotificationCenter)
    -[QLNotificationCenter _sendEnqueuedNotifications](v5, "_sendEnqueuedNotifications");
  objc_sync_exit(v5);

}

- (int64_t)_indexOfObserver:(id)a3
{
  id v4;
  QLNotificationCenter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
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
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSPointerArray copy](v5->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        if (*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10) == v4)
        {
          v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  objc_sync_exit(v5);
  return v12;
}

- (void)_sendEnqueuedNotifications
{
  QLNotificationCenter *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (-[NSMutableArray count](v2->_bufferedNotifications, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)-[NSMutableArray copy](v2->_bufferedNotifications, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_notificationName"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_userInfo"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[QLNotificationCenter _tryPostingNotificationName:userInfo:](v2, "_tryPostingNotificationName:userInfo:", v8, v9);

          if (v10)
            -[NSMutableArray removeObject:](v2->_bufferedNotifications, "removeObject:", v7);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
  objc_sync_exit(v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedNotifications, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_remoteNotificationCenter, 0);
}

@end
