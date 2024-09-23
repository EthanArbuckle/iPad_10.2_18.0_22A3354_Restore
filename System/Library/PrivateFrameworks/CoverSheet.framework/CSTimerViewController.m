@implementation CSTimerViewController

- (CSTimerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CSTimerViewController *v4;
  MTTimerManager *v5;
  MTTimerManager *timerManager;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSTimerViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (MTTimerManager *)objc_alloc_init(MEMORY[0x1E0D4FAB0]);
    timerManager = v4->_timerManager;
    v4->_timerManager = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__nextTimerChanged_, *MEMORY[0x1E0D4FA18], 0);

    -[CSTimerViewController _updateNextTimer](v4, "_updateNextTimer");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CSTimerViewController _stopTimer](self, "_stopTimer");
  v4.receiver = self;
  v4.super_class = (Class)CSTimerViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CSTimerView *v3;

  v3 = objc_alloc_init(CSTimerView);
  -[CSTimerViewController setView:](self, "setView:", v3);

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
      -[CSTimerViewController _startTimer](self, "_startTimer");
    else
      -[CSTimerViewController _stopTimer](self, "_stopTimer");
  }
}

- (BOOL)isTimerActive
{
  return -[NSTimer isValid](self->_updateTimer, "isValid");
}

- (void)setEndDate:(id)a3
{
  NSDate *v5;
  void *v6;
  NSDate *v7;

  v5 = (NSDate *)a3;
  if (self->_endDate != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_endDate, a3);
    -[CSTimerViewController timerView](self, "timerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndDate:", v7);

    if (v7)
      -[CSTimerViewController _startTimer](self, "_startTimer");
    else
      -[CSTimerViewController _stopTimer](self, "_stopTimer");
    v5 = v7;
  }

}

- (NSString)timerText
{
  void *v2;
  void *v3;

  -[CSTimerViewController timerView](self, "timerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEndDateValid
{
  NSDate *endDate;
  double v3;

  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate timeIntervalSinceNow](endDate, "timeIntervalSinceNow");
    LOBYTE(endDate) = v3 > 0.0;
  }
  return (char)endDate;
}

- (void)_stopTimer
{
  -[CSTimerViewController _stopTimerNotifyingDelegate:](self, "_stopTimerNotifyingDelegate:", 1);
}

- (void)_stopTimerNotifyingDelegate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSTimer *updateTimer;
  NSTimer *v7;
  NSTimer *v8;
  void *v9;
  int v10;
  NSTimer *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    updateTimer = self->_updateTimer;
    v10 = 138412290;
    v11 = updateTimer;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Stopping update timer: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = self->_updateTimer;
  if (v7)
  {
    -[NSTimer invalidate](v7, "invalidate");
    v8 = self->_updateTimer;
    self->_updateTimer = 0;

    if (v3)
    {
      -[CSTimerViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timerControllerDidStopTimer:", self);

    }
    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  }
}

- (void)_startTimer
{
  NSObject *v3;
  NSTimer *v4;
  NSTimer *updateTimer;
  void *v6;
  NSObject *v7;
  NSTimer *v8;
  id WeakRetained;
  NSObject *v10;
  NSDate *endDate;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CSTimerViewController _stopTimerNotifyingDelegate:](self, "_stopTimerNotifyingDelegate:", 0);
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Starting update timer...", (uint8_t *)&v12, 2u);
  }

  if (self->_enabled && -[CSTimerViewController isEndDateValid](self, "isEndDateValid"))
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateTimerFired, 0, 1, 1.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    updateTimer = self->_updateTimer;
    self->_updateTimer = v4;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTimer:forMode:", self->_updateTimer, *MEMORY[0x1E0C99860]);

    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_updateTimer;
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "Started update timer: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[CSTimerViewController _updateTimerLabelView](self, "_updateTimerLabelView");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "timerControllerDidStartTimer:", self);

    -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  }
  else
  {
    SBLogDashBoard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      endDate = self->_endDate;
      v12 = 138543362;
      v13 = endDate;
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "Unable to start update timer with end date: %{public}@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)_updateTimerFired
{
  NSObject *v3;
  NSDate *endDate;
  id WeakRetained;
  int v6;
  NSDate *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    endDate = self->_endDate;
    v6 = 138543362;
    v7 = endDate;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Update timer fired with end date: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "timerControllerDidUpdateTimer:", self);

  -[CSTimerViewController _updateTimerLabelView](self, "_updateTimerLabelView");
  if (!-[CSTimerViewController isEndDateValid](self, "isEndDateValid"))
    -[CSTimerViewController setEndDate:](self, "setEndDate:", 0);
}

- (void)_updateTimerLabelView
{
  void *v3;
  id v4;

  -[CSTimerViewController timerView](self, "timerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTimerLabel");

  -[CSTimerViewController timerView](self, "timerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

}

- (void)_nextTimerChanged:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "Received next timer changed notification: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[CSTimerViewController _updateNextTimer](self, "_updateNextTimer");
}

- (void)_updateNextTimer
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[MTTimerManager nextTimer](self->_timerManager, "nextTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CSTimerViewController__updateNextTimer__block_invoke;
  v5[3] = &unk_1E8E2FDC8;
  v5[4] = self;
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v5);

}

void __41__CSTimerViewController__updateNextTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CSTimerViewController__updateNextTimer__block_invoke_2;
  v6[3] = &unk_1E8E2DC00;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __41__CSTimerViewController__updateNextTimer__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "nextTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogDashBoard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "Setting next timer: %{public}@ with trigger: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v7, "triggerDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEndDate:", v10);

}

- (CSTimerViewControllerDelegate)delegate
{
  return (CSTimerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end
