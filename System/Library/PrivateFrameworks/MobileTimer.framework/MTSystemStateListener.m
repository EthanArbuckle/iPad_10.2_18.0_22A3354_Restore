@implementation MTSystemStateListener

- (MTSystemStateListener)initWithDelegate:(id)a3
{
  id v4;
  MTSystemStateListener *v5;
  MTSystemStateListener *v6;
  uint64_t v7;
  MTScheduler *serializer;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTSystemStateListener;
  v5 = -[MTSystemStateListener init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    +[MTScheduler serialSchedulerForObject:priority:](MTScheduler, "serialSchedulerForObject:priority:", v6, +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
    v7 = objc_claimAutoreleasedReturnValue();
    serializer = v6->_serializer;
    v6->_serializer = (MTScheduler *)v7;

  }
  return v6;
}

- (BOOL)checkSystemReady
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  int v7;
  MTSystemStateListener *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[MTSystemStateListener _checkIfRestoreDone](self, "_checkIfRestoreDone");
  +[MTSpringboardStartMonitor sharedInstance](MTSpringboardStartMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  if (v3)
  {
    MTLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ System is ready.", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

- (BOOL)_checkIfRestoreDone
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = objc_msgSend((id)objc_opt_class(), "isSystemRestoreDone");
  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Restore is done or not needed.", buf, 2u);
    }

    -[MTSystemStateListener _handleRestoreDone](self, "_handleRestoreDone");
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Restore isn't done.", v7, 2u);
    }

  }
  return v3;
}

+ (BOOL)isSystemRestoreDone
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;

  +[MTSpringboardStartMonitor sharedInstance](MTSpringboardStartMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpringboardStarted");

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 0;
      v6 = "Springboard/Carousel is started.";
      v7 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    v9 = 0;
    v6 = "Springboard/Carousel not started.";
    v7 = (uint8_t *)&v9;
    goto LABEL_6;
  }

  return v3;
}

- (void)springboardStartMonitor:(id)a3 didReceiveStarted:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  MTLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "Carousel/Springboard started", v7, 2u);
  }

  -[MTSystemStateListener _verifyRestoreDone](self, "_verifyRestoreDone");
  +[MTSpringboardStartMonitor sharedInstance](MTSpringboardStartMonitor, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (void)_verifyRestoreDone
{
  NSObject *v3;
  int v4;
  MTSystemStateListener *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ verifying restore is done", (uint8_t *)&v4, 0xCu);
  }

  -[MTSystemStateListener _handleRestoreDone](self, "_handleRestoreDone");
}

+ (id)_restoreNotification
{
  return 0;
}

- (void)_handleRestoreDone
{
  void *v3;
  _QWORD v4[5];

  -[MTSystemStateListener serializer](self, "serializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__MTSystemStateListener__handleRestoreDone__block_invoke;
  v4[3] = &unk_1E39CB858;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __43__MTSystemStateListener__handleRestoreDone__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "restoreDoneHandled");
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ restore already handled", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend((id)objc_opt_class(), "_restoreNotification");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ has been notified that restore is done (received %{public}@) or not needed.", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "restoreDidFinish");

    objc_msgSend(*(id *)(a1 + 32), "setRestoreDoneHandled:", 1);
  }
}

- (void)_handleF5Reset
{
  NSObject *v3;
  void *v4;
  int v5;
  MTSystemStateListener *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ has been notified of F5 demo", (uint8_t *)&v5, 0xCu);
  }

  -[MTSystemStateListener delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleF5Reset");

}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  -[MTSystemStateListener liveDarwinNotifications](self, "liveDarwinNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__MTSystemStateListener_handlesNotification_ofType___block_invoke;
  v10[3] = &unk_1E39CB6D0;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __52__MTSystemStateListener_handlesNotification_ofType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_restoreNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    MTLogForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19AC4E000, v11, OS_LOG_TYPE_DEFAULT, "Received %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[MTSystemStateListener _verifyRestoreDone](self, "_verifyRestoreDone");
  }
  if (v7)
    v7[2](v7);

}

- (id)liveDarwinNotifications
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_restoreNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObject:", v3);

  return v2;
}

- (void)printDiagnostics
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "-----MTSystemStateListener-----", (uint8_t *)v5, 2u);
  }

  MTLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend((id)objc_opt_class(), "isSystemRestoreDone");
    v5[0] = 67240192;
    v5[1] = v4;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "Restore done: %{public}d", (uint8_t *)v5, 8u);
  }

}

- (id)gatherDiagnostics
{
  int v2;
  const __CFString *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Restore done");
  v2 = objc_msgSend((id)objc_opt_class(), "isSystemRestoreDone");
  v3 = CFSTR("NO");
  if (v2)
    v3 = CFSTR("YES");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MTSystemStateDelegate)delegate
{
  return (MTSystemStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)restoreDoneHandled
{
  return self->_restoreDoneHandled;
}

- (void)setRestoreDoneHandled:(BOOL)a3
{
  self->_restoreDoneHandled = a3;
}

- (MTScheduler)serializer
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
