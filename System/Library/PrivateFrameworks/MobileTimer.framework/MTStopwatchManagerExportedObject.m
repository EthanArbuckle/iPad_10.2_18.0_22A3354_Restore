@implementation MTStopwatchManagerExportedObject

- (MTStopwatchManagerExportedObject)initWithStopwatchManager:(id)a3
{
  id v4;
  MTStopwatchManagerExportedObject *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  MTStopwatchManagerExportedObject *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTStopwatchManagerExportedObject;
  v5 = -[MTStopwatchManagerExportedObject init](&v8, sel_init);
  if (v5)
  {
    MTLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v5;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized exported object, manager: %{public}@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v5->_stopwatchManager, v4);
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  MTStopwatchManagerExportedObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.MTStopwatchServer.ready"), 0);

  v5.receiver = self;
  v5.super_class = (Class)MTStopwatchManagerExportedObject;
  -[MTStopwatchManagerExportedObject dealloc](&v5, sel_dealloc);
}

- (void)_didReceiveTimerServerReadyNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTStopwatchManagerExportedObject stopwatchManager](self, "stopwatchManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTStopwatchServerReadyNotification", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MTStopwatchManagerExportedObject__didReceiveTimerServerReadyNotification___block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__MTStopwatchManagerExportedObject__didReceiveTimerServerReadyNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "stopwatchManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stopwatchManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MTStopwatchManagerStateReset"), v3);

}

- (void)didCreateStopwatch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTStopwatchManagerExportedObject *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MTStopwatchManagerExportedObject_didCreateStopwatch___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__MTStopwatchManagerExportedObject_didCreateStopwatch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTStopwatchManager - Stopwatch created", v8, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Stopwatch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "stopwatchManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stopwatchManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTStopwatchManagerStopwatchCreated"), v7, v4);

}

- (void)didDeleteStopwatch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTStopwatchManagerExportedObject *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MTStopwatchManagerExportedObject_didDeleteStopwatch___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__MTStopwatchManagerExportedObject_didDeleteStopwatch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTStopwatchManager - Stopwatch Updated", v8, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Stopwatch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "stopwatchManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stopwatchManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTStopwatchManagerStopwatchUpdated"), v7, v4);

}

- (void)didUpdateStopwatch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MTStopwatchManagerExportedObject *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MTStopwatchManagerExportedObject_didUpdateStopwatch___block_invoke;
  v6[3] = &unk_1E39CB7B0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__MTStopwatchManagerExportedObject_didUpdateStopwatch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "MTStopwatchManager - Stopwatch Updated", v8, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Stopwatch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "stopwatchManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stopwatchManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTStopwatchManagerStopwatchDeleted"), v7, v4);

}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4
{
  -[MTStopwatchManagerExportedObject didAddLap:forStopwatch:source:](self, "didAddLap:forStopwatch:source:", a3, a4, 0);
}

- (void)didClearAllLapsForStopwatch:(id)a3
{
  -[MTStopwatchManagerExportedObject didClearAllLapsForStopwatch:source:](self, "didClearAllLapsForStopwatch:source:", a3, 0);
}

- (void)didStartLapTimerForStopwatch:(id)a3
{
  -[MTStopwatchManagerExportedObject didStartLapTimerForStopwatch:source:](self, "didStartLapTimerForStopwatch:source:", a3, 0);
}

- (void)didPauseLapTimerForStopwatch:(id)a3
{
  -[MTStopwatchManagerExportedObject didPauseLapTimerForStopwatch:source:](self, "didPauseLapTimerForStopwatch:source:", a3, 0);
}

- (void)didLapLapTimerForStopwatch:(id)a3
{
  -[MTStopwatchManagerExportedObject didLapLapTimerForStopwatch:source:](self, "didLapLapTimerForStopwatch:source:", a3, 0);
}

- (void)didResetLapTimerForStopwatch:(id)a3
{
  -[MTStopwatchManagerExportedObject didResetLapTimerForStopwatch:source:](self, "didResetLapTimerForStopwatch:source:", a3, 0);
}

- (void)didResumeLapTimerForStopwatch:(id)a3
{
  -[MTStopwatchManagerExportedObject didResumeLapTimerForStopwatch:source:](self, "didResumeLapTimerForStopwatch:source:", a3, 0);
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4 source:(id)a5
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:modifiedItem:source:](self, "publishEvent:withStopwatch:modifiedItem:source:", a3, a4, 0, a5);
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:modifiedItem:](self, "publishEvent:withStopwatch:modifiedItem:", a3, a4, 0);
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4 modifiedItem:(id)a5
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:modifiedItem:source:](self, "publishEvent:withStopwatch:modifiedItem:source:", a3, a4, a5, 0);
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4 modifiedItem:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MTStopwatchManagerExportedObject_publishEvent_withStopwatch_modifiedItem_source___block_invoke;
  block[3] = &unk_1E39CBDE0;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v13;
  v22 = v12;
  v14 = v12;
  v15 = v13;
  v16 = v11;
  v17 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__MTStopwatchManagerExportedObject_publishEvent_withStopwatch_modifiedItem_source___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "sourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v3;
    v19 = 2114;
    v20 = v4;
    v21 = 2114;
    v22 = v5;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_INFO, "%{public}@ - Publishing event: %{public}@, for stopwatch id: %{public}@, source identifier: %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  v7 = (void *)objc_opt_new();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("Stopwatch"));
  v10 = *(_QWORD *)(a1 + 64);
  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("MTStopwatchManagerModifiedItemKey"));
  objc_msgSend(*(id *)(a1 + 56), "sourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 56), "sourceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("MTStopwatchSourceIdentifierKey"));

  }
  objc_msgSend(*(id *)(a1 + 32), "stopwatchManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stopwatchManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", v15, v16, v8);

}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 source:(id)a5
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:modifiedItem:source:](self, "publishEvent:withStopwatch:modifiedItem:source:", CFSTR("MTStopwatchManagerLapAdded"), a4, a3, a5);
}

- (void)didClearAllLapsForStopwatch:(id)a3 source:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:source:](self, "publishEvent:withStopwatch:source:", CFSTR("MTStopwatchManagerDidClearAllLaps"), a3, a4);
}

- (void)didStartLapTimerForStopwatch:(id)a3 source:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:source:](self, "publishEvent:withStopwatch:source:", CFSTR("MTStopwatchManagerDidStartLapTimer"), a3, a4);
}

- (void)didPauseLapTimerForStopwatch:(id)a3 source:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:source:](self, "publishEvent:withStopwatch:source:", CFSTR("MTStopwatchManagerDidPauseLapTimer"), a3, a4);
}

- (void)didLapLapTimerForStopwatch:(id)a3 source:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:source:](self, "publishEvent:withStopwatch:source:", CFSTR("MTStopwatchManagerDidLapLapTimer"), a3, a4);
}

- (void)didResetLapTimerForStopwatch:(id)a3 source:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:source:](self, "publishEvent:withStopwatch:source:", CFSTR("MTStopwatchManagerDidResetLapTimer"), a3, a4);
}

- (void)didResumeLapTimerForStopwatch:(id)a3 source:(id)a4
{
  -[MTStopwatchManagerExportedObject publishEvent:withStopwatch:source:](self, "publishEvent:withStopwatch:source:", CFSTR("MTStopwatchManagerDidResumeLapTimer"), a3, a4);
}

- (MTStopwatchManager)stopwatchManager
{
  return (MTStopwatchManager *)objc_loadWeakRetained((id *)&self->_stopwatchManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stopwatchManager);
}

@end
