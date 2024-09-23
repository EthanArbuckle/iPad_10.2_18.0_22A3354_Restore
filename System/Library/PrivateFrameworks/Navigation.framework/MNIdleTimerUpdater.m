@implementation MNIdleTimerUpdater

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_notMovingTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MNIdleTimerUpdater;
  -[MNIdleTimerUpdater dealloc](&v3, sel_dealloc);
}

- (void)setNavigationSessionState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  MNNavigationSessionState *v9;
  MNNavigationSessionState *navigationSessionState;
  NSObject *v11;
  _BOOL4 isArrived;
  NSObject *v13;
  NSTimer *notMovingTimer;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MNIdleTimerUpdater _shouldEnableIdleTimerForArrivalState:](self, "_shouldEnableIdleTimerForArrivalState:", objc_msgSend(v4, "arrivalState"));
  -[MNNavigationSessionState location](self->_navigationSessionState, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MNIdleTimerUpdater _shouldEnableIdleTimerForArrivalState:](self, "_shouldEnableIdleTimerForArrivalState:", -[MNNavigationSessionState arrivalState](self->_navigationSessionState, "arrivalState"));
  v9 = (MNNavigationSessionState *)objc_msgSend(v4, "copy");

  navigationSessionState = self->_navigationSessionState;
  self->_navigationSessionState = v9;

  self->_isArrived = v6;
  if (v6 != v8)
  {
    MNGetMNIdleTimerUpdaterLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      isArrived = self->_isArrived;
      v15[0] = 67109120;
      v15[1] = isArrived;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "isArrived changed: %d", (uint8_t *)v15, 8u);
    }

    if (!self->_isArrived)
    {
      MNGetMNIdleTimerUpdaterLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_DEFAULT, "Left arrival state. Cancelling timers and setting shouldEnableIdleTimer to NO.", (uint8_t *)v15, 2u);
      }

      -[NSTimer invalidate](self->_notMovingTimer, "invalidate");
      notMovingTimer = self->_notMovingTimer;
      self->_notMovingTimer = 0;

      -[MNIdleTimerUpdater _updateShouldEnableIdleTimer:](self, "_updateShouldEnableIdleTimer:", 0);
    }
  }
  if (v5 != v7)
    -[MNIdleTimerUpdater _updateForLocation:](self, "_updateForLocation:", v5);

}

- (void)updateForStartNavigation
{
  MNIdleTimerUpdaterDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  *(_WORD *)&self->_isStarted = 1;
  self->_shouldEnableIdleTimer = 0;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "idleTimerUpdater:shouldEnableIdleTimer:", self, 0);

  }
}

- (void)_updateShouldEnableIdleTimer:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_shouldEnableIdleTimer != a3)
  {
    v3 = a3;
    MNGetMNIdleTimerUpdaterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "Setting shouldEnableIdleTimer to %d.", (uint8_t *)v9, 8u);
    }

    self->_shouldEnableIdleTimer = v3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "idleTimerUpdater:shouldEnableIdleTimer:", self, v3);

    }
  }
}

- (void)_updateForLocation:(id)a3
{
  id v4;
  void *v5;
  NSTimer *notMovingTimer;
  double v7;
  NSObject *v8;
  NSTimer *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSTimer *v14;
  NSTimer *v15;
  _QWORD v16[4];
  id v17[2];
  id buf[2];

  v4 = a3;
  v5 = v4;
  if (self->_isStarted && v4 && self->_isArrived)
  {
    objc_msgSend(v4, "speed");
    notMovingTimer = self->_notMovingTimer;
    if (v7 <= 0.0)
    {
      if (!notMovingTimer)
      {
        GEOConfigGetDouble();
        v11 = v10;
        MNGetMNIdleTimerUpdaterLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "Location stopped in arrival state. Starting timer.", (uint8_t *)buf, 2u);
        }

        objc_initWeak(buf, self);
        v13 = (void *)MEMORY[0x1E0C99E88];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __41__MNIdleTimerUpdater__updateForLocation___block_invoke;
        v16[3] = &unk_1E61D1BE0;
        v17[1] = v11;
        objc_copyWeak(v17, buf);
        objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v16, *(double *)&v11);
        v14 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        v15 = self->_notMovingTimer;
        self->_notMovingTimer = v14;

        objc_destroyWeak(v17);
        objc_destroyWeak(buf);
      }
    }
    else if (notMovingTimer)
    {
      MNGetMNIdleTimerUpdaterLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Cancelling notMovingTimer because locations are moving again.", (uint8_t *)buf, 2u);
      }

      -[NSTimer invalidate](self->_notMovingTimer, "invalidate");
      v9 = self->_notMovingTimer;
      self->_notMovingTimer = 0;

    }
  }

}

void __41__MNIdleTimerUpdater__updateForLocation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BYTE *WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MNGetMNIdleTimerUpdaterLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "In arrival state and locations stopped for %g seconds. Triggering shouldEnableIdleTimer.", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[8] = 0;
    objc_msgSend(WeakRetained, "_updateShouldEnableIdleTimer:", 1);
  }

}

- (BOOL)_shouldEnableIdleTimerForArrivalState:(int64_t)a3
{
  return a3 == 4;
}

- (MNIdleTimerUpdaterDelegate)delegate
{
  return (MNIdleTimerUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notMovingTimer, 0);
}

@end
