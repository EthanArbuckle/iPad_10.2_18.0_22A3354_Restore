@implementation IMEventNotificationManager

- (void)registerNotificationQueue:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  -[NSMutableArray addObject:](self->_registeredNotificationQueues, "addObject:", v4);

}

- (IMEventNotificationManager)init
{
  IMEventNotificationManager *v2;
  uint64_t v3;
  NSMutableArray *registeredNotificationQueues;
  IMEventListenerList *v5;
  IMEventListenerList *eventListeners;
  IMAutomaticEventNotificationQueue *v7;
  IMAutomaticEventNotificationQueue *notificationQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMEventNotificationManager;
  v2 = -[IMEventNotificationManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    registeredNotificationQueues = v2->_registeredNotificationQueues;
    v2->_registeredNotificationQueues = (NSMutableArray *)v3;

    v5 = objc_alloc_init(IMEventListenerList);
    eventListeners = v2->_eventListeners;
    v2->_eventListeners = v5;

    v2->_eventTimeout = 30.0;
    v7 = objc_alloc_init(IMAutomaticEventNotificationQueue);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = v7;

    -[IMEventNotificationManager registerNotificationQueue:](v2, "registerNotificationQueue:", v2->_notificationQueue);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMEventNotificationManager;
  -[IMEventNotificationManager dealloc](&v4, sel_dealloc);
}

- (BOOL)isBusy
{
  IMEventNotificationManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[IMEventNotificationManager busyCount](v2, "busyCount") > 0
    || -[IMEventListenerList count](v2->_eventListeners, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)eventNotificationQueue:(id)a3 didChangeBusyState:(BOOL)a4
{
  -[IMEventNotificationManager busyCount](self, "busyCount", a3);
  MEMORY[0x1E0DE7D20](self, sel_setBusyCount_);
}

- (void)eventListenerDidFinish:(id)a3
{
  IMEventNotificationManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[IMEventListenerList removeObject:](v4->_eventListeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)registerEventListener:(id)a3
{
  id v4;
  IMEventNotificationManager *v5;
  double v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "timeout");
  if (v6 == 0.0)
    objc_msgSend(v4, "setTimeout:", v5->_eventTimeout);
  -[IMEventListenerList addObject:](v5->_eventListeners, "addObject:", v4);
  location = 0;
  objc_initWeak(&location, v5);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E28C10C;
  v7[3] = &unk_1E3FB62F0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "setDidInvokeCompletion:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

}

- (id)createEventListenerForNotificationName:(id)a3 object:(id)a4
{
  void *v5;

  +[IMNotificationCenterEventListener eventListenerForNotificationName:object:](IMNotificationCenterEventListener, "eventListenerForNotificationName:object:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEventNotificationManager registerEventListener:](self, "registerEventListener:", v5);
  return v5;
}

- (void)cancelEventNotificationsForEventHandler:(id)a3
{
  id v4;
  IMEventNotificationManager *v5;
  NSMutableArray *v6;
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
  v5 = self;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5->_registeredNotificationQueues;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cancelEventNotificationsForNotificationTarget:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)cancelAllEventNotifications
{
  IMEventNotificationManager *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = v2->_registeredNotificationQueues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancelAllEventNotifications", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)pauseEventNotifications:(BOOL)a3
{
  _BOOL8 v3;
  IMEventNotificationManager *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4->_registeredNotificationQueues;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPaused:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (void)pushNotificationForEventHandler:(id)a3 eventNotificationBlock:(id)a4
{
  id v6;
  IMEventNotificationManager *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[IMEventNotificationQueue pushEventTarget:eventNotificationBlock:](v7->_notificationQueue, "pushEventTarget:eventNotificationBlock:", v8, v6);
  objc_sync_exit(v7);

}

- (void)appendNotificationForEventHandler:(id)a3 eventNotificationBlock:(id)a4
{
  id v6;
  IMEventNotificationManager *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[IMEventNotificationQueue appendEventTarget:eventNotificationBlock:](v7->_notificationQueue, "appendEventTarget:eventNotificationBlock:", v8, v6);
  objc_sync_exit(v7);

}

- (void)pushNotificationForEventHandler:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v8;
  id v9;
  IMEventNotificationManager *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[IMEventNotificationQueue pushEventTarget:sender:eventNotificationBlock:](v10->_notificationQueue, "pushEventTarget:sender:eventNotificationBlock:", v11, v8, v9);
  objc_sync_exit(v10);

}

- (void)appendNotificationForEventHandler:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v8;
  id v9;
  IMEventNotificationManager *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[IMEventNotificationQueue appendEventTarget:sender:eventNotificationBlock:](v10->_notificationQueue, "appendEventTarget:sender:eventNotificationBlock:", v11, v8, v9);
  objc_sync_exit(v10);

}

- (IMAutomaticEventNotificationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (double)eventTimeout
{
  return self->_eventTimeout;
}

- (void)setEventTimeout:(double)a3
{
  self->_eventTimeout = a3;
}

- (IMEventListenerList)eventListeners
{
  return self->_eventListeners;
}

- (NSMutableArray)registeredNotificationQueues
{
  return self->_registeredNotificationQueues;
}

- (int64_t)busyCount
{
  return self->_busyCount;
}

- (void)setBusyCount:(int64_t)a3
{
  self->_busyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredNotificationQueues, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
