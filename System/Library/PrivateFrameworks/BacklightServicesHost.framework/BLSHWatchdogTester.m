@implementation BLSHWatchdogTester

- (BLSHWatchdogTester)initWithWatchdogProviderDelegate:(id)a3 testables:(id)a4
{
  id v7;
  id v8;
  BLSHWatchdogTester *v9;
  BLSHWatchdogTester *v10;
  uint64_t v11;
  NSMapTable *testables;
  _QWORD v14[4];
  BLSHWatchdogTester *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BLSHWatchdogTester;
  v9 = -[BLSHWatchdogTester init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_lock_nextTimerID = 1;
    objc_storeStrong((id *)&v9->_watchdogProviderDelegate, a3);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    testables = v10->_testables;
    v10->_testables = (NSMapTable *)v11;

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __65__BLSHWatchdogTester_initWithWatchdogProviderDelegate_testables___block_invoke;
    v14[3] = &unk_24D1BE630;
    v15 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  return v10;
}

void __65__BLSHWatchdogTester_initWithWatchdogProviderDelegate_testables___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *v5;
  NSObject *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", a3, v5);
  bls_diagnostics_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "observing \"%{public}@\", (uint8_t *)&v8, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_triggerTestWatchdog, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (id)_watchdogProvider
{
  BLSHWatchdogProvider *watchdogProvider;
  BLSHWatchdogProvider *v4;
  BLSHWatchdogProvider *v5;

  watchdogProvider = self->_watchdogProvider;
  if (!watchdogProvider)
  {
    v4 = -[BLSHWatchdogProvider initWithDelegate:]([BLSHWatchdogProvider alloc], "initWithDelegate:", self->_watchdogProviderDelegate);
    v5 = self->_watchdogProvider;
    self->_watchdogProvider = v4;

    watchdogProvider = self->_watchdogProvider;
  }
  return watchdogProvider;
}

- (void)_triggerTestWatchdog:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BLSHWatchdogTesterTimer *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  dispatch_time_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  dispatch_time_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  dispatch_time_t v39;
  uint64_t v40;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  _QWORD v44[8];
  _QWORD v45[5];
  id v46;
  id v47;
  _BYTE *v48;
  uint64_t v49;
  double v50;
  _QWORD v51[8];
  _QWORD block[7];
  uint8_t v53[4];
  double v54;
  __int16 v55;
  double v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  BLSHWatchdogTesterTimer *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_testables, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bls_diagnostics_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "got test watchdog \"%{public}@\" with testable %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__11;
  v59 = __Block_byref_object_dispose__11;
  v7 = [BLSHWatchdogTesterTimer alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Test watchdog %@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[BLSHWatchdogTesterTimer initWithExplanation:](v7, "initWithExplanation:", v8);

  if (objc_msgSend(v4, "hasSuffix:", CFSTR(".sleepImminent")))
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setSleepImminentSinceScheduled:", 1);
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(".delayCBTransitions-15")))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setCBTransitionsDelayForTesting:", v12);
LABEL_8:

    goto LABEL_28;
  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(".delayCATransitions-7")))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "doubleValue");
    v15 = v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setCATransitionsDelayForTesting:", v15);
    goto LABEL_8;
  }
  -[BLSHWatchdogTester _watchdogProvider](self, "_watchdogProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fireWatchdogWithTimer:delegate:timeout:elapsedTime:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v5, 0.0, 3.0);

  if (objc_msgSend(v4, "hasSuffix:", CFSTR(".invalidateAfterFire")))
  {
    BSContinuousMachTimeNow();
    v18 = v17;
    v19 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke;
    block[3] = &unk_24D1BE658;
    block[6] = v18;
    block[4] = self;
    block[5] = buf;
    dispatch_after(v19, MEMORY[0x24BDAC9B8], block);
  }
  else if (objc_msgSend(v4, "hasSuffix:", CFSTR(".completeAfterDelay-20")))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    bls_diagnostics_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v53 = 134217984;
      v54 = v23;
      _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: will clear watchdog as complete after %1.1fs", v53, 0xCu);
    }

    BSContinuousMachTimeNow();
    v26 = v25;
    v27 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_58;
    v51[3] = &unk_24D1BE680;
    v51[6] = v26;
    *(double *)&v51[7] = v23;
    v51[4] = self;
    v51[5] = buf;
    dispatch_after(v27, MEMORY[0x24BDAC9B8], v51);

  }
  else if (objc_msgSend(v4, "hasSuffix:", CFSTR(".replaceAndCompleteAfterDelay-2-10")))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");
    if (v29 <= 2)
    {
      bls_diagnostics_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[BLSHWatchdogTester _triggerTestWatchdog:].cold.1((uint64_t)v4, v29, v43);

    }
    else
    {
      objc_msgSend(v28, "objectAtIndex:", v29 - 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v31;

      objc_msgSend(v28, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleValue");
      v35 = v34;

      bls_diagnostics_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v53 = 134218240;
        v54 = v32;
        v55 = 2048;
        v56 = v35;
        _os_log_impl(&dword_2145AC000, v36, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: will replace after %1.1fs and then clear watchdog as complete after %1.1fs", v53, 0x16u);
      }

      BSContinuousMachTimeNow();
      v38 = v37;
      v39 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
      v40 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_59;
      v45[3] = &unk_24D1BE6A8;
      v49 = v38;
      v50 = v32;
      v48 = buf;
      v45[4] = self;
      v46 = v4;
      v47 = v5;
      v41 = MEMORY[0x24BDAC9B8];
      dispatch_after(v39, MEMORY[0x24BDAC9B8], v45);
      v42 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
      v44[0] = v40;
      v44[1] = 3221225472;
      v44[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_62;
      v44[3] = &unk_24D1BE680;
      v44[6] = v38;
      *(double *)&v44[7] = v35;
      v44[4] = self;
      v44[5] = buf;
      dispatch_after(v42, v41, v44);

    }
  }
LABEL_28:
  _Block_object_dispose(buf, 8);

}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  BSContinuousMachTimeNow();
  v3 = v2 - *(double *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_watchdogProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "explanation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearWatchdogWithExplanation:reason:timeout:elapsedTime:", v4, 2, 0.0, v3);

}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_58(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  BSContinuousMachTimeNow();
  v3 = v2;
  v4 = *(double *)(a1 + 48);
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 56);
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: clearing watchdog as complete after %1.1fs", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_watchdogProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "explanation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearWatchdogWithExplanation:reason:timeout:elapsedTime:", v8, 2, 0.0, v3 - v4);

}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_59(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BLSHWatchdogTesterTimer *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  BSContinuousMachTimeNow();
  v3 = v2;
  v4 = *(double *)(a1 + 64);
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: clearing watchdog as replaced after %1.1fs", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "invalidate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_watchdogProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "explanation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearWatchdogWithExplanation:reason:timeout:elapsedTime:", v8, 1, 0.0, v3 - v4);

  v9 = [BLSHWatchdogTesterTimer alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Test watchdog %@ (replacement)"), *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLSHWatchdogTesterTimer initWithExplanation:](v9, "initWithExplanation:", v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "_watchdogProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fireWatchdogWithTimer:delegate:timeout:elapsedTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), 0.0, 0.0);

}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_62(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  BSContinuousMachTimeNow();
  v3 = v2;
  v4 = *(double *)(a1 + 48);
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 56);
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: clearing watchdog as complete after %1.1fs", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_watchdogProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "explanation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearWatchdogWithExplanation:reason:timeout:elapsedTime:", v8, 2, 0.0, v3 - v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogProviderDelegate, 0);
  objc_storeStrong((id *)&self->_watchdogProvider, 0);
  objc_storeStrong((id *)&self->_testables, 0);
}

- (void)_triggerTestWatchdog:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "only found %lu components in notificationName. should have at least:\"%{public}@\", (uint8_t *)&v3, 0x16u);
}

@end
