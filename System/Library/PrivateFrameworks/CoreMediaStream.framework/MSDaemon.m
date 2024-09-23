@implementation MSDaemon

- (MSDaemon)init
{
  MSDaemon *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *idleCountQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDaemon;
  v2 = -[MSDaemon init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MSDaemon idle count queue", 0);
    idleCountQueue = v2->_idleCountQueue;
    v2->_idleCountQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)retainBusy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__MSDaemon_retainBusy__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)releaseBusy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MSDaemon_releaseBusy__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)isBusy
{
  MSDaemon *v2;
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
  -[MSDaemon idleCountQueue](self, "idleCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__MSDaemon_isBusy__block_invoke;
  v5[3] = &unk_1E95BCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)retainUIBusy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__MSDaemon_retainUIBusy__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)releaseUIBusy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MSDaemon_releaseUIBusy__block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_didChangeIdleBusyState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  MSDaemon *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  -[MSDaemon hysteresisTimer](self, "hysteresisTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "invalidate");

    -[MSDaemon setHysteresisTimer:](self, "setHysteresisTimer:", 0);
    if (!-[MSDaemon stabilizedIsBusy](self, "stabilizedIsBusy"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v11 = self;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Hysteresis-stabilized unidled.", buf, 0xCu);
      }
      -[MSDaemon setStabilizedIsBusy:](self, "setStabilizedIsBusy:", 1);
      -[MSDaemon stabilizedDidUnidle](self, "stabilizedDidUnidle");
    }
  }
  else
  {

    if (v6)
    {
      -[MSDaemon hysteresisTimer](self, "hysteresisTimer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFireDate:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__hysteresisTimerDidFire_, 0, 0, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSDaemon setHysteresisTimer:](self, "setHysteresisTimer:", v8);

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[MSDaemon hysteresisTimer](self, "hysteresisTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTimer:forMode:", v7, *MEMORY[0x1E0C99860]);
    }

  }
}

- (void)didIdle
{
  -[MSDaemon _didChangeIdleBusyState:](self, "_didChangeIdleBusyState:", 0);
}

- (void)didUnidle
{
  -[MSDaemon _didChangeIdleBusyState:](self, "_didChangeIdleBusyState:", 1);
}

- (void)_hysteresisTimerDidFire:(id)a3
{
  void *v4;
  int v5;
  MSDaemon *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[MSDaemon hysteresisTimer](self, "hysteresisTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[MSDaemon setHysteresisTimer:](self, "setHysteresisTimer:", 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ Hysteresis-stabilized idled.", (uint8_t *)&v5, 0xCu);
  }
  -[MSDaemon setStabilizedIsBusy:](self, "setStabilizedIsBusy:", 0);
  -[MSDaemon stabilizedDidIdle](self, "stabilizedDidIdle");
}

- (int)busyCount
{
  return self->_busyCount;
}

- (void)setBusyCount:(int)a3
{
  self->_busyCount = a3;
}

- (int)UIBusyCount
{
  return self->_UIBusyCount;
}

- (void)setUIBusyCount:(int)a3
{
  self->_UIBusyCount = a3;
}

- (OS_dispatch_queue)idleCountQueue
{
  return self->_idleCountQueue;
}

- (void)setIdleCountQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idleCountQueue, a3);
}

- (NSTimer)hysteresisTimer
{
  return self->_hysteresisTimer;
}

- (void)setHysteresisTimer:(id)a3
{
  objc_storeStrong((id *)&self->_hysteresisTimer, a3);
}

- (BOOL)stabilizedIsBusy
{
  return self->_stabilizedIsBusy;
}

- (void)setStabilizedIsBusy:(BOOL)a3
{
  self->_stabilizedIsBusy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hysteresisTimer, 0);
  objc_storeStrong((id *)&self->_idleCountQueue, 0);
}

void __25__MSDaemon_releaseUIBusy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _DWORD *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  _QWORD v10[8];
  _QWORD v11[3];
  int v12;
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "idleCountQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__MSDaemon_releaseUIBusy__block_invoke_2;
  v10[3] = &unk_1E95BC8B0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = &v15;
  v10[6] = v13;
  v10[7] = v11;
  dispatch_sync(v2, v10);

  if (*((_DWORD *)v16 + 6))
  {
    v3 = *(_DWORD **)(a1 + 32);
    if (!v3[4] && !v3[3])
      objc_msgSend(v3, "didIdle");
  }
  v4 = MEMORY[0x1E0C81028];
  v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_DWORD *)(v7 + 12);
    LODWORD(v7) = *(_DWORD *)(v7 + 16);
    *(_DWORD *)buf = 138543874;
    v20 = v6;
    v21 = 1024;
    v22 = v8;
    v23 = 1024;
    v24 = v7;
    v9 = v6;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ Releasing UI busy count. Now busy = %d, UI busy = %d", buf, 0x18u);

  }
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
}

_QWORD *__25__MSDaemon_releaseUIBusy__block_invoke_2(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 16))--;
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  return result;
}

void __24__MSDaemon_retainUIBusy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "idleCountQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __24__MSDaemon_retainUIBusy__block_invoke_2;
  v9[3] = &unk_1E95BC8B0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(v2, v9);

  if (!*((_DWORD *)v19 + 6) && *((_DWORD *)v15 + 6) && !*((_DWORD *)v11 + 6))
    objc_msgSend(*(id *)(a1 + 32), "didUnidle");
  v3 = MEMORY[0x1E0C81028];
  v4 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(v6 + 12);
    LODWORD(v6) = *(_DWORD *)(v6 + 16);
    *(_DWORD *)buf = 138543874;
    v23 = v5;
    v24 = 1024;
    v25 = v7;
    v26 = 1024;
    v27 = v6;
    v8 = v5;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ Retaining UI busy count. Now busy = %d, UI busy = %d", buf, 0x18u);

  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

_QWORD *__24__MSDaemon_retainUIBusy__block_invoke_2(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 16))++;
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  return result;
}

uint64_t __18__MSDaemon_isBusy__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 12) != 0;
  return result;
}

void __23__MSDaemon_releaseBusy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "idleCountQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __23__MSDaemon_releaseBusy__block_invoke_2;
  v9[3] = &unk_1E95BC8B0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(v2, v9);

  if (*((_DWORD *)v19 + 6))
  {
    if (!*((_DWORD *)v15 + 6))
    {
      objc_msgSend(*(id *)(a1 + 32), "releasePowerAssertion");
      if (!*((_DWORD *)v11 + 6))
        objc_msgSend(*(id *)(a1 + 32), "didIdle");
    }
  }
  v3 = MEMORY[0x1E0C81028];
  v4 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(v6 + 12);
    LODWORD(v6) = *(_DWORD *)(v6 + 16);
    *(_DWORD *)buf = 138543874;
    v23 = v5;
    v24 = 1024;
    v25 = v7;
    v26 = 1024;
    v27 = v6;
    v8 = v5;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ Releasing busy count. Now busy = %d, UI busy = %d", buf, 0x18u);

  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

_QWORD *__23__MSDaemon_releaseBusy__block_invoke_2(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 12))--;
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  return result;
}

void __22__MSDaemon_retainBusy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "idleCountQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __22__MSDaemon_retainBusy__block_invoke_2;
  v9[3] = &unk_1E95BC8B0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  dispatch_sync(v2, v9);

  if (!*((_DWORD *)v19 + 6))
  {
    if (*((_DWORD *)v15 + 6))
    {
      objc_msgSend(*(id *)(a1 + 32), "retainPowerAssertion");
      if (!*((_DWORD *)v11 + 6))
        objc_msgSend(*(id *)(a1 + 32), "didUnidle");
    }
  }
  v3 = MEMORY[0x1E0C81028];
  v4 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(v6 + 12);
    LODWORD(v6) = *(_DWORD *)(v6 + 16);
    *(_DWORD *)buf = 138543874;
    v23 = v5;
    v24 = 1024;
    v25 = v7;
    v26 = 1024;
    v27 = v6;
    v8 = v5;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ Retaining busy count. Now busy = %d, UI busy = %d", buf, 0x18u);

  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

_QWORD *__22__MSDaemon_retainBusy__block_invoke_2(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = (*(_DWORD *)(result[4] + 12))++;
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 12);
  *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24) = *(_DWORD *)(result[4] + 16);
  return result;
}

@end
