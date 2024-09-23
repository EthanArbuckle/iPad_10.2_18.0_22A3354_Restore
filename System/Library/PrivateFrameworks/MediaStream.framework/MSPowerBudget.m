@implementation MSPowerBudget

- (MSPowerBudget)init
{
  MSPowerBudget *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSPowerBudget;
  v2 = -[MSPowerBudget init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MSPowerBudget work queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__MSPowerBudget_setDelegate___block_invoke;
  v7[3] = &unk_1E994DD00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)workQueueSetPushTimerDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MSPowerBudget *v15;
  uint8_t buf[4];
  MSPowerBudget *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSPowerBudget workQueuePushTimerContext](self, "workQueuePushTimerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MSPowerBudget workQueuePushTimerContext](self, "workQueuePushTimerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsValid:", 0);

    -[MSPowerBudget setWorkQueuePushTimerContext:](self, "setWorkQueuePushTimerContext:", 0);
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Stopping push timer.", buf, 0xCu);
      }
      notify_post((const char *)*MEMORY[0x1E0D16D68]);
      -[MSPowerBudget workQueueCommitPersistedValues](self, "workQueueCommitPersistedValues");
      -[MSPowerBudget workQueueRecomputeFileTransferAllowed](self, "workQueueRecomputeFileTransferAllowed");
      goto LABEL_12;
    }
  }
  else if (!v4)
  {
    goto LABEL_12;
  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting push timer to fire in %0.2f seconds.", buf, 0x16u);
  }
  if (!v5)
    notify_post((const char *)*MEMORY[0x1E0D16D70]);
  +[MSPBTimerContext contextWithDate:](MSPBTimerContext, "contextWithDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPowerBudget setWorkQueuePushTimerContext:](self, "setWorkQueuePushTimerContext:", v9);
  v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  -[MSPowerBudget workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__MSPowerBudget_workQueueSetPushTimerDate___block_invoke;
  v13[3] = &unk_1E994DD00;
  v14 = v9;
  v15 = self;
  v12 = v9;
  dispatch_after(v10, v11, v13);

LABEL_12:
}

- (void)workQueueSetPostForegroundTimerDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MSPowerBudget *v15;
  uint8_t buf[4];
  MSPowerBudget *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSPowerBudget workQueuePostForegroundTimerContext](self, "workQueuePostForegroundTimerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MSPowerBudget workQueuePostForegroundTimerContext](self, "workQueuePostForegroundTimerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsValid:", 0);

    -[MSPowerBudget setWorkQueuePostForegroundTimerContext:](self, "setWorkQueuePostForegroundTimerContext:", 0);
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Stopping post-foreground timer.", buf, 0xCu);
      }
      -[MSPowerBudget workQueueCommitPersistedValues](self, "workQueueCommitPersistedValues");
      -[MSPowerBudget workQueueRecomputeFileTransferAllowed](self, "workQueueRecomputeFileTransferAllowed");
      goto LABEL_10;
    }
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting post-foreground timer to fire in %0.2f seconds.", buf, 0x16u);
  }
  +[MSPBTimerContext contextWithDate:](MSPBTimerContext, "contextWithDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPowerBudget setWorkQueuePostForegroundTimerContext:](self, "setWorkQueuePostForegroundTimerContext:", v9);
  v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  -[MSPowerBudget workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__MSPowerBudget_workQueueSetPostForegroundTimerDate___block_invoke;
  v13[3] = &unk_1E994DD00;
  v14 = v9;
  v15 = self;
  v12 = v9;
  dispatch_after(v10, v11, v13);

LABEL_10:
}

- (void)workQueueSetGlobalResetSyncTimerDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MSPowerBudget *v15;
  uint8_t buf[4];
  MSPowerBudget *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSPowerBudget workQueueGlobalResetSyncTimerContext](self, "workQueueGlobalResetSyncTimerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MSPowerBudget workQueueGlobalResetSyncTimerContext](self, "workQueueGlobalResetSyncTimerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsValid:", 0);

    -[MSPowerBudget setWorkQueueGlobalResetSyncTimerContext:](self, "setWorkQueueGlobalResetSyncTimerContext:", 0);
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Stopping global reset sync timer.", buf, 0xCu);
      }
      -[MSPowerBudget workQueueCommitPersistedValues](self, "workQueueCommitPersistedValues");
      -[MSPowerBudget workQueueRecomputeFileTransferAllowed](self, "workQueueRecomputeFileTransferAllowed");
      goto LABEL_10;
    }
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2048;
    v19 = v8;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting global reset sync timer to fire in %0.2f seconds.", buf, 0x16u);
  }
  +[MSPBTimerContext contextWithDate:](MSPBTimerContext, "contextWithDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPowerBudget setWorkQueueGlobalResetSyncTimerContext:](self, "setWorkQueueGlobalResetSyncTimerContext:", v9);
  v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  -[MSPowerBudget workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__MSPowerBudget_workQueueSetGlobalResetSyncTimerDate___block_invoke;
  v13[3] = &unk_1E994DD00;
  v14 = v9;
  v15 = self;
  v12 = v9;
  dispatch_after(v10, v11, v13);

LABEL_10:
}

- (void)shutDown
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MSPowerBudget_shutDown__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (double)maxActiveTimeAfterPush
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MSPowerBudget_maxActiveTimeAfterPush__block_invoke;
  v6[3] = &unk_1E994DA38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMaxActiveTimeAfterPush:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  MSPowerBudget *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting max active time after push to %0.2f seconds.", buf, 0x16u);
  }
  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__MSPowerBudget_setMaxActiveTimeAfterPush___block_invoke;
  v6[3] = &unk_1E994DA60;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (double)workQueueMaxActiveTimeAfterPush
{
  return self->_maxActiveTimeAfterPush;
}

- (double)maxActiveTimeAfterGlobalResetSync
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MSPowerBudget_maxActiveTimeAfterGlobalResetSync__block_invoke;
  v6[3] = &unk_1E994DA38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMaxActiveTimeAfterGlobalResetSync:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  MSPowerBudget *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting max active time after global reset sync to %0.2f seconds.", buf, 0x16u);
  }
  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MSPowerBudget_setMaxActiveTimeAfterGlobalResetSync___block_invoke;
  v6[3] = &unk_1E994DA60;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (double)workQueueMaxActiveTimeAfterGlobalResetSync
{
  return self->_maxActiveTimeAfterGlobalResetSync;
}

- (double)maxActiveTimeAfterLossOfForeground
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MSPowerBudget_maxActiveTimeAfterLossOfForeground__block_invoke;
  v6[3] = &unk_1E994DA38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMaxActiveTimeAfterLossOfForeground:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  MSPowerBudget *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting max active time after loss of foreground to %0.2f seconds.", buf, 0x16u);
  }
  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__MSPowerBudget_setMaxActiveTimeAfterLossOfForeground___block_invoke;
  v6[3] = &unk_1E994DA60;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (double)workQueueMaxActiveTimeAfterLossOfForeground
{
  return self->_maxActiveTimeAfterLossOfForeground;
}

- (void)workQueueRecomputeFileTransferAllowed
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[MSPowerBudget workQueueIsExternalPowered](self, "workQueueIsExternalPowered")
    || -[MSPowerBudget workQueueIsForeground](self, "workQueueIsForeground"))
  {
    v3 = 1;
  }
  else
  {
    -[MSPowerBudget workQueuePushTimerContext](self, "workQueuePushTimerContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v3 = 1;
    }
    else
    {
      -[MSPowerBudget workQueuePostForegroundTimerContext](self, "workQueuePostForegroundTimerContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v3 = 1;
      }
      else
      {
        -[MSPowerBudget workQueueGlobalResetSyncTimerContext](self, "workQueueGlobalResetSyncTimerContext");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v6 != 0;

      }
    }

  }
  -[MSPowerBudget setIsFileTransferAllowed:](self, "setIsFileTransferAllowed:", v3);
}

- (BOOL)isFileTransferAllowed
{
  MSPowerBudget *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MSPowerBudget_isFileTransferAllowed__block_invoke;
  v5[3] = &unk_1E994DA38;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasForegroundFocus
{
  MSPowerBudget *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MSPowerBudget_hasForegroundFocus__block_invoke;
  v5[3] = &unk_1E994DA38;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasActiveTimers
{
  MSPowerBudget *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MSPowerBudget_hasActiveTimers__block_invoke;
  v5[3] = &unk_1E994DA38;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)workQueueSetIsFileTransferAllowed:(BOOL)a3
{
  self->_workQueueIsFileTransferAllowed = a3;
}

- (void)setIsFileTransferAllowed:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke;
  v6[3] = &unk_1E994DA88;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)workQueueCommitPersistedValues
{
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
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPowerBudget workQueuePushTimerContext](self, "workQueuePushTimerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSPowerBudget workQueuePushTimerContext](self, "workQueuePushTimerContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v5, CFSTR("pushTimerDate"));

  }
  -[MSPowerBudget workQueuePostForegroundTimerContext](self, "workQueuePostForegroundTimerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSPowerBudget workQueuePostForegroundTimerContext](self, "workQueuePostForegroundTimerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("postForegroundTimerDate"));

  }
  -[MSPowerBudget workQueueGlobalResetSyncTimerContext](self, "workQueueGlobalResetSyncTimerContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MSPowerBudget workQueueGlobalResetSyncTimerContext](self, "workQueueGlobalResetSyncTimerContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("globalResetSyncTimerDate"));

  }
  -[MSPowerBudget delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MSPowerBudget:didRequestStorageOfPersistedValues:", self, v13);

}

- (void)didReceivePushNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MSPowerBudget_didReceivePushNotification__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didBeginForegroundFocus
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSPowerBudget_didBeginForegroundFocus__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didEndForegroundFocus
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MSPowerBudget_didEndForegroundFocus__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didReceiveGlobalResetSync
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MSPowerBudget_didReceiveGlobalResetSync__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didBeginExternalPower
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MSPowerBudget_didBeginExternalPower__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didEndExternalPower
{
  NSObject *v3;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MSPowerBudget_didEndExternalPower__block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MSPowerBudget_setFocusAlbumGUID___block_invoke;
  v7[3] = &unk_1E994DD00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSPowerBudget workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MSPowerBudget_setFocusAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E994DD00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_postForegroundTimerDidExpire:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MSPowerBudget__postForegroundTimerDidExpire___block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_globalResetSyncTimerDidExpire:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[MSPowerBudget workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MSPowerBudget__globalResetSyncTimerDidExpire___block_invoke;
  block[3] = &unk_1E994DA10;
  block[4] = self;
  dispatch_async(v4, block);

}

- (MSPowerBudgetDelegate)delegate
{
  return (MSPowerBudgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)focusAlbumGUID
{
  return self->_focusAlbumGUID;
}

- (NSString)focusAssetCollectionGUID
{
  return self->_focusAssetCollectionGUID;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (BOOL)workQueueIsFileTransferAllowed
{
  return self->_workQueueIsFileTransferAllowed;
}

- (void)workQueueSetFileTransferAllowed:(BOOL)a3
{
  self->_workQueueIsFileTransferAllowed = a3;
}

- (BOOL)workQueueIsExternalPowered
{
  return self->_workQueueIsExternalPowered;
}

- (void)workQueueSetExternalPowered:(BOOL)a3
{
  self->_workQueueIsExternalPowered = a3;
}

- (BOOL)workQueueIsForeground
{
  return self->_workQueueIsForeground;
}

- (void)workQueueSetForeground:(BOOL)a3
{
  self->_workQueueIsForeground = a3;
}

- (MSPBTimerContext)workQueuePushTimerContext
{
  return self->_workQueuePushTimerContext;
}

- (void)setWorkQueuePushTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workQueuePushTimerContext, a3);
}

- (MSPBTimerContext)workQueuePostForegroundTimerContext
{
  return self->_workQueuePostForegroundTimerContext;
}

- (void)setWorkQueuePostForegroundTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workQueuePostForegroundTimerContext, a3);
}

- (MSPBTimerContext)workQueueGlobalResetSyncTimerContext
{
  return self->_workQueueGlobalResetSyncTimerContext;
}

- (void)setWorkQueueGlobalResetSyncTimerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workQueueGlobalResetSyncTimerContext, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_workQueueGlobalResetSyncTimerContext, 0);
  objc_storeStrong((id *)&self->_workQueuePostForegroundTimerContext, 0);
  objc_storeStrong((id *)&self->_workQueuePushTimerContext, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_focusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __48__MSPowerBudget__globalResetSyncTimerDidExpire___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: Global reset sync timer expired.", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetGlobalResetSyncTimerDate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

uint64_t __47__MSPowerBudget__postForegroundTimerDidExpire___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Post-foreground timer expired.", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetPostForegroundTimerDate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

void __45__MSPowerBudget_setFocusAssetCollectionGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v2;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: UI focus on asset collection GUID: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "focusAssetCollectionGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
  }
}

void __35__MSPowerBudget_setFocusAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v2;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: UI focus on album GUID: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "focusAlbumGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
  }
}

uint64_t __36__MSPowerBudget_didEndExternalPower__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: Unplugged from external power.", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetExternalPowered:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

uint64_t __38__MSPowerBudget_didBeginExternalPower__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: Plugged in to external power. Allowing file transfers.", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetExternalPowered:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

void __42__MSPowerBudget_didReceiveGlobalResetSync__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "workQueueMaxActiveTimeAfterGlobalResetSync");
    v7 = 138412546;
    v8 = v2;
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: Global reset sync received. Allowing file transfers to continue for %0.2f seconds.", (uint8_t *)&v7, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "workQueueMaxActiveTimeAfterGlobalResetSync");
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueueSetGlobalResetSyncTimerDate:", v6);

}

uint64_t __38__MSPowerBudget_didEndForegroundFocus__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "workQueueMaxActiveTimeAfterLossOfForeground");
    v8 = 138412546;
    v9 = v2;
    v10 = 2048;
    v11 = v3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: UI no longer foregrounded. Allowing file transfers to continue for %0.2f seconds.", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetForeground:", 0);
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "workQueueMaxActiveTimeAfterLossOfForeground");
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueueSetPostForegroundTimerDate:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

void __40__MSPowerBudget_didBeginForegroundFocus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v2;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: UI foregrounded. Allowing file transfers.", (uint8_t *)&v7, 0xCu);
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "workQueueIsForeground");
  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "workQueueSetForeground:", 1);
    objc_msgSend(*(id *)(a1 + 32), "workQueueSetPostForegroundTimerDate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
  }
  else
  {
    v5 = objc_msgSend(v4, "workQueueIsExternalPowered");
    objc_msgSend(*(id *)(a1 + 32), "workQueueSetForeground:", 1);
    objc_msgSend(*(id *)(a1 + 32), "workQueueSetPostForegroundTimerDate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "MSPowerBudgetGotSignificantEvent:", *(_QWORD *)(a1 + 32));

    }
  }
}

uint64_t __43__MSPowerBudget_didReceivePushNotification__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "workQueueMaxActiveTimeAfterPush");
    v8 = 138412546;
    v9 = v2;
    v10 = 2048;
    v11 = v3;
    _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@: Push received. Allowing file transfers to continue for %0.2f seconds", (uint8_t *)&v8, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "workQueueMaxActiveTimeAfterPush");
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueueSetPushTimerDate:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

void __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  void (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(v1 + 8);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v1;
      v11 = 1024;
      v12 = v3;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Setting file transfers allowed = %d", buf, 0x12u);
      v1 = *(_QWORD *)(a1 + 32);
      v2 = *(unsigned __int8 *)(v1 + 8);
      LOBYTE(v3) = *(_BYTE *)(a1 + 40);
    }
    *(_BYTE *)(v1 + 8) = v3;
    if (v2)
    {
      if (*(_BYTE *)(a1 + 40))
        return;
      v8 = MEMORY[0x1E0C809B0];
      v5 = __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_31;
      v6 = &v8;
    }
    else
    {
      if (!*(_BYTE *)(a1 + 40))
        return;
      v7 = MEMORY[0x1E0C809B0];
      v5 = __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_2;
      v6 = &v7;
    }
    v6[1] = 3221225472;
    v6[2] = (uint64_t)v5;
    v6[3] = (uint64_t)&unk_1E994DA10;
    v6[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

void __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSPowerBudgetDidBeginAllowingFileTransferNotification"), *(_QWORD *)(a1 + 32));

}

void __42__MSPowerBudget_setIsFileTransferAllowed___block_invoke_31(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSPowerBudgetDidEndAllowingFileTransferNotification"), *(_QWORD *)(a1 + 32));

}

void __32__MSPowerBudget_hasActiveTimers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "workQueuePushTimerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueuePostForegroundTimerContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "workQueueGlobalResetSyncTimerContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

    }
    v2 = 0;
  }

}

uint64_t __35__MSPowerBudget_hasForegroundFocus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "workQueueIsForeground");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __38__MSPowerBudget_isFileTransferAllowed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

double __55__MSPowerBudget_setMaxActiveTimeAfterLossOfForeground___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

double __51__MSPowerBudget_maxActiveTimeAfterLossOfForeground__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __54__MSPowerBudget_setMaxActiveTimeAfterGlobalResetSync___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

double __50__MSPowerBudget_maxActiveTimeAfterGlobalResetSync__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 40);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double __43__MSPowerBudget_setMaxActiveTimeAfterPush___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

double __39__MSPowerBudget_maxActiveTimeAfterPush__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __25__MSPowerBudget_shutDown__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetPushTimerDate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "workQueueSetPostForegroundTimerDate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "workQueueSetGlobalResetSyncTimerDate:", 0);
}

uint64_t __54__MSPowerBudget_workQueueSetGlobalResetSyncTimerDate___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Global reset sync timer fired.", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "setWorkQueueGlobalResetSyncTimerContext:", 0);
    objc_msgSend(*(id *)(a1 + 40), "workQueueCommitPersistedValues");
    return objc_msgSend(*(id *)(a1 + 40), "workQueueRecomputeFileTransferAllowed");
  }
  return result;
}

uint64_t __53__MSPowerBudget_workQueueSetPostForegroundTimerDate___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Post-foreground timer fired.", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "setWorkQueuePostForegroundTimerContext:", 0);
    objc_msgSend(*(id *)(a1 + 40), "workQueueCommitPersistedValues");
    return objc_msgSend(*(id *)(a1 + 40), "workQueueRecomputeFileTransferAllowed");
  }
  return result;
}

uint64_t __43__MSPowerBudget_workQueueSetPushTimerDate___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Push timer fired.", (uint8_t *)&v4, 0xCu);
    }
    notify_post((const char *)*MEMORY[0x1E0D16D68]);
    objc_msgSend(*(id *)(a1 + 40), "setWorkQueuePushTimerContext:", 0);
    objc_msgSend(*(id *)(a1 + 40), "workQueueCommitPersistedValues");
    return objc_msgSend(*(id *)(a1 + 40), "workQueueRecomputeFileTransferAllowed");
  }
  return result;
}

void __29__MSPowerBudget_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MSPowerBudgetDidRequestPersistedValues:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v9, "objectForKey:", CFSTR("pushTimerDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueueSetPushTimerDate:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v9, "objectForKey:", CFSTR("postForegroundTimerDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueueSetPostForegroundTimerDate:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v9, "objectForKey:", CFSTR("globalResetSyncTimerDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueueSetGlobalResetSyncTimerDate:", v8);

  objc_msgSend(*(id *)(a1 + 32), "workQueueRecomputeFileTransferAllowed");
}

@end
