@implementation LSProgressNotificationTimer

- (LSProgressNotificationTimer)initWithQueue:(id)a3
{
  id v5;
  LSProgressNotificationTimer *v6;
  LSProgressNotificationTimer *v7;
  NSTimer *timer;
  uint64_t v9;
  NSMutableSet *applications;
  NSDate *v11;
  NSDate *lastFiredDate;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LSProgressNotificationTimer;
  v6 = -[LSProgressNotificationTimer init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    timer = v6->_timer;
    v6->_timer = 0;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    applications = v7->_applications;
    v7->_applications = (NSMutableSet *)v9;

    v11 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    lastFiredDate = v7->_lastFiredDate;
    v7->_lastFiredDate = v11;

    *(_OWORD *)&v7->_minInterval = xmmword_1829FAE70;
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LSProgressNotificationTimer;
  -[LSProgressNotificationTimer dealloc](&v3, sel_dealloc);
}

- (void)stopTimer
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  -[LSProgressNotificationTimer timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[LSProgressNotificationTimer timer](self, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

    if (v6)
    {
      -[NSTimer invalidate](self->_timer, "invalidate");
      -[LSProgressNotificationTimer setTimer:](self, "setTimer:", 0);
    }
  }
}

- (void)addApplication:(id)a3
{
  NSMutableSet *applications;
  id v4;

  applications = self->_applications;
  objc_msgSend(a3, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](applications, "addObject:", v4);

}

- (void)removeApplication:(id)a3
{
  LSProgressNotificationTimer *v4;
  NSMutableSet *applications;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  v4 = self;
  objc_sync_enter(v4);
  applications = v4->_applications;
  objc_msgSend(v13, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(applications) = -[NSMutableSet containsObject:](applications, "containsObject:", v6);

  if ((_DWORD)applications)
  {
    v7 = v4->_applications;
    objc_msgSend(v13, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v7, "removeObject:", v8);

    -[LSProgressNotificationTimer applications](v4, "applications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count")
      || (-[LSProgressNotificationTimer timer](v4, "timer"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {

    }
    else
    {
      -[LSProgressNotificationTimer timer](v4, "timer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isValid");

      if (v12)
        MEMORY[0x186DAF214](-[LSProgressNotificationTimer stopTimer](v4, "stopTimer"));
    }
  }
  objc_sync_exit(v4);

}

- (void)clear
{
  -[NSMutableSet removeAllObjects](self->_applications, "removeAllObjects");
}

- (void)notifyObservers:(id)a3 withApplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  LSProgressNotificationTimer *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v9 = self;
    objc_sync_enter(v9);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          -[LSProgressNotificationTimer addApplication:](v9, "addApplication:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13++), (_QWORD)v25);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    -[LSProgressNotificationTimer timer](v9, "timer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
      goto LABEL_19;
    MEMORY[0x186DAF208]();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSProgressNotificationTimer lastFiredDate](v9, "lastFiredDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSProgressNotificationTimer minInterval](v9, "minInterval");
    objc_msgSend(v17, "dateByAddingTimeInterval:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[LSProgressNotificationTimer minInterval](v9, "minInterval");
    objc_msgSend(v16, "dateByAddingTimeInterval:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "compare:", v18);
    if (v20 == -1)
    {
      if (objc_msgSend(v19, "compare:", v18) == -1)
      {
        v21 = v19;
        goto LABEL_17;
      }
    }
    else if (v20 == 1)
    {
      -[LSProgressNotificationTimer latency](v9, "latency");
      objc_msgSend(v16, "dateByAddingTimeInterval:");
      v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v22 = v21;

      goto LABEL_18;
    }
    v22 = v18;
LABEL_18:
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v22, v9, sel_sendMessage_, v6, 0, 0.0);
    -[LSProgressNotificationTimer setTimer:](v9, "setTimer:", v23);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTimer:forMode:", v23, *MEMORY[0x1E0C99748]);

LABEL_19:
    objc_sync_exit(v9);

  }
}

- (void)sendMessage:(id)a3
{
  NSObject *v4;
  LSProgressNotificationTimer *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  _LSProgressLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[LSProgressNotificationTimer sendMessage:].cold.1(self, v4);

  v5 = self;
  objc_sync_enter(v5);
  -[LSProgressNotificationTimer timer](v5, "timer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSProgressNotificationTimer setLastFiredDate:](v5, "setLastFiredDate:", v8);

    objc_msgSend(v18, "userInfo");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x186DAE7A0]();
          objc_msgSend(v12, "connection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __43__LSProgressNotificationTimer_sendMessage___block_invoke;
          v20[3] = &unk_1E1040A90;
          v20[4] = v12;
          objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[LSProgressNotificationTimer applications](v5, "applications");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "allObjects");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "applicationInstallsDidChange:", v17);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    -[LSProgressNotificationTimer clear](v5, "clear");
    MEMORY[0x186DAF214](-[LSProgressNotificationTimer setTimer:](v5, "setTimer:", 0));

  }
  objc_sync_exit(v5);

}

void __43__LSProgressNotificationTimer_sendMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LSProgressLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)LSProgressNotificationTimer;
  -[LSProgressNotificationTimer description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<LSProgressNotificationTimer: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSDate)lastFiredDate
{
  return self->_lastFiredDate;
}

- (void)setLastFiredDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFiredDate, a3);
}

- (NSMutableSet)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_storeStrong((id *)&self->_applications, a3);
}

- (double)minInterval
{
  return self->_minInterval;
}

- (double)latency
{
  return self->_latency;
}

- (SEL)appObserverSelector
{
  return self->_appObserverSelector;
}

- (void)setAppObserverSelector:(SEL)a3
{
  self->_appObserverSelector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_lastFiredDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendMessage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "applications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, a2, v4, "sendMessage <applicationInstallsDidChange> timer fired with %@", v5);

  OUTLINED_FUNCTION_5_1();
}

@end
