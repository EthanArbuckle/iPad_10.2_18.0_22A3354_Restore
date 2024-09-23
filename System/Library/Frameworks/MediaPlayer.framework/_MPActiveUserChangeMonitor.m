@implementation _MPActiveUserChangeMonitor

- (_MPActiveUserChangeMonitor)initWithDelegate:(id)a3
{
  id v4;
  _MPActiveUserChangeMonitor *v5;
  _MPActiveUserChangeMonitor *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *expectedNotifications;
  uint64_t v11;
  NSMutableSet *receivedNotifications;
  objc_super v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPActiveUserChangeMonitor;
  v5 = -[_MPActiveUserChangeMonitor init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = CFSTR("MPMediaLibraryPathDidChangeNotification");
    v15[1] = CFSTR("MPMediaLibraryDidChangeNotification");
    v15[2] = *MEMORY[0x1E0DDBC38];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    expectedNotifications = v6->_expectedNotifications;
    v6->_expectedNotifications = (NSSet *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSSet count](v6->_expectedNotifications, "count"));
    receivedNotifications = v6->_receivedNotifications;
    v6->_receivedNotifications = (NSMutableSet *)v11;

    v6->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)ingestNotificationName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  _MPActiveUserChangeMonitor *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  -[_MPActiveUserChangeMonitor expectedNotifications](self, "expectedNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    -[_MPActiveUserChangeMonitor receivedNotifications](self, "receivedNotifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (!v7)
    {
      -[_MPActiveUserChangeMonitor receivedNotifications](self, "receivedNotifications");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v4);

      v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[_MPActiveUserChangeMonitor receivedNotifications](self, "receivedNotifications");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        -[_MPActiveUserChangeMonitor expectedNotifications](self, "expectedNotifications");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v23 = self;
        v24 = 2114;
        v25 = v4;
        v26 = 2048;
        v27 = v11;
        v28 = 2048;
        v29 = objc_msgSend(v12, "count");
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "<_MPActiveUserChangeMonitor %p> - Ingesting notification %{public}@ [%ld of %ld]", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received %@"), v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPActiveUserChangeMonitor _cancelNotificationTimerWithReason:](self, "_cancelNotificationTimerWithReason:", v13);

      -[_MPActiveUserChangeMonitor receivedNotifications](self, "receivedNotifications");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPActiveUserChangeMonitor expectedNotifications](self, "expectedNotifications");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToSet:", v15);

      -[_MPActiveUserChangeMonitor receivedNotifications](self, "receivedNotifications");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
      {
        objc_msgSend(v17, "removeAllObjects");

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke;
        block[3] = &unk_1E3163508;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      else
      {
        v19 = objc_msgSend(v17, "containsObject:", CFSTR("MPMediaLibraryPathDidChangeNotification"));

        if (v19)
        {
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_2;
          v20[3] = &unk_1E3163508;
          v20[4] = self;
          -[_MPActiveUserChangeMonitor _startNotificationTimerWithEventHandler:](self, "_startNotificationTimerWithEventHandler:", v20);
        }
      }
    }
  }
  else
  {

  }
  os_unfair_lock_unlock(&self->_stateLock);

}

- (void)_startNotificationTimerWithEventHandler:(id)a3
{
  id v5;
  void *v6;
  dispatch_source_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  _MPActiveUserChangeMonitor *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPActiveUserChangeMonitor.m"), 77, CFSTR("Cancel existing timer before starting a new one."));

  }
  v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  -[_MPActiveUserChangeMonitor setNotificationTimer:](self, "setNotificationTimer:", v7);

  -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_event_handler(v10, v5);

  -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v11);

  v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218240;
    v16 = self;
    v17 = 2048;
    v18 = v13;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_INFO, "<_MPActiveUserChangeMonitor %p> - Started notification timer %p", (uint8_t *)&v15, 0x16u);

  }
}

- (void)_cancelNotificationTimerWithReason:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  _MPActiveUserChangeMonitor *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPActiveUserChangeMonitor.m"), 87, CFSTR("Must provide a reason for logging."));

  }
  -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = self;
      v13 = 2048;
      v14 = v8;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_INFO, "<_MPActiveUserChangeMonitor %p> - Canceled notification timer %p [%{public}@]", (uint8_t *)&v11, 0x20u);

    }
    -[_MPActiveUserChangeMonitor notificationTimer](self, "notificationTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v9);

    -[_MPActiveUserChangeMonitor setNotificationTimer:](self, "setNotificationTimer:", 0);
  }

}

- (NSSet)expectedNotifications
{
  return self->_expectedNotifications;
}

- (NSMutableSet)receivedNotifications
{
  return self->_receivedNotifications;
}

- (void)setReceivedNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_receivedNotifications, a3);
}

- (OS_dispatch_source)notificationTimer
{
  return self->_notificationTimer;
}

- (void)setNotificationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTimer, a3);
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (_MPActiveUserChangeMonitorDelegate)delegate
{
  return (_MPActiveUserChangeMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_receivedNotifications, 0);
  objc_storeStrong((id *)&self->_expectedNotifications, 0);
}

@end
