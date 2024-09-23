@implementation CALNInboxNotificationMonitor

uint64_t __59__CALNInboxNotificationMonitor_initWithEventStoreProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventStore");
}

- (void)receivedNotificationNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (-[CALNInboxNotificationMonitor isActive](self, "isActive"))
  {
    -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleDarwinNotification:", v4);

    objc_msgSend(MEMORY[0x24BDC74B8], "focusModeConfigurationChangedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDC7590];
      -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", v9, v10);

    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNInboxNotificationMonitor receivedNotificationNamed:].cold.1((uint64_t)v4, v11);

  }
}

- (_EKNotificationMonitor)notificationMonitor
{
  return self->_notificationMonitor;
}

- (BOOL)isActive
{
  return self->_active;
}

- (CALNInboxNotificationMonitor)initWithEventStoreProvider:(id)a3
{
  id v4;
  CALNInboxNotificationMonitor *v5;
  id v6;
  uint64_t v7;
  _EKNotificationMonitor *notificationMonitor;
  NSObject *v9;
  dispatch_queue_t v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CALNInboxNotificationMonitor;
  v5 = -[CALNInboxNotificationMonitor init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDC7570]);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__CALNInboxNotificationMonitor_initWithEventStoreProvider___block_invoke;
    v12[3] = &unk_24D484BA8;
    v13 = v4;
    v7 = objc_msgSend(v6, "initWithOptions:eventStoreGetter:", 54, v12);
    notificationMonitor = v5->_notificationMonitor;
    v5->_notificationMonitor = (_EKNotificationMonitor *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.calendar.notification.InboxNotificationMonitorCallback", v9);
    -[_EKNotificationMonitor setCallbackNotificationQueue:](v5->_notificationMonitor, "setCallbackNotificationQueue:", v10);

  }
  return v5;
}

- (void)addNotificationsChangedObserver:(id)a3 selector:(SEL)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDC7590];
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, a4, v8, v9);

}

- (void)removeNotificationsChangedObserver:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDC7590];
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", v5, v6, v7);

}

- (void)addNotificationCountChangedObserver:(id)a3 selector:(SEL)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDC7588];
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, a4, v8, v9);

}

- (void)removeNotificationCountChangedObserver:(id)a3 selector:(SEL)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD16D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDC7588];
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", v6, v7, v8);

}

- (void)addNotificationsLoadedObserver:(id)a3 selector:(SEL)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDC7598];
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v7, a4, v8, v9);

}

- (void)removeNotificationsLoadedObserver:(id)a3 selector:(SEL)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD16D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDC7598];
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", v6, v7, v8);

}

- (NSArray)eventNotificationReferences
{
  void *v2;
  void *v3;

  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)eventNotificationCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC74B8], "unselectedCalendarIdentifiersForFocusMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "notificationReferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "eventStore");
      v9 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v9;
      objc_msgSend(MEMORY[0x24BDC74B8], "unselectedCalendarsForFocusModeInEventStore:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v24 = v7;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "notification");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              if ((objc_msgSend(v17, "cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:", v10) & 1) != 0)
              {
                ++v14;
              }
              else
              {
                +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v18, "objectID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v30 = v20;
                  _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_INFO, "Notification with objectID %{public}@ has a calendar that is hidden by focus. Not including in the badge count", buf, 0xCu);

                }
              }
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v13);
      }
      else
      {
        v14 = 0;
      }

      v7 = v24;
    }
    else
    {
      v14 = 0;
    }

    return v14;
  }
  else
  {
    v21 = objc_msgSend(v5, "notificationCount");

    return v21;
  }
}

- (void)activate
{
  void *v3;

  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[CALNInboxNotificationMonitor setActive:](self, "setActive:", 1);
}

- (void)deactivate
{
  id v3;

  -[CALNInboxNotificationMonitor setActive:](self, "setActive:", 0);
  -[CALNInboxNotificationMonitor notificationMonitor](self, "notificationMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationMonitor, 0);
}

- (void)receivedNotificationNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Received notification but inbox notification monitor is not active. notification name = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
