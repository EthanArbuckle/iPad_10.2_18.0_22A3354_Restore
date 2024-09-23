@implementation CSLockScreenIdleTimerSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSLockScreenIdleTimerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_increaseNotificationScrollLogging = 1;
  self->_unlockSlideForIdleTimerDisabledPercentage = 0.2;
  self->_unlockSlideForIdleTimerDisabledPercentageIPad = 0.2;
}

+ (id)settingsControlModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[3];
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Notification Scroll"), CFSTR("increaseNotificationScrollLogging"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v25[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v3, CFSTR("Increase Logging For"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueKeyPath:", CFSTR("unlockSlideForIdleTimerDisabledPercentage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v9, CFSTR("Unlock Slide Percentage to Disable Idle Timer (iPhone)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "row");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueKeyPath:", CFSTR("unlockSlideForIdleTimerDisabledPercentageIPad"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minValue:maxValue:", 0.0, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v15, CFSTR("Unlock Slide Percentage to Disable Idle Timer (iPad)"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v22[0] = v4;
  v22[1] = v10;
  v22[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleWithTitle:contents:", CFSTR("Idle Timer Settings"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)increaseNotificationScrollLogging
{
  return self->_increaseNotificationScrollLogging;
}

- (void)setIncreaseNotificationScrollLogging:(BOOL)a3
{
  self->_increaseNotificationScrollLogging = a3;
}

- (double)unlockSlideForIdleTimerDisabledPercentage
{
  return self->_unlockSlideForIdleTimerDisabledPercentage;
}

- (void)setUnlockSlideForIdleTimerDisabledPercentage:(double)a3
{
  self->_unlockSlideForIdleTimerDisabledPercentage = a3;
}

- (double)unlockSlideForIdleTimerDisabledPercentageIPad
{
  return self->_unlockSlideForIdleTimerDisabledPercentageIPad;
}

- (void)setUnlockSlideForIdleTimerDisabledPercentageIPad:(double)a3
{
  self->_unlockSlideForIdleTimerDisabledPercentageIPad = a3;
}

@end
