@implementation MTAgentNotificationManager

- (MTAgentNotificationManager)init
{
  MTAgentNotificationManager *v2;
  uint64_t v3;
  NAScheduler *serializer;
  uint64_t v5;
  NSMutableArray *listeners;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTAgentNotificationManager;
  v2 = -[MTAgentNotificationManager init](&v8, sel_init);
  if (v2)
  {
    +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTNotificationManager.serialqueue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v3 = objc_claimAutoreleasedReturnValue();
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)registerListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTAgentNotificationManager serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MTAgentNotificationManager_registerListener___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __47__MTAgentNotificationManager_registerListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ registered %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "listeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "liveDarwinNotifications", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "_registerForLiveDarwinNotification:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)beginListening
{
  -[MTAgentNotificationManager _registerForDistributedNotifications](self, "_registerForDistributedNotifications");
  -[MTAgentNotificationManager _registerForDarwinNotifications](self, "_registerForDarwinNotifications");
  -[MTAgentNotificationManager _registerForAlarmNotifications](self, "_registerForAlarmNotifications");
}

- (void)_registerForDistributedNotifications
{
  NSObject *v3;
  int v4;
  MTAgentNotificationManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for distributed notifications", (uint8_t *)&v4, 0xCu);
  }

  -[MTAgentNotificationManager _registerForXPCStream:notificationType:](self, "_registerForXPCStream:notificationType:", CFSTR("com.apple.distnoted.matching"), 1);
}

- (void)_registerForDarwinNotifications
{
  NSObject *v3;
  int v4;
  MTAgentNotificationManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for darwin notifications", (uint8_t *)&v4, 0xCu);
  }

  -[MTAgentNotificationManager _registerForXPCStream:notificationType:](self, "_registerForXPCStream:notificationType:", CFSTR("com.apple.notifyd.matching"), 0);
}

- (void)_registerForAlarmNotifications
{
  NSObject *v3;
  int v4;
  MTAgentNotificationManager *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for alarm notifications", (uint8_t *)&v4, 0xCu);
  }

  -[MTAgentNotificationManager _registerForXPCStream:notificationType:](self, "_registerForXPCStream:notificationType:", CFSTR("com.apple.alarm"), 2);
}

- (void)_registerForLiveDarwinNotification:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  MTAgentNotificationManager *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is registering for darwin notification %{public}@", (uint8_t *)&v7, 0x16u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleLiveNotification, v4, self, CFNotificationSuspensionBehaviorDrop);

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  id obj;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MTAgentNotificationManager listeners](self, "listeners");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          objc_msgSend(v7, "liveDarwinNotifications");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v18;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v18 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(const __CFString **)(*((_QWORD *)&v17 + 1) + 8 * v12);
                DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
                CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v13, 0);
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v10);
          }

        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  v16.receiver = self;
  v16.super_class = (Class)MTAgentNotificationManager;
  -[MTAgentNotificationManager dealloc](&v16, sel_dealloc);
}

- (void)_registerForXPCStream:(id)a3 notificationType:(int64_t)a4
{
  const char *v6;
  _QWORD v7[6];

  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__MTAgentNotificationManager__registerForXPCStream_notificationType___block_invoke;
  v7[3] = &unk_1E39CB9E0;
  v7[4] = self;
  v7[5] = a4;
  xpc_set_event_stream_handler(v6, MEMORY[0x1E0C80D38], v7);
}

void __69__MTAgentNotificationManager__registerForXPCStream_notificationType___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received notification %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleNotificationWithName:type:", v3, *(_QWORD *)(a1 + 40));
}

- (void)_handleNotificationWithName:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[MTAgentNotificationManager serializer](self, "serializer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke;
  v9[3] = &unk_1E39CBA08;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

void __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "listeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v7, "handlesNotification:ofType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || (objc_msgSend(v7, "assertionTimeOutForNotification:ofType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)),
                v8 == 0.0))
          {
            objc_msgSend((id)objc_opt_class(), "defaultAssertionTimeOutForNotification:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          }
          +[MTAgentNotification notificationWithType:name:powerAssertionTimeout:](MTAgentNotification, "notificationWithType:name:powerAssertionTimeout:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(a1 + 40);
          v11 = *(_QWORD *)(a1 + 48);
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke_2;
          v13[3] = &unk_1E39CB858;
          v14 = v9;
          v12 = v9;
          objc_msgSend(v7, "handleNotification:ofType:completion:", v10, v11, v13);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

uint64_t __63__MTAgentNotificationManager__handleNotificationWithName_type___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "releaseAssertion");
}

+ (double)defaultAssertionTimeOutForNotification:(id)a3 type:(int64_t)a4
{
  double result;

  if (a4 != 2)
    return 0.0;
  objc_msgSend(a1, "_schedulingAssertionTimeout", a3);
  return result;
}

+ (double)_schedulingAssertionTimeout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MTAgentNotificationManager__schedulingAssertionTimeout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_schedulingAssertionTimeout_onceToken != -1)
    dispatch_once(&_schedulingAssertionTimeout_onceToken, block);
  return *(double *)&_schedulingAssertionTimeout_assertionTimeout;
}

void __57__MTAgentNotificationManager__schedulingAssertionTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MTIntegerIsPositive();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&_schedulingAssertionTimeout_assertionTimeout = (double)objc_msgSend(v2, "integerForKey:isValid:defaultValue:", CFSTR("SchedulingAssertionTimeout"), v3, (uint64_t)*(double *)&_schedulingAssertionTimeout_assertionTimeout);

  MTLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 1026;
    v9 = (int)*(double *)&_schedulingAssertionTimeout_assertionTimeout;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Using a scheduling power assertion timeout of %{public}d", (uint8_t *)&v6, 0x12u);
  }

}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
