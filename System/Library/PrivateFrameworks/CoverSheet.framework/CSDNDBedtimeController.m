@implementation CSDNDBedtimeController

- (CSDNDBedtimeController)initWithStateService:(id)a3 initialObserver:(id)a4
{
  id v7;
  id v8;
  CSDNDBedtimeController *v9;
  CSDNDBedtimeController *v10;
  DNDStateService *stateService;
  id *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSDNDBedtimeController;
  v9 = -[CSDNDBedtimeController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v8)
      -[CSDNDBedtimeController addObserver:](v9, "addObserver:", v8);
    objc_storeStrong((id *)&v10->_stateService, a3);
    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v10->_stateService, "addStateUpdateListener:withCompletionHandler:", v10, 0);
    stateService = v10->_stateService;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke;
    v16[3] = &unk_1E8E2F758;
    v12 = v10;
    v17 = v12;
    -[DNDStateService queryCurrentStateWithCompletionHandler:](stateService, "queryCurrentStateWithCompletionHandler:", v16);
    v13 = objc_alloc_init(MEMORY[0x1E0DA8598]);
    v14 = v12[5];
    v12[5] = v13;

    objc_msgSend(v12[5], "addObserver:", v12);
  }

  return v10;
}

void __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke_2;
  v5[3] = &unk_1E8E2DC00;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __63__CSDNDBedtimeController_initWithStateService_initialObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "setActive:", objc_msgSend(*(id *)(a1 + 32), "sb_isBedtimeModeActive"));
}

- (CSDNDBedtimeController)init
{
  void *v3;
  CSDNDBedtimeController *v4;

  objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", CFSTR("com.apple.springboard.dashboard.bedtime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CSDNDBedtimeController initWithStateService:initialObserver:](self, "initWithStateService:initialObserver:", v3, 0);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[DNDStateService removeStateUpdateListener:](self->_stateService, "removeStateUpdateListener:", self);
  -[CSDNDBedtimeController _cleanUpGreetingGracePeriodTimer](self, "_cleanUpGreetingGracePeriodTimer");
  v3.receiver = self;
  v3.super_class = (Class)CSDNDBedtimeController;
  -[CSDNDBedtimeController dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  if (!-[NSHashTable containsObject:](observers, "containsObject:", v4))
    -[NSHashTable addObject:](self->_observers, "addObject:", v8);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setActive:(BOOL)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  BSAbsoluteMachTimer **p_greetingGracePeriodTimer;
  BSAbsoluteMachTimer *greetingGracePeriodTimer;
  BSAbsoluteMachTimer *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_active != a3)
  {
    self->_active = a3;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = self->_observers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          SBLogDoNotDisturbBedtime();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromBOOL();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v23 = v10;
            _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_DEFAULT, "Active state changed to: %@", buf, 0xCu);

          }
          objc_msgSend(v8, "dndBedtimeControllerActiveStateDidChange:", self);
        }
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v5);
    }

    if (self->_active)
    {
      -[CSDNDBedtimeController _setShouldShowGreeting:](self, "_setShouldShowGreeting:", 0);
    }
    else if (self->_deactivated && !-[CSDNDBedtimeController isGreetingDisabled](self, "isGreetingDisabled"))
    {
      -[CSDNDBedtimeController _setShouldShowGreeting:](self, "_setShouldShowGreeting:", 1);
      objc_initWeak((id *)buf, self);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("CSDNDBedtimeController.greetingGracePeriodTimer"));
      greetingGracePeriodTimer = self->_greetingGracePeriodTimer;
      p_greetingGracePeriodTimer = &self->_greetingGracePeriodTimer;
      *p_greetingGracePeriodTimer = (BSAbsoluteMachTimer *)v11;

      v14 = *p_greetingGracePeriodTimer;
      v15 = MEMORY[0x1E0C80D38];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __36__CSDNDBedtimeController_setActive___block_invoke;
      v16[3] = &unk_1E8E2DD30;
      objc_copyWeak(&v17, (id *)buf);
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v14, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v16, 900.0, 0.0);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __36__CSDNDBedtimeController_setActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanUpGreetingGracePeriodTimer");
  objc_msgSend(WeakRetained, "_setShouldShowGreeting:", 0);

}

- (BOOL)isGreetingDisabled
{
  HKSPSleepStore *sleepStore;
  HKSPSleepSettings *v4;
  id v5;
  HKSPSleepSettings *sleepSettings;
  HKSPSleepSettings *v7;
  BOOL v8;
  char v9;
  NSObject *v10;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  sleepStore = self->_sleepStore;
  v15 = 0;
  -[HKSPSleepStore currentSleepSettingsWithError:](sleepStore, "currentSleepSettingsWithError:", &v15);
  v4 = (HKSPSleepSettings *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  sleepSettings = self->_sleepSettings;
  self->_sleepSettings = v4;

  v7 = self->_sleepSettings;
  if (v7)
    v8 = 1;
  else
    v8 = v5 == 0;
  if (v8)
  {
    v9 = -[HKSPSleepSettings springBoardGreetingDisabled](v7, "springBoardGreetingDisabled");
  }
  else
  {
    SBLogDoNotDisturbBedtime();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CSDNDBedtimeController isGreetingDisabled].cold.1((uint64_t)v5, v10);

    v9 = 1;
  }
  SBLogDoNotDisturbBedtime();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "Greeting is disabled: %@", buf, 0xCu);

  }
  return v9;
}

- (void)sleepStore:(id)a3 sleepSettingsDidChange:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSDNDBedtimeController_sleepStore_sleepSettingsDidChange___block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__CSDNDBedtimeController_sleepStore_sleepSettingsDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  SBLogDoNotDisturbBedtime();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v2, OS_LOG_TYPE_DEFAULT, "Sleep settings changed, checking if greeting should be disabled", v4, 2u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "isGreetingDisabled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setShouldShowGreeting:forceUpdateObservers:", 0, 1);
  return result;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CSDNDBedtimeController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__CSDNDBedtimeController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v7[3] = &unk_1E8E2DC00;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __73__CSDNDBedtimeController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  char v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sb_isBedtimeModeActive");

  v4 = objc_msgSend(*(id *)(a1 + 32), "reason");
  v5 = objc_msgSend(*(id *)(a1 + 32), "reason");
  v6 = objc_msgSend(*(id *)(a1 + 32), "source");
  if ((_DWORD)v3)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v7 = (id *)(a1 + 40);
    *(_BYTE *)(v8 + 32) = 0;
  }
  else
  {
    v9 = v6;
    objc_msgSend(*(id *)(a1 + 32), "previousState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sb_isBedtimeModeActive");
    if (v4 == 3 || v5 == 2)
      v13 = v11;
    else
      v13 = 0;
    if (v9 == 1)
      v13 = 0;
    v14 = *(_QWORD *)(a1 + 40);
    v7 = (id *)(a1 + 40);
    *(_BYTE *)(v14 + 32) = v13;

  }
  return objc_msgSend(*v7, "setActive:", v3);
}

- (void)_setShouldShowGreeting:(BOOL)a3
{
  -[CSDNDBedtimeController _setShouldShowGreeting:forceUpdateObservers:](self, "_setShouldShowGreeting:forceUpdateObservers:", a3, 0);
}

- (void)_setShouldShowGreeting:(BOOL)a3 forceUpdateObservers:(BOOL)a4
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_shouldShowGreeting == a3)
  {
    if (!a4)
      return;
  }
  else
  {
    self->_shouldShowGreeting = a3;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        SBLogDoNotDisturbBedtime();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromBOOL();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v12;
          _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "Should show greeting view state changed to: %@", buf, 0xCu);

        }
        objc_msgSend(v10, "dndBedtimeControllerShowGreetingStateDidChange:animated:", self, self->_greetingGracePeriodTimer == 0);
      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

}

- (void)_cleanUpGreetingGracePeriodTimer
{
  BSAbsoluteMachTimer *greetingGracePeriodTimer;
  BSAbsoluteMachTimer *v4;

  greetingGracePeriodTimer = self->_greetingGracePeriodTimer;
  if (greetingGracePeriodTimer)
  {
    -[BSAbsoluteMachTimer invalidate](greetingGracePeriodTimer, "invalidate");
    v4 = self->_greetingGracePeriodTimer;
    self->_greetingGracePeriodTimer = 0;

  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)shouldShowGreeting
{
  return self->_shouldShowGreeting;
}

- (void)setShouldShowGreeting:(BOOL)a3
{
  self->_shouldShowGreeting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_greetingGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
}

- (void)isGreetingDisabled
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0337000, a2, OS_LOG_TYPE_ERROR, "isGreetingDisabled - Failed to retrieve Sleep settings with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
