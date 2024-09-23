@implementation MRUHardwareVolumeDataSource

- (MRUHardwareVolumeDataSource)initWithVolumeDataSource:(id)a3
{
  id v5;
  MRUHardwareVolumeDataSource *v6;
  MRUHardwareVolumeDataSource *v7;
  float v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUHardwareVolumeDataSource;
  v6 = -[MRUHardwareVolumeDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumeDataSource, a3);
    -[MPVolumeControllerDataSource volume](v7->_volumeDataSource, "volume");
    v7->_pendingVolumeChange = v8;
  }

  return v7;
}

- (void)consumeSinglePressDownForButtonKind:(int64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = objc_opt_class();
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received volume increase touch down", (uint8_t *)&v6, 0xCu);
    }

    -[MRUHardwareVolumeDataSource handleIncreaseDown](self, "handleIncreaseDown");
  }
  else if (a3 == 4)
  {
    MCLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = objc_opt_class();
      _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received volume decrease touch down", (uint8_t *)&v6, 0xCu);
    }

    -[MRUHardwareVolumeDataSource handleDecreaseDown](self, "handleDecreaseDown");
  }
}

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  NSObject *v3;
  const char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 == 4)
  {
    -[MRUHardwareVolumeDataSource cancelVolumeEvent](self, "cancelVolumeEvent");
    MCLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = objc_opt_class();
      v4 = "%{public}@ received volume decrease touch up";
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 != 3)
      return;
    -[MRUHardwareVolumeDataSource cancelVolumeEvent](self, "cancelVolumeEvent");
    MCLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = objc_opt_class();
      v4 = "%{public}@ received volume increase touch up";
LABEL_7:
      _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    }
  }

}

- (void)handleDecreaseDown
{
  float v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[MPVolumeControllerDataSource volume](self->_volumeDataSource, "volume");
  self->_pendingVolumeChange = v3;
  self->_debounceVolumeRepeat = 1;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  -[MRUHardwareVolumeDataSource calculateButtonRepeatDelay](self, "calculateButtonRepeatDelay");
  v5 = v4;
  v7[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUHardwareVolumeDataSource performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_decreaseVolume, 0, v6, v5);

  -[MRUHardwareVolumeDataSource decreaseVolume](self, "decreaseVolume");
}

- (void)handleIncreaseDown
{
  float v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[MPVolumeControllerDataSource volume](self->_volumeDataSource, "volume");
  self->_pendingVolumeChange = v3;
  self->_debounceVolumeRepeat = 1;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
  -[MRUHardwareVolumeDataSource calculateButtonRepeatDelay](self, "calculateButtonRepeatDelay");
  v5 = v4;
  v7[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUHardwareVolumeDataSource performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel_increaseVolume, 0, v6, v5);

  -[MRUHardwareVolumeDataSource increaseVolume](self, "increaseVolume");
}

- (void)increaseVolume
{
  self->_debounceVolumeRepeat = 0;
  if ((-[MPVolumeControllerDataSource volumeControlCapabilities](self->_volumeDataSource, "volumeControlCapabilities") & 5) != 0)
  {
    -[MPVolumeControllerDataSource beginIncreasingRelativeVolume](self->_volumeDataSource, "beginIncreasingRelativeVolume");
    -[MPVolumeControllerDataSource endIncreasingRelativeVolume](self->_volumeDataSource, "endIncreasingRelativeVolume");
  }
  else
  {
    -[MRUHardwareVolumeDataSource changeVolumeBy:](self, "changeVolumeBy:", 0.0625);
  }
}

- (void)decreaseVolume
{
  self->_debounceVolumeRepeat = 0;
  if ((-[MPVolumeControllerDataSource volumeControlCapabilities](self->_volumeDataSource, "volumeControlCapabilities") & 5) != 0)
  {
    -[MPVolumeControllerDataSource beginDecreasingRelativeVolume](self->_volumeDataSource, "beginDecreasingRelativeVolume");
    -[MPVolumeControllerDataSource endDecreasingRelativeVolume](self->_volumeDataSource, "endDecreasingRelativeVolume");
  }
  else
  {
    -[MRUHardwareVolumeDataSource changeVolumeBy:](self, "changeVolumeBy:", -0.0625);
  }
}

- (void)cancelVolumeEvent
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_increaseVolume, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_decreaseVolume, 0);
}

- (void)changeVolumeBy:(double)a3
{
  double v3;
  double v5;
  NSObject *v6;
  double pendingVolumeChange;
  double v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -a3;
  if (a3 >= 0.0)
    v3 = a3;
  if (v3 > 0.00000011920929)
  {
    v5 = self->_pendingVolumeChange + a3;
    if (v5 < 0.0)
      v5 = 0.0;
    self->_pendingVolumeChange = fmin(v5, 1.0);
    MCLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      pendingVolumeChange = self->_pendingVolumeChange;
      v9 = 134217984;
      v10 = pendingVolumeChange;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "Committing volume change to: %f", (uint8_t *)&v9, 0xCu);
    }

    v8 = self->_pendingVolumeChange;
    *(float *)&v8 = v8;
    -[MPVolumeControllerDataSource setVolume:](self->_volumeDataSource, "setVolume:", v8);
  }
}

- (double)calculateButtonRepeatDelay
{
  return *((double *)&xmmword_1AAAD66D0 + !self->_debounceVolumeRepeat);
}

- (MPVolumeControllerDataSource)volumeDataSource
{
  return self->_volumeDataSource;
}

- (double)pendingVolumeChange
{
  return self->_pendingVolumeChange;
}

- (void)setPendingVolumeChange:(double)a3
{
  self->_pendingVolumeChange = a3;
}

- (BOOL)debounceVolumeRepeat
{
  return self->_debounceVolumeRepeat;
}

- (void)setDebounceVolumeRepeat:(BOOL)a3
{
  self->_debounceVolumeRepeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeDataSource, 0);
}

@end
