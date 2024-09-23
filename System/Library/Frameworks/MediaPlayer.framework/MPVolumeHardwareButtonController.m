@implementation MPVolumeHardwareButtonController

- (id)_init
{
  MPVolumeHardwareButtonController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPVolumeHardwareButtonController;
  v2 = -[MPVolumeHardwareButtonController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationDidBecomeActiveNotification, *MEMORY[0x1E0DC4750], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationWillResignActiveNotification, *MEMORY[0x1E0DC4868], 0);

  }
  return v2;
}

- (void)setActiveDataSource:(id)a3
{
  MPVolumeControllerDataSource *v5;
  id *p_activeDataSource;
  NSObject *v7;
  float v8;
  _QWORD block[5];
  uint8_t buf[4];
  MPVolumeControllerDataSource *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (MPVolumeControllerDataSource *)a3;
  p_activeDataSource = (id *)&self->_activeDataSource;
  if (self->_activeDataSource != v5)
  {
    objc_storeStrong((id *)&self->_activeDataSource, a3);
    v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "[HardwareButtonController] Volume dataSource changed to: %{public}@", buf, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[MPVolumeHardwareButtonController cancelVolumeEvent](self, "cancelVolumeEvent");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__MPVolumeHardwareButtonController_setActiveDataSource___block_invoke;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    if (*p_activeDataSource
      && objc_msgSend(*p_activeDataSource, "applicationShouldOverrideHardwareVolumeBehavior"))
    {
      -[MPVolumeHardwareButtonController _registerForButtonNotificationsIfNeeded](self, "_registerForButtonNotificationsIfNeeded");
    }
    else
    {
      -[MPVolumeHardwareButtonController _unregisterForButtonNotificationsIfNeeded](self, "_unregisterForButtonNotificationsIfNeeded");
    }
    -[MPVolumeControllerDataSource reload](self->_activeDataSource, "reload");
    -[MPVolumeControllerDataSource volume](self->_activeDataSource, "volume");
    self->_pendingVolumeChange = v8;
  }

}

- (void)_unregisterForButtonNotificationsIfNeeded
{
  void *v3;
  id v4;

  if (self->_didRegisterForButtonNotifications)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5750], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5758], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5740], 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5748], 0);
    MPUIApplication();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWantsVolumeButtonEvents:", 0);

    self->_didRegisterForButtonNotifications = 0;
  }
}

- (void)cancelVolumeEvent
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
}

- (void)_applicationDidBecomeActiveNotification
{
  MPVolumeControllerDataSource *activeDataSource;

  activeDataSource = self->_activeDataSource;
  if (activeDataSource
    && -[MPVolumeControllerDataSource applicationShouldOverrideHardwareVolumeBehavior](activeDataSource, "applicationShouldOverrideHardwareVolumeBehavior"))
  {
    -[MPVolumeHardwareButtonController _registerForButtonNotificationsIfNeeded](self, "_registerForButtonNotificationsIfNeeded");
  }
  else
  {
    -[MPVolumeHardwareButtonController _unregisterForButtonNotificationsIfNeeded](self, "_unregisterForButtonNotificationsIfNeeded");
  }
}

+ (MPVolumeHardwareButtonController)sharedController
{
  if (sharedController_onceToken_24391 != -1)
    dispatch_once(&sharedController_onceToken_24391, &__block_literal_global_24392);
  return (MPVolumeHardwareButtonController *)(id)sharedController_controller;
}

void __52__MPVolumeHardwareButtonController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPVolumeHardwareButtonController _init]([MPVolumeHardwareButtonController alloc], "_init");
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

}

- (void)_changeVolumeBy:(double)a3
{
  double v3;
  double v4;

  v3 = -a3;
  if (a3 >= 0.0)
    v3 = a3;
  if (v3 > 0.00000011920929)
  {
    v4 = self->_pendingVolumeChange + a3;
    if (v4 < 0.0)
      v4 = 0.0;
    self->_pendingVolumeChange = fmin(v4, 1.0);
    -[MPVolumeHardwareButtonController _commitVolumeChange](self, "_commitVolumeChange");
  }
}

- (void)_commitVolumeChange
{
  NSObject *v3;
  double pendingVolumeChange;
  double v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingVolumeChange = self->_pendingVolumeChange;
    v6 = 134217984;
    v7 = pendingVolumeChange;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[HardwareButtonController] Committing volume change to: %f", (uint8_t *)&v6, 0xCu);
  }

  v5 = self->_pendingVolumeChange;
  *(float *)&v5 = v5;
  -[MPVolumeControllerDataSource setVolume:](self->_activeDataSource, "setVolume:", v5);
  -[MPVolumeHardwareButtonController cancelVolumeEvent](self, "cancelVolumeEvent");
}

- (double)_calculateButtonRepeatDelay
{
  return dbl_193F0CB20[!self->_debounceVolumeRepeat];
}

- (void)increaseVolume
{
  double v3;
  double v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  -[MPVolumeHardwareButtonController _changeVolumeBy:](self, "_changeVolumeBy:", 0.0625);
  -[MPVolumeHardwareButtonController _calculateButtonRepeatDelay](self, "_calculateButtonRepeatDelay");
  v4 = v3;
  v6[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeHardwareButtonController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_increaseVolume, 0, v5, v4);

  self->_debounceVolumeRepeat = 0;
}

- (void)decreaseVolume
{
  double v3;
  double v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
  -[MPVolumeHardwareButtonController _changeVolumeBy:](self, "_changeVolumeBy:", -0.0625);
  -[MPVolumeHardwareButtonController _calculateButtonRepeatDelay](self, "_calculateButtonRepeatDelay");
  v4 = v3;
  v6[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeHardwareButtonController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_decreaseVolume, 0, v5, v4);

  self->_debounceVolumeRepeat = 0;
}

- (void)handleVolumeButtonWithType:(int64_t)a3 down:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("unknown");
    if (a3 == 102)
      v8 = CFSTR("VOL+");
    if (a3 == 103)
      v8 = CFSTR("VOL-");
    v9 = v8;
    v10 = 138543618;
    v11 = v9;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "[HardwareButtonController] Received hardware volume event: %{public}@, pressed: %{BOOL}u", (uint8_t *)&v10, 0x12u);

  }
  if (a3 == 102)
  {
    if (v4)
    {
      -[MPVolumeHardwareButtonController handleVolumeUpButton](self, "handleVolumeUpButton");
      return;
    }
  }
  else
  {
    if (a3 != 103)
      return;
    if (v4)
    {
      -[MPVolumeHardwareButtonController handleVolumeDownButton](self, "handleVolumeDownButton");
      return;
    }
  }
  -[MPVolumeHardwareButtonController cancelVolumeEvent](self, "cancelVolumeEvent");
}

- (void)handleVolumeDownButton
{
  float v3;

  -[MPVolumeControllerDataSource volume](self->_activeDataSource, "volume");
  self->_pendingVolumeChange = v3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  self->_debounceVolumeRepeat = 1;
  -[MPVolumeHardwareButtonController decreaseVolume](self, "decreaseVolume");
}

- (void)handleVolumeUpButton
{
  float v3;

  -[MPVolumeControllerDataSource volume](self->_activeDataSource, "volume");
  self->_pendingVolumeChange = v3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
  self->_debounceVolumeRepeat = 1;
  -[MPVolumeHardwareButtonController increaseVolume](self, "increaseVolume");
}

- (void)_volumeUpButtonTouchDown:(id)a3
{
  -[MPVolumeHardwareButtonController handleVolumeButtonWithType:down:](self, "handleVolumeButtonWithType:down:", 102, 1);
}

- (void)_volumeUpButtonTouchUp:(id)a3
{
  -[MPVolumeHardwareButtonController handleVolumeButtonWithType:down:](self, "handleVolumeButtonWithType:down:", 102, 0);
}

- (void)_volumeDownButtonTouchDown:(id)a3
{
  -[MPVolumeHardwareButtonController handleVolumeButtonWithType:down:](self, "handleVolumeButtonWithType:down:", 103, 1);
}

- (void)_volumeDownButtonTouchUp:(id)a3
{
  -[MPVolumeHardwareButtonController handleVolumeButtonWithType:down:](self, "handleVolumeButtonWithType:down:", 103, 0);
}

- (void)_applicationWillResignActiveNotification
{
  -[MPVolumeHardwareButtonController _unregisterForButtonNotificationsIfNeeded](self, "_unregisterForButtonNotificationsIfNeeded");
  -[MPVolumeHardwareButtonController cancelVolumeEvent](self, "cancelVolumeEvent");
}

- (void)_registerForButtonNotificationsIfNeeded
{
  void *v3;
  id v4;

  if (!self->_didRegisterForButtonNotifications)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__volumeUpButtonTouchDown_, *MEMORY[0x1E0DC5750], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__volumeUpButtonTouchUp_, *MEMORY[0x1E0DC5758], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__volumeDownButtonTouchDown_, *MEMORY[0x1E0DC5740], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__volumeDownButtonTouchUp_, *MEMORY[0x1E0DC5748], 0);
    MPUIApplication();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWantsVolumeButtonEvents:", 1);

    self->_didRegisterForButtonNotifications = 1;
  }
}

- (MPVolumeControllerDataSource)activeDataSource
{
  return self->_activeDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDataSource, 0);
}

uint64_t __56__MPVolumeHardwareButtonController_setActiveDataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelVolumeEvent");
}

@end
