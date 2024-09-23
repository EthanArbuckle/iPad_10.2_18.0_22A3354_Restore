@implementation MTTimerManagerExportedObject

- (MTTimerManagerExportedObject)initWithTimerManager:(id)a3
{
  id v4;
  MTTimerManagerExportedObject *v5;
  MTTimerManagerExportedObject *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTTimerManagerExportedObject;
  v5 = -[MTTimerManagerExportedObject init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_timerManager, v4);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__didReceiveTimerServerReadyNotification_, CFSTR("com.apple.MTTimerServer.ready"), 0);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  MTTimerManagerExportedObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.MTTimerServer.ready"), 0);

  v5.receiver = self;
  v5.super_class = (Class)MTTimerManagerExportedObject;
  -[MTTimerManagerExportedObject dealloc](&v5, sel_dealloc);
}

- (void)_didReceiveTimerServerReadyNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTTimerServerReadyNotification", buf, 0xCu);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markNeedsUpdate");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MTTimerManagerExportedObject__didReceiveTimerServerReadyNotification___block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __72__MTTimerManagerExportedObject__didReceiveTimerServerReadyNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "timerManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MTTimerManagerStateReset"), v3);

}

- (void)timersAdded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTTimerManagerExportedObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("timerID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified timers added: %{public}@", buf, 0x16u);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markNeedsUpdate");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__MTTimerManagerExportedObject_timersAdded___block_invoke;
  v11[3] = &unk_1E39CB7B0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __44__MTTimerManagerExportedObject_timersAdded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerManager - Timer Added", v11, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Timers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersAdded"), v7, v4);

  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersChanged"), v10, v4);

}

- (void)timersUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTTimerManagerExportedObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("timerID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified timers update: %{public}@", buf, 0x16u);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markNeedsUpdate");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__MTTimerManagerExportedObject_timersUpdated___block_invoke;
  v11[3] = &unk_1E39CB7B0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __46__MTTimerManagerExportedObject_timersUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerManager - Timer Updated", v11, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Timers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersUpdated"), v7, v4);

  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersChanged"), v10, v4);

}

- (void)timersRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTTimerManagerExportedObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("timerID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified timers removed: %{public}@", buf, 0x16u);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markNeedsUpdate");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__MTTimerManagerExportedObject_timersRemoved___block_invoke;
  v11[3] = &unk_1E39CB7B0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __46__MTTimerManagerExportedObject_timersRemoved___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerManager - Timer Removed", v11, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Timers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersRemoved"), v7, v4);

  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersChanged"), v10, v4);

}

- (void)timerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTTimerManagerExportedObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified timer fired: %{public}@", buf, 0x16u);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markNeedsUpdate");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__MTTimerManagerExportedObject_timerFired___block_invoke;
  v11[3] = &unk_1E39CB7B0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __43__MTTimerManagerExportedObject_timerFired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerManager - Timer Fired", v12, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    v13[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("Timers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimerFired"), v8, v5);

    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerFiringTimerChanged"), v11, v5);

  }
}

- (void)timerDismissed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTTimerManagerExportedObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified timer dismissed: %{public}@", buf, 0x16u);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markNeedsUpdate");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__MTTimerManagerExportedObject_timerDismissed___block_invoke;
  v11[3] = &unk_1E39CB7B0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __47__MTTimerManagerExportedObject_timerDismissed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerManager - Timer Dismissed", v12, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    v13[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("Timers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerFiringTimerDismissed"), v8, v5);

    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerFiringTimerChanged"), v11, v5);

  }
}

- (void)nextTimerChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTTimerManagerExportedObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified next timer changed: %{public}@", buf, 0x16u);

  }
  -[MTTimerManagerExportedObject timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markNeedsUpdate");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__MTTimerManagerExportedObject_nextTimerChanged___block_invoke;
  v11[3] = &unk_1E39CB7B0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __49__MTTimerManagerExportedObject_nextTimerChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTTimerManager - Next Timer Changed", v14, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("NextTimer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerNextTimerChanged"), v7, v4);

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v15[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, CFSTR("Timers"));
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerTimersChanged"), v13, v10);

    v4 = (void *)v10;
  }

}

- (void)recentTimerDurationsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTTimerManagerExportedObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified recent durations updated", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MTTimerManagerExportedObject_recentTimerDurationsUpdated___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __60__MTTimerManagerExportedObject_recentTimerDurationsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v1, CFSTR("Durations"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerRecentDurationsUpdated"), v5, v6);

  }
}

- (void)favoriteTimerDurationsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTTimerManagerExportedObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified favorite durations updated", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__MTTimerManagerExportedObject_favoriteTimerDurationsUpdated___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __62__MTTimerManagerExportedObject_favoriteTimerDurationsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v1, CFSTR("Durations"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerFavoriteDurationsUpdated"), v5, v6);

  }
}

- (void)latestTimerDurationUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTTimerManagerExportedObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerManagerExportedObject timerManager](self, "timerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ notified latest duration updated", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__MTTimerManagerExportedObject_latestTimerDurationUpdated___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __59__MTTimerManagerExportedObject_latestTimerDurationUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0C99D80];
    v8[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, CFSTR("Durations"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTTimerManagerLatestDurationUpdated"), v7, v4);

  }
}

- (MTTimerManager)timerManager
{
  return (MTTimerManager *)objc_loadWeakRetained((id *)&self->_timerManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timerManager);
}

@end
