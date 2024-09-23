@implementation MTCCTimerModule

- (void)reloadTimerState
{
  MEMORY[0x24BEDD108](self, sel_reloadTimerStateUpdateDuration_, 0);
}

- (void)reloadTimerStateAndUpdateDuration
{
  MEMORY[0x24BEDD108](self, sel_reloadTimerStateUpdateDuration_, 1);
}

- (MTCCTimerModule)init
{
  MTCCTimerModule *v2;
  NSObject *v3;
  MTCCTimerViewController *v4;
  MTCCTimerViewController *timerViewController;
  const char *v6;
  MTCCTimerBackgroundViewController *v7;
  MTCCTimerBackgroundViewController *timerBackgroundViewController;
  const char *v9;
  uint64_t v10;
  MTTimerManager *timerManager;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  objc_super v23;
  uint8_t buf[4];
  MTCCTimerModule *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)MTCCTimerModule;
  v2 = -[CCUIAppLauncherModule init](&v23, sel_init);
  if (v2)
  {
    MTLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v2;
      _os_log_impl(&dword_23102D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Initialized", buf, 0xCu);
    }

    v4 = objc_alloc_init(MTCCTimerViewController);
    timerViewController = v2->_timerViewController;
    v2->_timerViewController = v4;

    objc_msgSend_setDelegate_(v2->_timerViewController, v6, (uint64_t)v2);
    v7 = objc_alloc_init(MTCCTimerBackgroundViewController);
    timerBackgroundViewController = v2->_timerBackgroundViewController;
    v2->_timerBackgroundViewController = v7;

    objc_msgSend_setDelegate_(v2->_timerBackgroundViewController, v9, (uint64_t)v2);
    v10 = objc_opt_new();
    timerManager = v2->_timerManager;
    v2->_timerManager = (MTTimerManager *)v10;

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)v2, sel_reloadTimerState, *MEMORY[0x24BE677F8], 0);

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v18, v19, (uint64_t)v2, sel_reloadTimerStateAndUpdateDuration, *MEMORY[0x24BE677E0], 0);

    objc_msgSend_reloadTimerState(v2, v20, v21);
  }
  return v2;
}

- (void)reloadTimerStateUpdateDuration:(BOOL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;
  _QWORD v13[5];
  BOOL v14;

  objc_msgSend_timers(self->_timerManager, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mtMainThreadScheduler(MEMORY[0x24BE6B628], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reschedule_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23102E788;
  v13[3] = &unk_24FFE6408;
  v13[4] = self;
  v14 = a3;
  v12 = (id)objc_msgSend_addSuccessBlock_(v10, v11, (uint64_t)v13);

}

- (id)launchURLForTouchType:(int64_t)a3
{
  void *v3;
  objc_super v5;

  if (self->_addButtonTapped)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("clock-timer:add"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTCCTimerModule;
    -[CCUIAppLauncherModule launchURLForTouchType:](&v5, sel_launchURLForTouchType_, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)timerDidChange:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  MTCCTimerModule *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  MTLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_23102D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer did change notification received", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend_reloadTimerState(self, v5, v6);
}

- (void)timerViewController:(id)a3 timerDidChange:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;
  _QWORD v13[5];

  objc_msgSend_processChangesForNewState_(self, a2, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mtMainThreadScheduler(MEMORY[0x24BE6B628], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reschedule_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23102EB08;
  v13[3] = &unk_24FFE6430;
  v13[4] = self;
  v12 = (id)objc_msgSend_addSuccessBlock_(v10, v11, (uint64_t)v13);

}

- (void)timerViewControllerButtonTapped:(id)a3 withEvent:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int v17;
  MTCCTimerModule *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  MTLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_23102D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling start/stop button tapped", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend_allTouches(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_anyObject(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_addButtonTapped = 0;
  v15 = objc_msgSend_type(v12, v13, v14);
  objc_msgSend_handleTapWithTouchType_(self, v16, v15);

}

- (void)timerViewController:(id)a3 didExpand:(BOOL)a4
{
  self->_canOverrideCurrent = !a4;
  objc_msgSend_reloadTimerState(self, a2, (uint64_t)a3);
}

- (void)timerBackgroundViewController:(id)a3 timerDidChange:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;
  _QWORD v13[5];

  objc_msgSend_processChangesForNewState_(self, a2, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mtMainThreadScheduler(MEMORY[0x24BE6B628], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reschedule_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_23102ED28;
  v13[3] = &unk_24FFE6430;
  v13[4] = self;
  v12 = (id)objc_msgSend_addSuccessBlock_(v10, v11, (uint64_t)v13);

}

- (void)timerBackgroundViewControllerAddButtonTapped:(id)a3 withEvent:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int v17;
  MTCCTimerModule *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  MTLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = self;
    _os_log_impl(&dword_23102D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling add button tapped", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend_allTouches(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_anyObject(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_addButtonTapped = 1;
  v15 = objc_msgSend_type(v12, v13, v14);
  objc_msgSend_handleTapWithTouchType_(self, v16, v15);

}

- (double)defaultDuration
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  double valuePtr;

  v2 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("MTCCTimerDefaultDuration"), CFSTR("com.apple.mobiletimer"));
  if (!v2)
    return 900.0;
  v3 = v2;
  valuePtr = 0.0;
  if (!CFNumberGetValue(v2, kCFNumberDoubleType, &valuePtr))
    valuePtr = 900.0;
  CFRelease(v3);
  return valuePtr;
}

- (void)setDefaultDuration:(double)a3
{
  CFNumberRef v3;
  double valuePtr;

  valuePtr = a3;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberDoubleType, &valuePtr);
  CFPreferencesSetAppValue(CFSTR("MTCCTimerDefaultDuration"), v3, CFSTR("com.apple.mobiletimer"));
  if (v3)
    CFRelease(v3);
}

+ (id)firstThatMatches:(id)a3 fromTimers:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_23102F00C;
    v10[3] = &unk_24FFE6458;
    v11 = v5;
    objc_msgSend_na_firstObjectPassingTest_(a4, v7, (uint64_t)v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)processChangesForNewState:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  objc_msgSend_latestDuration(self->_timerManager, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainThreadScheduler(MEMORY[0x24BE6B628], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reschedule_(v7, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_23102F170;
  v17[3] = &unk_24FFE64A8;
  v17[4] = self;
  v18 = v4;
  v13 = v4;
  objc_msgSend_flatMap_(v12, v14, (uint64_t)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (MTCCTimerViewController)timerViewController
{
  return self->_timerViewController;
}

- (void)setTimerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_timerViewController, a3);
}

- (MTCCTimerBackgroundViewController)timerBackgroundViewController
{
  return self->_timerBackgroundViewController;
}

- (void)setTimerBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_timerBackgroundViewController, a3);
}

- (MTCCTimer)currentTimer
{
  return self->_currentTimer;
}

- (void)setCurrentTimer:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimer, a3);
}

- (BOOL)addButtonTapped
{
  return self->_addButtonTapped;
}

- (void)setAddButtonTapped:(BOOL)a3
{
  self->_addButtonTapped = a3;
}

- (BOOL)canOverrideCurrent
{
  return self->_canOverrideCurrent;
}

- (void)setCanOverrideCurrent:(BOOL)a3
{
  self->_canOverrideCurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_timerBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_timerViewController, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end
