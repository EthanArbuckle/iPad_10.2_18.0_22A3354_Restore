@implementation MTTimerMigrator

- (void)migrateFromOldStorage
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  MTMutableTimer *v10;
  void *v11;
  void *v12;
  MTTimer *timer;
  int v14;
  MTTimerMigrator *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = MTIsHorseman();
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping migration from old storage, as this device doesn't support the old storage", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating old timers to storage", (uint8_t *)&v14, 0xCu);
    }

    +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadLegacyData");

    +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultDuration");
    v9 = v8;

    +[MTTimerManager setDefaultDuration:](MTTimerManager, "setDefaultDuration:", v9);
    v10 = -[MTTimer initWithState:duration:]([MTMutableTimer alloc], "initWithState:duration:", 1, v9);
    -[MTTimer setTitle:](v10, "setTitle:", CFSTR("CURRENT_TIMER"));
    +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultSound");
    v4 = objc_claimAutoreleasedReturnValue();

    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v4, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimer setSound:](v10, "setSound:", v12);

    timer = self->_timer;
    self->_timer = &v10->super;

  }
}

- (void)removeFromOldStorage
{
  NSObject *v3;
  void *v4;
  int v5;
  MTTimerMigrator *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ removing old timers and notifications from storage", (uint8_t *)&v5, 0xCu);
  }

  +[MTLegacyManager sharedManager](MTLegacyManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purgeLegacyData");

}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
