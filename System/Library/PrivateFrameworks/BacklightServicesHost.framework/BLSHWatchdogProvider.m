@implementation BLSHWatchdogProvider

- (BLSHWatchdogProvider)initWithDelegate:(id)a3
{
  id v4;
  BLSHWatchdogProvider *v5;
  BLSHWatchdogProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSHWatchdogProvider;
  v5 = -[BLSHWatchdogProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_watchdogEnabled = 1;
    objc_storeWeak((id *)&v5->_providerDelegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSAbsoluteMachTimer invalidate](self->_lock_fireRetryTimer, "invalidate");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)BLSHWatchdogProvider;
  -[BLSHWatchdogProvider dealloc](&v4, sel_dealloc);
}

+ (void)setIgnoreWatchdogAborts:(BOOL)a3
{
  os_unfair_lock_lock(&__classLock);
  __ignoreWatchdogAborts = a3;
  os_unfair_lock_unlock(&__classLock);
}

+ (BOOL)ignoreWatchdogAborts
{
  char v2;

  os_unfair_lock_lock(&__classLock);
  v2 = __ignoreWatchdogAborts;
  os_unfair_lock_unlock(&__classLock);
  return v2;
}

- (void)registerHandlersForService:(id)a3
{
  id v3;

  v3 = +[BLSHDisableBacklightWatchdogsAttributeHandler registerHandlerForService:provider:](BLSHDisableBacklightWatchdogsAttributeHandler, "registerHandlerForService:provider:", a3, self);
}

- (id)scheduleWatchdogWithDelegate:(id)a3 explanation:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  BSLHWatchdogTimer *v11;

  v8 = a4;
  v9 = a3;
  bls_diagnostics_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BLSHWatchdogProvider scheduleWatchdogWithDelegate:explanation:timeout:].cold.1((uint64_t)v8, v10, a5);

  v11 = -[BSLHWatchdogTimer initWithExplanation:delegate:provider:]([BSLHWatchdogTimer alloc], "initWithExplanation:delegate:provider:", v8, v9, self);
  -[BSLHWatchdogTimer scheduleWithTimeout:](v11, "scheduleWithTimeout:", a5);

  return v11;
}

- (void)fireWatchdogWithTimer:(id)a3 delegate:(id)a4 timeout:(double)a5 elapsedTime:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _WORD v29[15];

  *(_QWORD *)&v29[11] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "abortContextForTimer:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasSleepBeenImminentSinceScheduled"))
    objc_msgSend(v12, "setSleepImminentAbortReason");
  kdebug_trace();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "abortReasonString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "explanation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("BLS %@ watchdog: %@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[BLSHWatchdogProvider isWatchdogEnabled](self, "isWatchdogEnabled");
  v18 = BSIsBeingDebugged();
  v19 = v18;
  if (v17 && (!v18 || -[BLSHWatchdogProvider isTesting](self, "isTesting")))
  {
    bls_diagnostics_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      v23 = a5;
      v24 = 2114;
      v25 = v16;
      v26 = 2048;
      v27 = a6;
      v28 = 2114;
      *(_QWORD *)v29 = v12;
      _os_log_error_impl(&dword_2145AC000, v20, OS_LOG_TYPE_ERROR, "%.2lfs watchdog first fired:\"%{public}@\" elapsedTime:%.2lfs abortContext:%{public}@", buf, 0x2Au);
    }

    -[BLSHWatchdogProvider _fireWatchdogWithTimer:delegate:timeout:elapsedTime:abortContext:explanation:remainingRetries:](self, "_fireWatchdogWithTimer:delegate:timeout:elapsedTime:abortContext:explanation:remainingRetries:", v10, v11, v12, v16, 3, a5, a6);
  }
  else
  {
    bls_diagnostics_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      v23 = a5;
      v24 = 2114;
      v25 = v16;
      v26 = 2048;
      v27 = a6;
      v28 = 1024;
      *(_DWORD *)v29 = v17;
      v29[2] = 1024;
      *(_DWORD *)&v29[3] = v19;
      _os_log_impl(&dword_2145AC000, v21, OS_LOG_TYPE_DEFAULT, "%.2lfs watchdog fired:\"%{public}@\" after elapsed time:%.2lfs watchdogEnabled:%{BOOL}u isBeingDebugged:%{BOOL}u", buf, 0x2Cu);
    }

  }
}

- (void)_fireWatchdogWithTimer:(id)a3 delegate:(id)a4 timeout:(double)a5 elapsedTime:(double)a6 abortContext:(id)a7 explanation:(id)a8 remainingRetries:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  double v19;
  os_unfair_lock_s *p_lock;
  BSAbsoluteMachTimer *lock_fireRetryTimer;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  BSAbsoluteMachTimer **p_lock_fireRetryTimer;
  BSAbsoluteMachTimer *v31;
  BSAbsoluteMachTimer *v32;
  id v33;
  _BOOL4 v34;
  os_log_type_t v35;
  os_log_type_t v36;
  id WeakRetained;
  int v38;
  char v39;
  int64_t v40;
  dispatch_time_t v41;
  const __CFString *v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  id v47;
  char v48;
  BOOL v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55[4];
  _BYTE location[12];
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  _BYTE v62[18];
  __int16 v63;
  double v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = COERCE_DOUBLE(a8);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSAbsoluteMachTimer invalidate](self->_lock_fireRetryTimer, "invalidate");
  lock_fireRetryTimer = self->_lock_fireRetryTimer;
  self->_lock_fireRetryTimer = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (a9)
    v22 = a6 - a5 > 2.0;
  else
    v22 = 0;
  bls_diagnostics_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134219266;
      v42 = CFSTR("tries");
      *(double *)&location[4] = a5;
      if (a9 == 2)
        v42 = CFSTR("try");
      v57 = 2048;
      v58 = a6 - a5;
      v59 = 2048;
      v60 = a5;
      v61 = 2048;
      *(_QWORD *)v62 = a9 - 1;
      *(_WORD *)&v62[8] = 2112;
      *(_QWORD *)&v62[10] = v42;
      v63 = 2114;
      v64 = v19;
      _os_log_error_impl(&dword_2145AC000, v24, OS_LOG_TYPE_ERROR, "%.2lfs watchdog is potential hang. extra time:%.2lfs trying again in %.2lfs %lu %@ left after that \"%{public}@\", location, 0x3Eu);
    }

    objc_initWeak((id *)location, self);
    BSContinuousMachTimeNow();
    v26 = v25;
    os_unfair_lock_lock(&self->_lock);
    v27 = objc_alloc(MEMORY[0x24BE0BD78]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("retry: %@"), *(_QWORD *)&v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithIdentifier:", v28);
    v31 = self->_lock_fireRetryTimer;
    p_lock_fireRetryTimer = &self->_lock_fireRetryTimer;
    *p_lock_fireRetryTimer = (BSAbsoluteMachTimer *)v29;

    v32 = *p_lock_fireRetryTimer;
    v33 = MEMORY[0x24BDAC9B8];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke;
    v50[3] = &unk_24D1BD568;
    objc_copyWeak(v55, (id *)location);
    v51 = v16;
    v52 = v17;
    v55[1] = *(id *)&a5;
    v55[2] = v26;
    v53 = v18;
    v54 = *(id *)&v19;
    v55[3] = (id)a9;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v32, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v50, a5, 1.0);

    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(v55);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v34 = -[BLSHWatchdogProvider isTesting](self, "isTesting");
    if (v34)
      v35 = OS_LOG_TYPE_ERROR;
    else
      v35 = -112;
    if (v34)
      v36 = OS_LOG_TYPE_ERROR;
    else
      v36 = -112;
    if (os_log_type_enabled(v24, v36))
    {
      *(_DWORD *)location = 134219010;
      *(double *)&location[4] = a5;
      v57 = 2114;
      v58 = v19;
      v59 = 2048;
      v60 = a6;
      v61 = 1024;
      *(_DWORD *)v62 = a6 - a5 > 2.0;
      *(_WORD *)&v62[4] = 2114;
      *(_QWORD *)&v62[6] = v18;
      _os_log_impl(&dword_2145AC000, v24, v35, "%.2lfs watchdog fired:\"%{public}@\" elapsedTime:%.2lfs isPotentialHang:%{BOOL}u abortContext:%{public}@", location, 0x30u);
    }

    if (!+[BLSHWatchdogProvider ignoreWatchdogAborts](BLSHWatchdogProvider, "ignoreWatchdogAborts")
      && os_variant_has_internal_diagnostics()
      && (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v18, "wantsWaitPastFireForCompletionAndTailspin")
      && (WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate),
          v38 = objc_msgSend(WeakRetained, "isTailspinAvailable"),
          WeakRetained,
          v38))
    {
      +[BLSHWatchdogProvider setIgnoreWatchdogAborts:](BLSHWatchdogProvider, "setIgnoreWatchdogAborts:", 1);
      v39 = 1;
    }
    else
    {
      v39 = 0;
    }
    if (-[BLSHWatchdogProvider isTesting](self, "isTesting"))
      v40 = 100000000;
    else
      v40 = 1000000000;
    v41 = dispatch_time(0, v40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118;
    block[3] = &unk_24D1BD590;
    block[4] = self;
    v44 = *(id *)&v19;
    v45 = v16;
    v48 = v39;
    v46 = v17;
    v47 = v18;
    v49 = a6 - a5 > 2.0;
    dispatch_after(v41, MEMORY[0x24BDAC9B8], block);

  }
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(double *)(a1 + 72);
  BSContinuousMachTimeNow();
  objc_msgSend(WeakRetained, "_fireWatchdogWithTimer:delegate:timeout:elapsedTime:abortContext:explanation:remainingRetries:", v2, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88) - 1, v4, v5 - *(double *)(a1 + 80));

}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  uint64_t *v10;
  BLSHWatchdogAbortParameters *v11;
  _BOOL8 v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didFinishDumpingStateForWatchdog:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 48), "isInvalidated");
  if (v3 && !*(_BYTE *)(a1 + 72))
  {
    bls_diagnostics_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118_cold_1(a1, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "osInterfaceProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemSleepMonitor");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = -[NSObject isSleepImminent](v5, "isSleepImminent");
    v7 = -1.0;
    if ((_DWORD)v6)
    {
      -[NSObject aggregateState](v5, "aggregateState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sleepMonitorStateTimestamp");
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      v7 = v9;

    }
    v10 = (uint64_t *)(a1 + 40);
    v11 = -[BLSHWatchdogAbortParameters initWithDelegate:abortContext:isPotentialHang:hasSleepBeenRequested:sleepImminent:sleepImminentSinceScheduled:timeInSleepImminent:explanation:]([BLSHWatchdogAbortParameters alloc], "initWithDelegate:abortContext:isPotentialHang:hasSleepBeenRequested:sleepImminent:sleepImminentSinceScheduled:timeInSleepImminent:explanation:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 73), -[NSObject hasSleepBeenRequested](v5, "hasSleepBeenRequested"), v6, objc_msgSend(*(id *)(a1 + 48), "hasSleepBeenImminentSinceScheduled"), v7, *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 72))
    {
      if (v3)
        v12 = objc_msgSend(*(id *)(a1 + 48), "invalidationReason") != 2;
      else
        v12 = 1;
      bls_diagnostics_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118_cold_3(v12, (uint64_t *)(a1 + 40), v15);

      objc_msgSend(*(id *)(a1 + 32), "setWaitingwaitingPastFireForCompletionAndTailspin:waitForWatchdogCompletion:", v11, v12);
    }
    else if (+[BLSHWatchdogProvider ignoreWatchdogAborts](BLSHWatchdogProvider, "ignoreWatchdogAborts"))
    {
      bls_diagnostics_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118_cold_2(v10, v13, v14);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_abortForWatchdogFire:", v11);
    }

  }
}

- (void)_abortForWatchdogFire:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  BSInvalidatable *lock_forceOverdueAbortTimer;
  id WeakRetained;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  char v35;
  const __CFString *v36;
  __CFString *v37;
  int v38;
  int v39;
  __CFString *v40;
  int v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  int v49;
  uint8_t buf[4];
  const __CFString *v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  int v55;
  __int16 v56;
  _BYTE v57[14];
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "abortContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v4, "isPotentialHang");
  v39 = objc_msgSend(v4, "hasSleepBeenRequested");
  v6 = objc_msgSend(v4, "sleepImminent");
  v38 = objc_msgSend(v4, "sleepImminentSinceScheduled");
  objc_msgSend(v4, "timeInSleepImminent");
  v8 = v7;
  objc_msgSend(v4, "explanation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "abortReasonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BLSHWatchdogProvider isTesting](self, "isTesting"))
    objc_msgSend((id)objc_opt_class(), "markWatchdogDidFire:abortReason:", v9, v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v5, "payload");
  else
    v11 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v5, "payloadSize");
  else
    v12 = 0;
  if (os_variant_has_internal_diagnostics()
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "wantsPanic"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("ignoreWatchdogPanicRequests"));
    if (v14)
    {
      bls_diagnostics_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring request to panic from abortContext due to default", buf, 2u);
      }

    }
    v16 = v14 ^ 1;

  }
  else
  {
    v16 = 0;
  }
  bls_diagnostics_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v32 = CFSTR("abort");
    if (v16)
      v32 = CFSTR("panic");
    v36 = v32;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" timeInSlImm:%1.1fs"), v8);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = &stru_24D1BE888;
    }
    v35 = objc_opt_respondsToSelector();
    if ((v35 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" ensFlipCur:%u"), objc_msgSend(v5, "hasEnsureFlipbookCurrent"));
      v34 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = &stru_24D1BE888;
    }
    *(_DWORD *)buf = 138544642;
    v51 = v36;
    v52 = 1024;
    v53 = v39;
    v54 = 1024;
    v55 = v6;
    v56 = 1024;
    *(_DWORD *)v57 = v38;
    *(_WORD *)&v57[4] = 2114;
    *(_QWORD *)&v57[6] = v37;
    v58 = 2114;
    v40 = (__CFString *)v34;
    v59 = v34;
    _os_log_error_impl(&dword_2145AC000, v17, OS_LOG_TYPE_ERROR, "watchdog pre-%{public}@: slReq:%{BOOL}u slImm:%{BOOL}u slImmSinceSched:%{BOOL}u%{public}@%{public}@", buf, 0x32u);
    if ((v35 & 1) != 0)

    if (v6)
  }

  bls_backlight_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  bls_diagnostics_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v33 = CFSTR("aborting");
    *(_DWORD *)buf = 138544130;
    if (v16)
      v33 = CFSTR("panicking");
    v51 = v33;
    v52 = 1024;
    v53 = v19;
    v54 = 1024;
    v55 = v41;
    v56 = 2114;
    *(_QWORD *)v57 = v9;
    _os_log_error_impl(&dword_2145AC000, v20, OS_LOG_TYPE_ERROR, "%{public}@ for watchdog. BLS backlight debug logging enabled:%{BOOL}u isPotentialHang:%{BOOL}u \"%{public}@\", buf, 0x22u);
  }

  -[BSInvalidatable invalidate](self->_lock_forceOverdueAbortTimer, "invalidate");
  lock_forceOverdueAbortTimer = self->_lock_forceOverdueAbortTimer;
  self->_lock_forceOverdueAbortTimer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  v23 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke;
  v44[3] = &unk_24D1BD5B8;
  v24 = WeakRetained;
  v45 = v24;
  v25 = v5;
  v46 = v25;
  v48 = v11;
  v49 = v12;
  v26 = v9;
  v47 = v26;
  v27 = MEMORY[0x2199D2BD8](v44);
  v28 = (void *)v27;
  if (v16)
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v25, "abortReasonString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("panicking for BLS %@ watchdog. BLS backlight debug logging enabled:%u \"%@\" abortContext:%@"), v30, v19, v26, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v42[0] = v23;
    v42[1] = 3221225472;
    v42[2] = __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke_2;
    v42[3] = &unk_24D1BD170;
    v43 = v28;
    objc_msgSend(v24, "panicForWatchdog:completion:", v31, v42);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v27 + 16))(v27, 0);
  }

}

uint64_t __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "abortForWatchdog:payload:payloadSize:explanation:", objc_msgSend(*(id *)(a1 + 40), "abortReason"), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48));
  return +[BLSHWatchdogProvider setIgnoreWatchdogAborts:](BLSHWatchdogProvider, "setIgnoreWatchdogAborts:", 0);
}

uint64_t __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_checkForReadyToAbortAfterWaitingPastFire
{
  os_unfair_lock_s *p_lock;
  BLSHWatchdogAbortParameters *v4;
  _BOOL4 lock_waitingForWatchdogCompletion;
  _BOOL4 lock_waitingForTailspin;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_waitingAbortParams;
  lock_waitingForWatchdogCompletion = self->_lock_waitingForWatchdogCompletion;
  lock_waitingForTailspin = self->_lock_waitingForTailspin;
  if (self->_lock_waitingForWatchdogCompletion || !self->_lock_waitingForTailspin)
  {
    v7 = 0;
  }
  else
  {
    v7 = !self->_lock_startedTailspin;
    lock_waitingForTailspin = 1;
  }
  os_unfair_lock_unlock(p_lock);
  bls_diagnostics_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[BLSHWatchdogAbortParameters explanation](v4, "explanation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109890;
    v10[1] = v7;
    v11 = 1024;
    v12 = lock_waitingForTailspin;
    v13 = 1024;
    v14 = lock_waitingForWatchdogCompletion;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_INFO, "_checkForReadyToAbortAfterWaitingPastFire: shouldStartTailspin:%{BOOL}u waitingForTailspin:%{BOOL}u waitingForWatchdogCompletion:%{BOOL}u watchdog:\"%{public}@\", (uint8_t *)v10, 0x1Eu);

  }
  if (v7)
  {
    -[BLSHWatchdogProvider _startWritingTailspin](self, "_startWritingTailspin");
  }
  else if (!lock_waitingForTailspin && !lock_waitingForWatchdogCompletion)
  {
    -[BLSHWatchdogProvider _abortForWatchdogFire:](self, "_abortForWatchdogFire:", v4);
  }

}

- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v4 = a3;
  v5 = -[BLSHWatchdogProvider isWaitingwaitingPastFireForCompletionAndTailspin](self, "isWaitingwaitingPastFireForCompletionAndTailspin");
  bls_diagnostics_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BLSHWatchdogProvider _giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:].cold.1((uint64_t)v4, v7, v8);

    -[BLSHWatchdogProvider _clearIsWaitingForWatchdogCompletion](self, "_clearIsWaitingForWatchdogCompletion");
    -[BLSHWatchdogProvider _checkForReadyToAbortAfterWaitingPastFire](self, "_checkForReadyToAbortAfterWaitingPastFire");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BLSHWatchdogProvider _giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:].cold.2();

  }
}

- (void)clearWatchdogWithExplanation:(id)a3 reason:(unint64_t)a4 timeout:(double)a5 elapsedTime:(double)a6
{
  id v10;
  _BOOL4 v11;
  int v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  os_log_type_t v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  __CFString *v24;
  int v25;
  double v26;
  __int16 v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = -[BLSHWatchdogProvider isWatchdogEnabled](self, "isWatchdogEnabled");
  v12 = BSIsBeingDebugged();
  v13 = -[BLSHWatchdogProvider isWaitingwaitingPastFireForCompletionAndTailspin](self, "isWaitingwaitingPastFireForCompletionAndTailspin");
  if (!v13)
    goto LABEL_6;
  if (a4 == 2)
  {
    -[BLSHWatchdogProvider _clearIsWaitingForWatchdogCompletion](self, "_clearIsWaitingForWatchdogCompletion");
    bls_diagnostics_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BLSHWatchdogProvider clearWatchdogWithExplanation:reason:timeout:elapsedTime:].cold.1((uint64_t)v10, v14, v15);

    -[BLSHWatchdogProvider _checkForReadyToAbortAfterWaitingPastFire](self, "_checkForReadyToAbortAfterWaitingPastFire");
LABEL_6:
    if (a6 <= a5)
    {
      v16 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      kdebug_trace();
      v16 = OS_LOG_TYPE_DEFAULT;
    }
    bls_diagnostics_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, v16))
    {
      v18 = CFSTR("completed");
      if (a4 == 1)
        v18 = CFSTR("replaced");
      v19 = v18;
      v25 = 134219522;
      v26 = a5;
      v27 = 2114;
      v28 = v10;
      v29 = 2048;
      v30 = a6;
      v31 = 1024;
      v32 = v13;
      v33 = 2114;
      v34 = v19;
      v35 = 1024;
      v36 = v11;
      v37 = 1024;
      v38 = v12;
      v20 = "%.2lfs watchdog invalidated:\"%{public}@\" elapsedTime:%.2lfs waitingPastFire:%{BOOL}u, clearReason:%{public"
            "}@ watchdogEnabled:%{BOOL}u isBeingDebugged:%{BOOL}u";
      v21 = v17;
      v22 = v16;
      v23 = 60;
LABEL_17:
      _os_log_impl(&dword_2145AC000, v21, v22, v20, (uint8_t *)&v25, v23);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  bls_diagnostics_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v24 = CFSTR("completed");
    if (a4 == 1)
      v24 = CFSTR("replaced");
    v19 = v24;
    v25 = 138543362;
    v26 = *(double *)&v19;
    v20 = "Ignoring %{public}@ because isWaitingwaitingPastFireForCompletionAndTailspin:YES";
    v21 = v17;
    v22 = OS_LOG_TYPE_DEFAULT;
    v23 = 12;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)didDetectSignificantUserInteraction
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__BLSHWatchdogProvider_didDetectSignificantUserInteraction__block_invoke;
  block[3] = &unk_24D1BC268;
  block[4] = self;
  if (didDetectSignificantUserInteraction_onceToken != -1)
    dispatch_once(&didDetectSignificantUserInteraction_onceToken, block);
}

uint64_t __59__BLSHWatchdogProvider_didDetectSignificantUserInteraction__block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "checkForWatchdogDidFire:", 0);
}

- (BOOL)isWaitingwaitingPastFireForCompletionAndTailspin
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_waitingForWatchdogCompletion || self->_lock_waitingForTailspin;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_clearIsWaitingForWatchdogCompletion
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_waitingForWatchdogCompletion = 0;
  os_unfair_lock_unlock(p_lock);
}

- (id)waitingPastFireForCompletionAndTailspinAbortParams
{
  os_unfair_lock_s *p_lock;
  BLSHWatchdogAbortParameters *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_waitingAbortParams;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setWaitingwaitingPastFireForCompletionAndTailspin:(id)a3 waitForWatchdogCompletion:(BOOL)a4
{
  BLSHWatchdogAbortParameters *v6;
  BLSHWatchdogAbortParameters *lock_waitingAbortParams;
  BLSHWatchdogAbortParameters *v8;
  void *v9;
  BLSHWatchdogProvider *v10;
  void *v11;
  void *v12;
  id v13;
  BSInvalidatable *v14;
  BSInvalidatable *lock_forceOverdueAbortTimer;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  BLSHWatchdogProvider *v20;
  id v21;

  v6 = (BLSHWatchdogAbortParameters *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_waitingAbortParams = self->_lock_waitingAbortParams;
  self->_lock_waitingAbortParams = v6;
  v8 = v6;

  self->_lock_waitingForWatchdogCompletion = a4;
  self->_lock_waitingForTailspin = 1;
  -[BLSHWatchdogAbortParameters explanation](v8, "explanation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSInvalidatable invalidate](self->_lock_forceOverdueAbortTimer, "invalidate");
  v10 = self;
  -[BLSHWatchdogAbortParameters delegate](v8, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "osInterfaceProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __100__BLSHWatchdogProvider_setWaitingwaitingPastFireForCompletionAndTailspin_waitForWatchdogCompletion___block_invoke;
  v19 = &unk_24D1BD480;
  v20 = v10;
  v21 = v9;
  v13 = v9;
  objc_msgSend(v12, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("watchdogprovider.waitingpastfire"), &v16, 120.0, 5.0);
  v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  lock_forceOverdueAbortTimer = self->_lock_forceOverdueAbortTimer;
  self->_lock_forceOverdueAbortTimer = v14;

  os_unfair_lock_unlock(&self->_lock);
  -[BLSHWatchdogProvider _checkForReadyToAbortAfterWaitingPastFire](v10, "_checkForReadyToAbortAfterWaitingPastFire", v16, v17, v18, v19, v20);

}

uint64_t __100__BLSHWatchdogProvider_setWaitingwaitingPastFireForCompletionAndTailspin_waitForWatchdogCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:", *(_QWORD *)(a1 + 40));
}

- (void)_startWritingTailspin
{
  os_unfair_lock_s *p_lock;
  BLSHWatchdogAbortParameters *lock_waitingAbortParams;
  BLSHWatchdogProvider *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_startedTailspin = 1;
  lock_waitingAbortParams = self->_lock_waitingAbortParams;
  v5 = self;
  -[BLSHWatchdogAbortParameters explanation](lock_waitingAbortParams, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_providerDelegate);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__BLSHWatchdogProvider__startWritingTailspin__block_invoke;
  v8[3] = &unk_24D1BD5E0;
  v8[4] = v5;
  objc_msgSend(WeakRetained, "writeTailspinForWatchdog:completion:", v6, v8);

}

void __45__BLSHWatchdogProvider__startWritingTailspin__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  bls_diagnostics_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a3;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEFAULT, "tailspin completed: succeeded:%{BOOL}u \"%{public}@\", (uint8_t *)v10, 0x12u);
  }

  v7 = *(os_unfair_lock_s **)(a1 + 32);
  if (v7)
  {
    v8 = v7 + 10;
    v9 = v7;
    os_unfair_lock_lock(v8);
    LOBYTE(v9[6]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v8);
    -[os_unfair_lock_s _checkForReadyToAbortAfterWaitingPastFire](v9, "_checkForReadyToAbortAfterWaitingPastFire");

  }
}

- (BOOL)isTesting
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__BLSHWatchdogProvider_isTesting__block_invoke;
  block[3] = &unk_24D1BC268;
  block[4] = self;
  if (isTesting_onceToken != -1)
    dispatch_once(&isTesting_onceToken, block);
  return isTesting___isTesting;
}

void __33__BLSHWatchdogProvider_isTesting__block_invoke(uint64_t a1)
{
  char v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v1 = objc_msgSend(WeakRetained, "isTesting");
  else
    v1 = 0;
  isTesting___isTesting = v1;

}

+ (void)markWatchdogDidFire:(id)a3 abortReason:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("BLSHWatchdogDidFireDate");
  v5 = (void *)MEMORY[0x24BDBCE60];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = CFSTR("BLSHWatchdogDidFireBuildVersion");
  v9 = (void *)MGCopyAnswer();
  v18[1] = v9;
  v17[2] = CFSTR("BLSHWatchdogDidFireDeviceType");
  v10 = (void *)MGCopyAnswer();
  v18[2] = v10;
  v18[3] = v7;
  v17[3] = CFSTR("BLSHWatchdogDidFireExplanation");
  v17[4] = CFSTR("BLSHWatchdogDidFireAbortReason");
  v18[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDBCF50]);
  v13 = (void *)objc_msgSend(v12, "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("BLSHWatchdogDidFire"));

  if (!CFPreferencesAppSynchronize(CFSTR("com.apple.BacklightServices")))
  {
    bls_diagnostics_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[BLSHWatchdogProvider markWatchdogDidFire:abortReason:].cold.1(v14, v15, v16);

  }
}

+ (BOOL)checkForWatchdogDidFire:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BLSHWatchdogDidFireDetails *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v5, "dictionaryForKey:", CFSTR("BLSHWatchdogDidFire"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = !v3;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("BLSHWatchdogDidFire"));
    goto LABEL_7;
  }
  if (v6)
  {
LABEL_7:
    v9 = -[BLSHWatchdogDidFireDetails initWithWatchdogDidFireDictionary:]([BLSHWatchdogDidFireDetails alloc], "initWithWatchdogDidFireDictionary:", v7);
    bls_diagnostics_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[BLSHWatchdogProvider checkForWatchdogDidFire:].cold.4(v9, v3, v10);

    if (!os_variant_has_internal_diagnostics())
      goto LABEL_20;
    if (+[BLSHInternalTapToRadarIgnorer shouldIgnoreDesignation:](BLSHInternalTapToRadarIgnorer, "shouldIgnoreDesignation:", 1))
    {
      +[BLSHWatchdogProvider resetWatchdogDidFire](BLSHWatchdogProvider, "resetWatchdogDidFire");
      bls_diagnostics_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[BLSHWatchdogProvider checkForWatchdogDidFire:].cold.1();
    }
    else
    {
      -[BLSHWatchdogDidFireDetails date](v9, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceNow");
      v14 = v13;

      if (v14 >= -86400.0)
      {
        bls_diagnostics_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[BLSHWatchdogProvider checkForWatchdogDidFire:].cold.3();

        objc_msgSend(a1, "showWatchdogDidFireAlert:", v9);
        goto LABEL_20;
      }
      +[BLSHWatchdogProvider resetWatchdogDidFire](BLSHWatchdogProvider, "resetWatchdogDidFire");
      bls_diagnostics_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[BLSHWatchdogProvider checkForWatchdogDidFire:].cold.2(v9, v11);
    }

LABEL_20:
  }

  return v7 != 0;
}

+ (void)resetWatchdogDidFire
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("BLSHWatchdogDidFire"));

}

+ (void)showWatchdogDidFireAlert:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BLSHTapToRadarDescriptor *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[5];

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "abortReasonString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "debugLogsEnabled"))
    v8 = CFSTR("with");
  else
    v8 = CFSTR("without");
  objc_msgSend(v4, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bls_loggingString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@: BacklightServices %@ watchdog fired %@ debug logs at %@"), v5, v6, v7, v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v11;

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "abortReasonString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "debugLogsEnabled"))
    v14 = CFSTR("with");
  else
    v14 = CFSTR("without");
  objc_msgSend(v4, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bls_loggingString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "explanation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("BacklightServices %@ watchdog fired %@ debug logs at %@ on %@\n\nExplanation: %@"), v13, v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[BLSHTapToRadarDescriptor initWithDesignation:radarTitle:radarDescription:]([BLSHTapToRadarDescriptor alloc], "initWithDesignation:radarTitle:radarDescription:", 1, v11, v19);
  objc_msgSend(v4, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHTapToRadarDescriptor setTimeOfIssue:](v20, "setTimeOfIssue:", v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "processName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "debugLogsEnabled"))
    v25 = CFSTR("with");
  else
    v25 = CFSTR("without");
  objc_msgSend(v4, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bls_loggingString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ abort: BacklightServices watchdog fired %@ debug logs at %@ on %@.\nPlease file a radar against BacklightServices | All with a sysdiagnose.\n\nTo disable this prompt from CLI:\n\nlogin -f mobile defaults write com.apple.BacklightServices IgnoredTapToRadarDesignations -array -int 0"), v24, v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHTapToRadarDescriptor setTtrPromptMessage:](v20, "setTtrPromptMessage:", v29);

  -[BLSHTapToRadarDescriptor setTtrDisplayReason:](v20, "setTtrDisplayReason:", CFSTR("BacklightServices watchdog fired"));
  +[BLSHInternalTapToRadarManager sharedTapToRadarManager](BLSHInternalTapToRadarManager, "sharedTapToRadarManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  bls_diagnostics_log();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke;
  v34[3] = &__block_descriptor_40_e8_v12__0B8l;
  v34[4] = a1;
  objc_msgSend(v30, "requestTapToRadar:log:completion:", v20, v31, v34);

}

void __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  if ((a2 & 1) != 0)
  {
    bls_diagnostics_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke_cold_1();

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_blsWatchdogLockStatusDidChange, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resetWatchdogDidFire");
  }
}

- (BOOL)isWatchdogEnabled
{
  return self->_watchdogEnabled;
}

- (void)setWatchdogEnabled:(BOOL)a3
{
  self->_watchdogEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_lock_forceOverdueAbortTimer, 0);
  objc_storeStrong((id *)&self->_lock_waitingAbortParams, 0);
  objc_storeStrong((id *)&self->_lock_fireRetryTimer, 0);
}

- (void)scheduleWatchdogWithDelegate:(uint64_t)a1 explanation:(NSObject *)a2 timeout:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a3;
  v5 = 2114;
  v6 = a1;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "scheduling %.1fs watchdog \"%{public}@\", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "watchdog invalidated after firing while waiting for state dump. Carousel's main thread probably hung for a significant amount of time:\"%{public}@\", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1_7(&dword_2145AC000, a2, a3, "ignoring all watchdog aborts: \"%{public}@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_118_cold_3(char a1, uint64_t *a2, NSObject *a3)
{
  const __CFString *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = &stru_24D1BE888;
  v4 = *a2;
  if ((a1 & 1) != 0)
    v3 = CFSTR(" and overdue operation finish");
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_12(&dword_2145AC000, a3, (uint64_t)a3, "will wait for watchdog abort until tailspin%{public}@: \"%{public}@\", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = 0x405E000000000000;
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_12(&dword_2145AC000, a2, a3, "after %1.0fs, giving up waiting for watchdog completion: \"%{public}@\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6_1();
  _os_log_fault_impl(&dword_2145AC000, v0, OS_LOG_TYPE_FAULT, "_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire: isWaitingwaitingPastFireForCompletionAndTailspin:NO, so ignoring", v1, 2u);
  OUTLINED_FUNCTION_4_3();
}

- (void)clearWatchdogWithExplanation:(uint64_t)a3 reason:timeout:elapsedTime:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_7(&dword_2145AC000, a2, a3, "watchdog completed: \"%{public}@\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

+ (void)markWatchdogDidFire:(uint64_t)a3 abortReason:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = CFSTR("BLSHWatchdogDidFire");
  OUTLINED_FUNCTION_1_7(&dword_2145AC000, a1, a3, "Failed to sync com.apple.BacklightServices after writing %{public}@ key", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

+ (void)checkForWatchdogDidFire:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, v0, v1, "not prompting to file radars for BLS watchdogs on this device due to user preferences so clearing BLSHWatchdogDidFire", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_3();
}

+ (void)checkForWatchdogDidFire:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_loggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1_7(&dword_2145AC000, a2, v5, "not prompting to file radar for BLS watchdog from %{public}@ because it's too old", (uint8_t *)&v6);

}

+ (void)checkForWatchdogDidFire:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, v0, v1, "prompting to file a radar for the BLS watchdog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_3();
}

+ (void)checkForWatchdogDidFire:(NSObject *)a3 .cold.4(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bls_loggingString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v7;
  v11 = 2114;
  v12 = v8;
  v13 = 1024;
  v14 = a2 & 1;
  _os_log_error_impl(&dword_2145AC000, a3, OS_LOG_TYPE_ERROR, "watchdog did fire at %{public}@ on build %{public}@, reset:%{BOOL}u", (uint8_t *)&v9, 0x1Cu);

}

void __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_5(&dword_2145AC000, v0, v1, "-[BLSHInternalTapToRadarManager requestTapToRadar:::] said to try again later. will wait for next lock status change to check again for BLS watchdog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_3();
}

@end
