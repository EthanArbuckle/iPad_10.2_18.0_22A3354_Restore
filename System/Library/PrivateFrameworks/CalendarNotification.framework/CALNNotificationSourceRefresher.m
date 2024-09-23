@implementation CALNNotificationSourceRefresher

- (CALNNotificationSourceRefresher)initWithSources:(id)a3 notificationMonitor:(id)a4 notificationManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  CALNNotificationSourceRefresher *v11;
  uint64_t v12;
  CALNNotificationSource *sources;
  dispatch_queue_t v14;
  OS_dispatch_queue *refreshQueue;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CALNNotificationSourceRefresher;
  v11 = -[CALNNotificationSourceRefresher init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sources = v11->_sources;
    v11->_sources = (CALNNotificationSource *)v12;

    objc_storeStrong((id *)&v11->_inboxNotificationMonitor, a4);
    objc_storeStrong((id *)&v11->_notificationManager, a5);
    v14 = dispatch_queue_create("com.apple.calendar.notification.NotificationSourceRefresher", 0);
    refreshQueue = v11->_refreshQueue;
    v11->_refreshQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(v9, "addNotificationsChangedObserver:selector:", v11, sel_handleNotificationsChangedNotification_);
    objc_msgSend(v9, "addNotificationsLoadedObserver:selector:", v11, sel_handleNotificationsLoadedNotification);
  }

  return v11;
}

- (void)handleNotificationsLoadedNotification
{
  NSObject *refreshQueue;
  _QWORD block[5];

  refreshQueue = self->_refreshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CALNNotificationSourceRefresher_handleNotificationsLoadedNotification__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(refreshQueue, block);
}

void __72__CALNNotificationSourceRefresher_handleNotificationsLoadedNotification__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing notifications in response to notifications loaded callback.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_refreshNotifications:", 0);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Not refreshing notifications in response to notifications loaded callback because there is no need to do so.", v5, 2u);
    }

  }
}

- (void)handleNotificationsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *refreshQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Received notification changed callback.", buf, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDC7580]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("stringRepresentation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  refreshQueue = self->_refreshQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__CALNNotificationSourceRefresher_handleNotificationsChangedNotification___block_invoke;
  v12[3] = &unk_24D484760;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_sync(refreshQueue, v12);

}

uint64_t __74__CALNNotificationSourceRefresher_handleNotificationsChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshNotifications:", *(_QWORD *)(a1 + 40));
}

- (void)refreshNotifications
{
  NSObject *refreshQueue;
  _QWORD block[5];

  refreshQueue = self->_refreshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CALNNotificationSourceRefresher_refreshNotifications__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(refreshQueue, block);
}

uint64_t __55__CALNNotificationSourceRefresher_refreshNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshNotifications:", 0);
}

- (void)_refreshNotifications:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_refreshQueue);
  -[CALNInboxNotificationMonitor eventNotificationReferences](self->_inboxNotificationMonitor, "eventNotificationReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self->_needsRefreshOnNotificationsLoaded = 0;
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        v8 = "Refreshing notifications affected by changes to objects %@.";
        v9 = v6;
        v10 = 12;
LABEL_10:
        _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "Refreshing all notifications.";
      v9 = v6;
      v10 = 2;
      goto LABEL_10;
    }

    -[CALNNotificationSourceRefresher sources](self, "sources");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
          v18 = (void *)MEMORY[0x2199F1FA0](v13);
          -[CALNNotificationSourceRefresher _withdrawExpiredNotificationsForSource:](self, "_withdrawExpiredNotificationsForSource:", v17, (_QWORD)v20);
          objc_msgSend(v17, "refreshNotifications:", v4);
          objc_autoreleasePoolPop(v18);
          ++v16;
        }
        while (v14 != v16);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v14 = v13;
      }
      while (v13);
    }

    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Finished refreshing notifications.", buf, 2u);
    }

    goto LABEL_21;
  }
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Blocking refresh of notifications because event notifications haven't finished loading yet.", buf, 2u);
  }

  self->_needsRefreshOnNotificationsLoaded = 1;
LABEL_21:

}

- (void)_withdrawExpiredNotificationsForSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationSourceRefresher notificationManager](self, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRecordsWithSourceIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138543618;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "content", v20, (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "expirationDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "timeIntervalSinceNow");
          if (v16 <= 0.0)
          {
            objc_msgSend(v13, "sourceClientIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              v26 = v4;
              v27 = 2114;
              v28 = v17;
              _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_DEFAULT, "Withdrawing expired notification with sourceIdentifier %{public}@ and sourceClientIdentifier %{public}@", buf, 0x16u);
            }

            -[CALNNotificationSourceRefresher notificationManager](self, "notificationManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v4, v17);

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v10);
  }

}

- (CALNNotificationSource)sources
{
  return self->_sources;
}

- (CALNInboxNotificationMonitor)inboxNotificationMonitor
{
  return self->_inboxNotificationMonitor;
}

- (CALNNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_inboxNotificationMonitor, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
}

@end
