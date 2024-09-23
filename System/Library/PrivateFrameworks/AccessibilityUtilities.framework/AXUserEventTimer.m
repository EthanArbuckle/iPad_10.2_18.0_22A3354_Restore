@implementation AXUserEventTimer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_13);
  return (id)sharedInstance_timer;
}

void __34__AXUserEventTimer_sharedInstance__block_invoke()
{
  AXUserEventTimer *v0;
  void *v1;

  v0 = objc_alloc_init(AXUserEventTimer);
  v1 = (void *)sharedInstance_timer;
  sharedInstance_timer = (uint64_t)v0;

}

- (AXUserEventTimer)init
{
  AXUserEventTimer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *assertionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUserEventTimer;
  v2 = -[AXUserEventTimer init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXUserEventTimer-AssertionQueue", 0);
    assertionQueue = v2->_assertionQueue;
    v2->_assertionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)_canUseIdleTimerServices
{
  if (AXInPreboardScenario())
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0D3A8B8], "isIdleTimerServiceAvailable");
}

- (void)userEventOccurred
{
  NSObject *v2;
  id v3;

  if (-[AXUserEventTimer _canUseIdleTimerServices](self, "_canUseIdleTimerServices"))
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, &__block_literal_global_6);

  }
  else
  {
    +[AXBackBoardServer server](AXBackBoardServer, "server");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userEventOccurred");

  }
}

void __37__AXUserEventTimer_userEventOccurred__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D3A8B8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v1 = (void *)objc_msgSend(v0, "newAssertionToDisableIdleTimerForReason:error:", CFSTR("AccessibilityUserEventOccurred"), &v5);
  v2 = v5;

  objc_msgSend(v1, "invalidate");
  if (v2)
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__AXUserEventTimer_userEventOccurred__block_invoke_cold_1((uint64_t)v2, v3, v4);

  }
}

- (void)_startTrackingPoorMansAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *assertionQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "AXUserEventTimer: Now disabling idle timer for reason: %@", buf, 0xCu);

  }
  assertionQueue = self->_assertionQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__AXUserEventTimer__startTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E24C5200;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(assertionQueue, v9);

}

void __52__AXUserEventTimer__startTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  if (!v2)
  {
    +[AXBackBoardServer server](AXBackBoardServer, "server");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLockScreenDimTimerEnabled:", 0);

  }
}

- (void)_stopTrackingPoorMansAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *assertionQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "AXUserEventTimer: No longer disabling idle timer for reason: %@", buf, 0xCu);

  }
  assertionQueue = self->_assertionQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AXUserEventTimer__stopTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E24C5200;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(assertionQueue, v9);

}

void __51__AXUserEventTimer__stopTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    {
      +[AXBackBoardServer server](AXBackBoardServer, "server");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLockScreenDimTimerEnabled:", 1);

    }
  }
}

- (id)acquireAssertionToDisableIdleTimerWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;
  id v15;

  v4 = a3;
  if (!-[AXUserEventTimer _canUseIdleTimerServices](self, "_canUseIdleTimerServices"))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0D3A8B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accessibility-%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = (void *)objc_msgSend(v5, "newAssertionToDisableIdleTimerForReason:error:", v6, &v15);
  v8 = v15;

  if (v8)
  {
    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXUserEventTimer acquireAssertionToDisableIdleTimerWithReason:].cold.1((uint64_t)v8, (uint64_t)v4, v9);

  }
  if (!v7)
  {
LABEL_7:
    objc_initWeak(&location, self);
    v10 = objc_alloc(MEMORY[0x1E0D01868]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__AXUserEventTimer_acquireAssertionToDisableIdleTimerWithReason___block_invoke;
    v12[3] = &unk_1E24C5898;
    objc_copyWeak(&v13, &location);
    v7 = (void *)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("AccessibilityDisableIdleTimer"), v4, v12);
    -[AXUserEventTimer _startTrackingPoorMansAssertion:](self, "_startTrackingPoorMansAssertion:", v7);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __65__AXUserEventTimer_acquireAssertionToDisableIdleTimerWithReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_stopTrackingPoorMansAssertion:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
}

void __37__AXUserEventTimer_userEventOccurred__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = CFSTR("AccessibilityUserEventOccurred");
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_0_4(&dword_18C62B000, a2, a3, "Error getting assertion %@ > %@", (uint8_t *)&v3);
}

- (void)acquireAssertionToDisableIdleTimerWithReason:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_4(&dword_18C62B000, a3, (uint64_t)a3, "Error getting assertion %@ > %@", (uint8_t *)&v3);
}

@end
