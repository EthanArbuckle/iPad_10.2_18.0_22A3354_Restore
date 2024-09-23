@implementation BLSHBacklightFBSceneHostEnvironment

- (BLSHBacklightFBSceneHostEnvironment)initWithFBScene:(id)a3
{
  id v4;
  BLSHBacklightFBSceneHostEnvironment *v5;
  uint64_t v6;
  NSHashTable *lock_observers;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *nilSceneIdentifier;
  void *v14;
  void *v15;
  uint64_t v16;
  RBSProcessIdentity *budgetProcessIdentity;
  void *v18;
  BLSHBacklightFBSceneEnvironmentActionHandler *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  BLSHBacklightFBSceneHostEnvironment *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BLSHBacklightFBSceneHostEnvironment;
  v5 = -[BLSHBacklightFBSceneHostEnvironment init](&v23, sel_init);
  if (v5)
  {
    v5->_creationMachTime = mach_continuous_time();
    v5->_lock._os_unfair_lock_opaque = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
    lock_observers = v5->_lock_observers;
    v5->_lock_observers = (NSHashTable *)v6;

    v5->_lock_renderSeed = 1;
    v5->_lock_requestDateSpecifierFailureCount = 0;
    if (initWithFBScene__onceToken != -1)
      dispatch_once(&initWithFBScene__onceToken, &__block_literal_global_15);
    if (__disableFrontBoardRBAssertions)
    {
      bls_scenes_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = v5;
        _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEFAULT, "%p: DisableFrontBoardRBAssertions=YES", buf, 0xCu);
      }

    }
    bls_scenes_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightFBSceneHostEnvironment initWithFBScene:].cold.1((uint64_t)v5, v4);

    objc_storeWeak((id *)&v5->_fbScene, v4);
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<nil scene>:%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    nilSceneIdentifier = v5->_nilSceneIdentifier;
    v5->_nilSceneIdentifier = (NSString *)v12;

    objc_msgSend(v4, "definition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processIdentity");
    v16 = objc_claimAutoreleasedReturnValue();
    budgetProcessIdentity = v5->_budgetProcessIdentity;
    v5->_budgetProcessIdentity = (RBSProcessIdentity *)v16;

    objc_msgSend(v4, "addObserver:", v5);
    objc_msgSend(v4, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = objc_alloc_init(BLSHBacklightFBSceneEnvironmentActionHandler);
      objc_msgSend(v18, "addActionHandler:forScene:", v19, v4);
    }
    else
    {
      bls_scenes_log();
      v19 = (BLSHBacklightFBSceneEnvironmentActionHandler *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "debugDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v25 = v5;
        v26 = 2114;
        v27 = v20;
        v28 = 2114;
        v29 = v18;
        v30 = 2114;
        v31 = v21;
        _os_log_impl(&dword_2145AC000, &v19->super, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ sceneDelegate:%{public}@ does not respond to @selector(addActionHandler:) - cannot invalidate from client, scene:%{public}@", buf, 0x2Au);

      }
    }

  }
  return v5;
}

void __55__BLSHBacklightFBSceneHostEnvironment_initWithFBScene___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  objc_msgSend(v0, "objectForKey:", CFSTR("DisableFrontBoardRBAssertions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v6 = v4;

  v5 = v6;
  if (v6)
  {
    __disableFrontBoardRBAssertions = objc_msgSend(v6, "BOOLValue");
    v5 = v6;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BLSHAggregatedProcessAssertion invalidate](self->_lock_secondsFidelityAssertion, "invalidate");
  -[BLSHAggregatedProcessAssertion invalidate](self->_lock_renderSessionAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightFBSceneHostEnvironment;
  -[BLSHBacklightFBSceneHostEnvironment dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  id WeakRetained;
  void *nilSceneIdentifier;
  void *v5;
  NSString *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "identifier");
  nilSceneIdentifier = (void *)objc_claimAutoreleasedReturnValue();
  v5 = nilSceneIdentifier;
  if (!nilSceneIdentifier)
    nilSceneIdentifier = self->_nilSceneIdentifier;
  v6 = nilSceneIdentifier;

  return v6;
}

- (RBSProcessIdentity)budgetProcessIdentity
{
  return self->_budgetProcessIdentity;
}

- (BOOL)clientHasDelegate
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_hasDelegate");

  return v4;
}

- (BOOL)isClientActive
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isDelegateActive");

  return v4;
}

- (BLSBacklightSceneVisualState)visualState
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_visualState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BLSBacklightSceneVisualState *)v4;
}

- (NSDate)presentationDate
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_presentationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)clientSupportsAlwaysOn
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_supportsAlwaysOn");

  return v4;
}

- (BOOL)isLocal
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocal");

  return v5;
}

- (BOOL)isDisplayBlanked
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isBlanked");

  return v4;
}

- (BOOL)isAlwaysOnEnabledForEnvironment
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isAlwaysOnEnabledForEnvironment");

  return v4;
}

- (void)setAlwaysOnEnabledForEnvironment:(BOOL)a3
{
  int v3;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD v10[5];
  char v11;
  _QWORD v12[4];
  char v13;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bls_isAlwaysOnEnabledForEnvironment");

    if (v8 != v3)
    {
      v9 = MEMORY[0x24BDAC760];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke;
      v12[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
      v13 = v3;
      objc_msgSend(v6, "updateSettingsWithBlock:", v12);
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke_2;
      v10[3] = &unk_24D1BC980;
      v10[4] = self;
      v11 = v3;
      -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v10);
    }
  }

}

uint64_t __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setAlwaysOnEnabledForEnvironment:", *(unsigned __int8 *)(a1 + 32));
}

void __72__BLSHBacklightFBSceneHostEnvironment_setAlwaysOnEnabledForEnvironment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetAlwaysOnEnabledForEnvironment:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 56), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)isLiveUpdating
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_isLiveUpdating");

  return v4;
}

- (void)setLiveUpdating:(BOOL)a3
{
  int v3;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD v10[5];
  char v11;
  _QWORD v12[4];
  char v13;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bls_isLiveUpdating");

    if (v8 != v3)
    {
      v9 = MEMORY[0x24BDAC760];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke;
      v12[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
      v13 = v3;
      objc_msgSend(v6, "updateSettingsWithBlock:", v12);
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke_2;
      v10[3] = &unk_24D1BC980;
      v10[4] = self;
      v11 = v3;
      -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v10);
    }
  }

}

uint64_t __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setLiveUpdating:", *(unsigned __int8 *)(a1 + 32));
}

void __55__BLSHBacklightFBSceneHostEnvironment_setLiveUpdating___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetLiveUpdating:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bls_hasUnrestrictedFramerateUpdates");

  return v4;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  int v3;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD v10[5];
  char v11;
  _QWORD v12[4];
  char v13;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bls_hasUnrestrictedFramerateUpdates");

    if (v8 != v3)
    {
      v9 = MEMORY[0x24BDAC760];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke;
      v12[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
      v13 = v3;
      objc_msgSend(v6, "updateSettingsWithBlock:", v12);
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke_2;
      v10[3] = &unk_24D1BC980;
      v10[4] = self;
      v11 = v3;
      -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v10);
    }
  }

}

uint64_t __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setUnrestrictedFramerateUpdates:", *(unsigned __int8 *)(a1 + 32));
}

void __71__BLSHBacklightFBSceneHostEnvironment_setUnrestrictedFramerateUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetUnrestrictedFramerateUpdates:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)is1HzFlipbook
{
  BLSHBacklightFBSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)set1HzFlipbook:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_1HzFlipbook;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_1HzFlipbook = self->_lock_1HzFlipbook;
  self->_lock_1HzFlipbook = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_1HzFlipbook != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__BLSHBacklightFBSceneHostEnvironment_set1HzFlipbook___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v7);
  }
}

void __54__BLSHBacklightFBSceneHostEnvironment_set1HzFlipbook___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSet1HzFlipbook:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)cacheFlipbookOnDisplayWake
{
  BLSHBacklightFBSceneHostEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cacheFlipbookOnDisplayWake;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCacheFlipbookOnDisplayWake:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_cacheFlipbookOnDisplayWake;
  _QWORD v7[5];
  char v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_cacheFlipbookOnDisplayWake = self->_lock_cacheFlipbookOnDisplayWake;
  self->_lock_cacheFlipbookOnDisplayWake = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_cacheFlipbookOnDisplayWake != v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__BLSHBacklightFBSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke;
    v7[3] = &unk_24D1BC980;
    v7[4] = self;
    v8 = v3;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v7);
  }
}

void __69__BLSHBacklightFBSceneHostEnvironment_setCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:hostDidSetCacheFlipbookOnDisplayWake:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isAtLeastOneMinuteOld
{
  double v1;

  if (result)
  {
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    return v1 > 60.0;
  }
  return result;
}

- (void)amendSceneSettings:(id)a3
{
  unint64_t lock_renderSeed;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_renderSeed = self->_lock_renderSeed;
  os_unfair_lock_unlock(&self->_lock);
  +[BLSHBacklightFBSceneHostEnvironment amendSceneSettingsDelegate]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hostEnvironment:didAmendSceneSettings:", self, v6))
    objc_msgSend(v6, "bls_setRenderSeed:", lock_renderSeed);

}

+ (id)amendSceneSettingsDelegate
{
  id v0;

  objc_opt_self();
  os_unfair_lock_lock(&_classLock_3);
  v0 = (id)_amendSceneSettingsDelegate;
  os_unfair_lock_unlock(&_classLock_3);
  return v0;
}

- (void)setDisplayBlanked:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[4];
  BOOL v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__BLSHBacklightFBSceneHostEnvironment_setDisplayBlanked___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = a3;
  objc_msgSend(WeakRetained, "updateSettingsWithBlock:", v5);

}

uint64_t __57__BLSHBacklightFBSceneHostEnvironment_setDisplayBlanked___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setBlanked:", *(unsigned __int8 *)(a1 + 32));
}

- (void)deactivateClient
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "updateSettingsWithBlock:", &__block_literal_global_27_1);

}

uint64_t __55__BLSHBacklightFBSceneHostEnvironment_deactivateClient__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setDelegateActive:", 0);
}

- (void)invalidateContentForReason:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_renderSeed;
  os_unfair_lock_unlock(&self->_lock);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__BLSHBacklightFBSceneHostEnvironment_invalidateContentForReason___block_invoke;
  v6[3] = &unk_24D1BC9A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v6);

}

void __66__BLSHBacklightFBSceneHostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:invalidateContentForReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (uint64_t)incrementRequestDateSpecifierFailureCount
{
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = a1 + 16;
  os_unfair_lock_lock(a1 + 16);
  v3 = a1[22]._os_unfair_lock_opaque + 1;
  a1[22]._os_unfair_lock_opaque = v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

- (void)resetRequestDateSpecifierFailureCount
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = a1 + 16;
    os_unfair_lock_lock(a1 + 16);
    a1[22]._os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v6 = (id)objc_msgSend(v3, "appendPointer:withName:", WeakRetained, CFSTR("scene"));

  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment clientHasDelegate](self, "clientHasDelegate"), CFSTR("clientEnabled"), 0);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isClientActive](self, "isClientActive"), CFSTR("clientActive"), 0);
  -[BLSHBacklightFBSceneHostEnvironment visualState](self, "visualState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("visualState"));

  -[BLSHBacklightFBSceneHostEnvironment presentationDate](self, "presentationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bls_shortLoggingString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v12, CFSTR("presentationDate"));

  v13 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isAlwaysOnEnabledForEnvironment](self, "isAlwaysOnEnabledForEnvironment"), CFSTR("alwaysOnEnabled"), 0);
  v14 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isLiveUpdating](self, "isLiveUpdating"), CFSTR("liveUpdating"), 1);
  v15 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment hasUnrestrictedFramerateUpdates](self, "hasUnrestrictedFramerateUpdates"), CFSTR("hasUnrestrictedFramerateUpdates"), 1);
  v16 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHBacklightFBSceneHostEnvironment isDisplayBlanked](self, "isDisplayBlanked"), CFSTR("displayBlanked"), 1);
  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)readAndClearShouldInvalidateWhenActivated
{
  os_unfair_lock_s *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  v3 = *(_BYTE *)(a1 + 92) != 0;
  *(_BYTE *)(a1 + 92) = 0;
  os_unfair_lock_unlock(v2);
  return v3;
}

- (void)setShouldInvalidateWhenActivated
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 64);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 92) = 1;
    os_unfair_lock_unlock(v2);
  }
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  id WeakRetained;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  void (**v11)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    bls_scenes_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightFBSceneHostEnvironment requestedFidelityForInactiveContentWithCompletion:].cold.1();

    goto LABEL_10;
  }
  if ((objc_msgSend(WeakRetained, "isActive") & 1) == 0)
  {
    bls_scenes_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightFBSceneHostEnvironment requestedFidelityForInactiveContentWithCompletion:].cold.2();

    -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)self);
LABEL_10:
    v4[2](v4, 1);
    goto LABEL_11;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke;
  v9[3] = &unk_24D1BD840;
  v9[4] = self;
  v11 = v4;
  v10 = v6;
  objc_msgSend(v10, "updateSettingsWithTransitionBlock:", v9);

LABEL_11:
}

id __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE0B8B0]);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2;
  v18 = &unk_24D1BD818;
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 32);
  v19 = v4;
  v20 = v3[2];
  v5 = (void *)objc_msgSend(v2, "initWithCompletion:", &v15);
  objc_msgSend(v3[1], "definition", v15, v16, v17, v18, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_msgSend(v7, "transitionContextClass");

  v9 = objc_alloc_init(v8);
  v10 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActions:", v12);

  bls_scenes_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_cold_1(v3);

  return v9;
}

void __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    bls_scenes_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218754;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v3;
      _os_log_error_impl(&dword_2145AC000, v5, OS_LOG_TYPE_ERROR, "%p:%{public}@ client desired fidelity action failed error:%{public}@ response:%{public}@, requestedFidelityForInactiveContent:Minutes", (uint8_t *)&v10, 0x2Au);

    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v3, "desiredFidelity");
    bls_scenes_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2_cold_1(a1);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (uint64_t)sceneWantsProcessAssertion:(void *)a3 withSceneSettings:
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
    {
      objc_msgSend(v5, "clientSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "bls_optsOutOfProcessAssertions");

      v9 = objc_msgSend(v6, "activityMode");
      objc_msgSend(v5, "definition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isLocal");

      if (v9 == 7)
        v13 = 1;
      else
        v13 = v8;
      v14 = (v13 | v12) ^ 1u;
      bls_scenes_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = v9 == 7;
        objc_msgSend(a1, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134219522;
        v20 = a1;
        v21 = 2114;
        v22 = v17;
        v23 = 2048;
        v24 = v5;
        v25 = 1024;
        v26 = v14;
        v27 = 1024;
        v28 = v8;
        v29 = 1024;
        v30 = v16;
        v31 = 1024;
        v32 = v12;
        _os_log_debug_impl(&dword_2145AC000, v15, OS_LOG_TYPE_DEBUG, "%p:%{public}@ scene:%p wantsProcessAssertions:%{BOOL}u optsOut:%{BOOL}u externalManaged:%{BOOL}u local:%{BOOL}u", (uint8_t *)&v19, 0x38u);

      }
    }
    else
    {
      bls_scenes_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:].cold.1();
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id WeakRetained;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  void *v28;
  unint64_t lock_renderSeed;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BLSHBacklightFBSceneHostEnvironment *v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  BLSHBacklightFBSceneHostEnvironment *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  unint64_t v53;
  BOOL v54;
  BOOL v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  BOOL v60;
  uint8_t buf[4];
  BLSHBacklightFBSceneHostEnvironment *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  _BOOL4 v72;
  __int16 v73;
  id v74;
  __int16 v75;
  _BOOL4 v76;
  uint64_t v77;

  v40 = a7;
  v12 = a5;
  v77 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(v19, "date");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && !v12)
  {
    bls_scenes_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BLSHBacklightFBSceneHostEnvironment updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:].cold.2();

  }
  if ((((v18 == 0) ^ v12) & 1) == 0)
  {
    bls_scenes_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[BLSHBacklightFBSceneHostEnvironment updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:].cold.1();

  }
  v23 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke;
  v56[3] = &unk_24D1BD868;
  v24 = v16;
  v57 = v24;
  v25 = v17;
  v58 = v25;
  v60 = v12;
  v26 = v18;
  v59 = v26;
  v27 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v56);
  if (WeakRetained)
  {
    v42 = WeakRetained;
    v28 = v15;
    os_unfair_lock_lock(&self->_lock);
    lock_renderSeed = self->_lock_renderSeed;
    os_unfair_lock_unlock(&self->_lock);
    bls_scenes_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v39 = (BLSHBacklightFBSceneHostEnvironment *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bls_shortLoggingString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bls_shortLoggingString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v39;
      v63 = 2114;
      v64 = v38;
      v65 = 2114;
      v66 = v37;
      _os_log_debug_impl(&dword_2145AC000, v30, OS_LOG_TYPE_DEBUG, "FBSceneHostEnv.updateToVisualState: sending update from host to scene:%{public}@ to state:%{public}@ for event:%{public}@", buf, 0x20u);

    }
    v44[0] = v23;
    v44[1] = 3221225472;
    v44[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_56;
    v44[3] = &unk_24D1BD908;
    v31 = v41;
    v45 = v41;
    v46 = v43;
    v53 = lock_renderSeed;
    v32 = v42;
    v47 = v32;
    v48 = self;
    v15 = v28;
    v49 = v28;
    v54 = v12;
    v55 = v40;
    v50 = v24;
    v51 = v25;
    v52 = v26;
    objc_msgSend(v32, "updateSettingsWithTransitionBlock:", v44);
    if ((objc_msgSend(v32, "isActive") & 1) == 0)
      v27[2](v27);

    WeakRetained = v42;
  }
  else
  {
    bls_scenes_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v34 = v15;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bls_shortLoggingString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219778;
      v62 = self;
      v63 = 2114;
      v64 = v35;
      v65 = 2114;
      v66 = 0;
      v67 = 2114;
      v68 = v41;
      v69 = 2114;
      v70 = v36;
      v71 = 1024;
      v72 = v12;
      v73 = 2114;
      v74 = v34;
      v75 = 1024;
      v76 = v40;
      _os_log_impl(&dword_2145AC000, v33, OS_LOG_TYPE_INFO, "%p:%{public}@ nil scene, will not update scene:%{public}@ to visualState:%{public}@ presentationDate:%{public}@ animated:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u", buf, 0x4Au);

      v15 = v34;
      WeakRetained = 0;
    }

    v27[2](v27);
    v31 = v41;
  }

}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke(uint64_t a1)
{
  __n128 v2;
  uint64_t v3;
  uint64_t v4;
  dispatch_time_t v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v2.n128_u64[0] = 0.5;
    if (!*(_BYTE *)(a1 + 56))
      v2.n128_f64[0] = 0.0;
    (*(void (**)(__n128))(v3 + 16))(v2);
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v5 = dispatch_time(0, 500000000);
      dispatch_after(v5, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 48));
    }
    else
    {
      (*(void (**)(void))(v4 + 16))();
    }
  }
}

id __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  BLSHAggregatedProcessAssertion *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BLSHAggregatedProcessAssertion *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  NSObject *v58;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int8x16_t v71;
  uint64_t v72;
  _QWORD v73[4];
  NSObject *v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  char v80;
  _QWORD v81[5];
  id v82;
  id v83;
  id v84;
  id v85;
  char v86;
  _QWORD v87[4];
  NSObject *v88;
  int8x16_t v89;
  id v90;
  id v91;
  id v92;
  id v93;
  char v94;
  char v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  int v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "bls_setDelegateActive:", 1);
  objc_msgSend(v3, "bls_setVisualState:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "bls_setPresentationDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "bls_setRenderSeed:", *(_QWORD *)(a1 + 96));
  v4 = objc_msgSend(*(id *)(a1 + 48), "isActive");
  v5 = *(void **)(a1 + 56);
  if ((v4 & 1) != 0)
  {
    if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](v5, *(void **)(a1 + 48), v3))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "adjustedLuminance") == 1
        && objc_msgSend(*(id *)(a1 + 32), "updateFidelity") == 2)
      {
        v6 = objc_msgSend(*(id *)(a1 + 56), "isLiveUpdating");
      }
      else
      {
        v6 = 0;
      }
      objc_msgSend(*(id *)(a1 + 48), "definition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (v6)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 64));
          v13 = *(_QWORD *)(a1 + 56);
          if (!*(_QWORD *)(v13 + 32))
          {
            bls_scenes_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = *(void **)(a1 + 56);
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 134218498;
              v97 = v15;
              v98 = 2114;
              v99 = v16;
              v100 = 2048;
              v101 = v17;
              _os_log_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ taking CPU/GPU grant process assertion \"1FPSFlipbook\" for scene %p", buf, 0x20u);

            }
            v18 = [BLSHAggregatedProcessAssertion alloc];
            v19 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*(id *)(a1 + 56), "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("1FPSFlipbook forScene:%@"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[BLSHAggregatedProcessAssertion initWithExplanation:processIdentity:duration:](v18, "initWithExplanation:processIdentity:duration:", v21, v12, 1.79769313e308);
            v23 = *(_QWORD *)(a1 + 56);
            v24 = *(void **)(v23 + 32);
            *(_QWORD *)(v23 + 32) = v22;

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(_QWORD *)(a1 + 56)));
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "acquireWithCompletion:", 0);
            v13 = *(_QWORD *)(a1 + 56);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 64));

          v9 = 0;
LABEL_29:
          v40 = objc_alloc(MEMORY[0x24BE0B878]);
          v41 = *(_QWORD *)(a1 + 64);
          v42 = *(unsigned __int8 *)(a1 + 104);
          v43 = MEMORY[0x24BDAC760];
          v44 = *(unsigned __int8 *)(a1 + 105);
          v87[0] = MEMORY[0x24BDAC760];
          v87[1] = 3221225472;
          v87[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_63;
          v87[3] = &unk_24D1BD890;
          v94 = v42;
          v7 = v9;
          v88 = v7;
          v71 = *(int8x16_t *)(a1 + 48);
          v45 = (id)v71.i64[0];
          v89 = vextq_s8(v71, v71, 8uLL);
          v90 = *(id *)(a1 + 32);
          v91 = *(id *)(a1 + 40);
          v95 = *(_BYTE *)(a1 + 105);
          v92 = *(id *)(a1 + 64);
          v93 = *(id *)(a1 + 72);
          v46 = (void *)objc_msgSend(v40, "initWithBacklightChangeEvent:animated:touchTargetable:isUpdateToDateSpecifier:completion:", v41, v42, v44, 0, v87);
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(a1 + 80))
          {
            v48 = objc_alloc(MEMORY[0x24BE0B888]);
            v81[0] = v43;
            v81[1] = 3221225472;
            v81[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_67;
            v81[3] = &unk_24D1BD8B8;
            v81[4] = *(_QWORD *)(a1 + 56);
            v82 = *(id *)(a1 + 32);
            v83 = *(id *)(a1 + 40);
            v86 = *(_BYTE *)(a1 + 104);
            v84 = *(id *)(a1 + 64);
            v85 = *(id *)(a1 + 80);
            v49 = (void *)objc_msgSend(v48, "initWithCompletion:", v81);
            objc_msgSend(v47, "addObject:", v49);

          }
          if (*(_QWORD *)(a1 + 88))
          {
            v50 = objc_alloc(MEMORY[0x24BE0B880]);
            v73[0] = v43;
            v73[1] = 3221225472;
            v73[2] = __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_71;
            v73[3] = &unk_24D1BD8E0;
            v51 = v7;
            v52 = *(_QWORD *)(a1 + 56);
            v74 = v51;
            v75 = v52;
            v76 = *(id *)(a1 + 32);
            v77 = *(id *)(a1 + 40);
            v80 = *(_BYTE *)(a1 + 104);
            v78 = *(id *)(a1 + 64);
            v79 = *(id *)(a1 + 88);
            v53 = (void *)objc_msgSend(v50, "initWithCompletion:", v73);
            objc_msgSend(v47, "addObject:", v53);

          }
          objc_msgSend(*(id *)(a1 + 48), "definition");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "specification");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (objc_class *)objc_msgSend(v55, "transitionContextClass");

          v8 = objc_alloc_init(v56);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v47);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setActions:", v57);

          if (__disableFrontBoardRBAssertions)
            objc_msgSend(v8, "setRunningBoardAssertionDisabled:", 1);
          bls_scenes_log();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            v66 = *(void **)(a1 + 56);
            objc_msgSend(v66, "identifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = *(_QWORD *)(a1 + 40);
            v69 = *(_QWORD *)(a1 + 32);
            v70 = *(_QWORD *)(a1 + 48);
            v68 = objc_msgSend(*(id *)(a1 + 56), "clientHasDelegate");
            *(_DWORD *)buf = 134219522;
            v97 = v66;
            v98 = 2114;
            v99 = v67;
            v100 = 2114;
            v101 = v69;
            v102 = 2048;
            v103 = v70;
            v104 = 2114;
            v105 = v72;
            v106 = 1024;
            v107 = v68;
            v108 = 2114;
            v109 = v47;
            _os_log_debug_impl(&dword_2145AC000, v58, OS_LOG_TYPE_DEBUG, "%p:%{public}@ updateToVisualState:%{public}@ scene:%p to presentationDate:%{public}@ clientHasDelegate:%{BOOL}u with:%{public}@", buf, 0x44u);

          }
          goto LABEL_38;
        }
        v29 = (void *)MEMORY[0x24BDD17C8];
        v30 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 56), "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("updateToSceneVisualState:%@ forScene:%@"), v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = -[BLSHAggregatedProcessAssertion initWithExplanation:processIdentity:duration:]([BLSHAggregatedProcessAssertion alloc], "initWithExplanation:processIdentity:duration:", v32, v12, 2.75);
        -[BLSHAggregatedProcessAssertion setShouldFaultOnFailureToAcquire:](v9, "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(_QWORD *)(a1 + 56)));
        -[BLSHAggregatedProcessAssertion acquireWithCompletion:](v9, "acquireWithCompletion:", 0);

      }
      else
      {
        bls_scenes_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(void **)(a1 + 56);
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          v97 = v26;
          v98 = 2114;
          v99 = v27;
          v100 = 2048;
          v101 = v28;
          _os_log_impl(&dword_2145AC000, v25, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU/GPU grant process assertion \"1FPSFlipbook\", buf, 0x20u);

        }
        v9 = 0;
        if ((v6 & 1) != 0)
          goto LABEL_29;
      }
    }
    else
    {
      v9 = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 64));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 32))
    {
      bls_scenes_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *(void **)(a1 + 56);
        objc_msgSend(v34, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218498;
        v97 = v34;
        v98 = 2114;
        v99 = v35;
        v100 = 2048;
        v101 = v36;
        _os_log_impl(&dword_2145AC000, v33, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ dropping CPU/GPU grant process assertion \"1FPSFlipbook\" for scene %p", buf, 0x20u);

      }
      v37 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v37, "invalidate");
    v38 = *(_QWORD *)(a1 + 56);
    v39 = *(void **)(v38 + 32);
    *(_QWORD *)(v38 + 32) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 64));
    goto LABEL_29;
  }
  -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)v5);
  bls_scenes_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v60 = *(void **)(a1 + 56);
    objc_msgSend(v60, "identifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *(_QWORD *)(a1 + 32);
    v63 = *(_QWORD *)(a1 + 40);
    v64 = *(_QWORD *)(a1 + 48);
    v65 = objc_msgSend(*(id *)(a1 + 56), "clientHasDelegate");
    *(_DWORD *)buf = 134219266;
    v97 = v60;
    v98 = 2114;
    v99 = v61;
    v100 = 2114;
    v101 = v62;
    v102 = 2048;
    v103 = v64;
    v104 = 2114;
    v105 = v63;
    v106 = 1024;
    v107 = v65;
    _os_log_debug_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ updateToVisualState:%{public}@ inactive scene:%p to presentationDate:%{public}@ clientHasDelegate:%{BOOL}u", buf, 0x3Au);

  }
  v8 = 0;
LABEL_38:

  return v8;
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!*(_BYTE *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "bls_shortLoggingString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned __int8 *)(a1 + 88);
      v13 = *(unsigned __int8 *)(a1 + 89);
      v14 = *(_QWORD *)(a1 + 72);
      v15 = 134220290;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v4;
      v21 = 2114;
      v22 = v3;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      v29 = 1024;
      v30 = v12;
      v31 = 1024;
      v32 = v13;
      v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_2145AC000, v6, OS_LOG_TYPE_ERROR, "%p:%{public}@ client update action failed error:%{public}@ response:%{public}@, will not update scene:%{public}@ to visualState:%{public}@ presentationDate:%{public}@, animated:%{BOOL}u touchTarget:%{BOOL}u event:%{public}@", (uint8_t *)&v15, 0x5Eu);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_63_cold_1(a1, (unsigned __int8 *)(a1 + 88), v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BYTE v27[18];
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  bls_scenes_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = *(_QWORD *)(a1 + 40);
    v20 = 134219010;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v3;
    v26 = 1024;
    *(_DWORD *)v27 = isKindOfClass & 1;
    *(_WORD *)&v27[4] = 2114;
    *(_QWORD *)&v27[6] = v8;
    _os_log_impl(&dword_2145AC000, v4, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ client ramp action response:%{public}@ isKindBLSBacklightSceneUpdateBacklightRampResponse:%{BOOL}u for update to visualState:%{public}@", (uint8_t *)&v20, 0x30u);

  }
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    bls_scenes_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(unsigned __int8 *)(a1 + 72);
      v19 = *(_QWORD *)(a1 + 56);
      v20 = 134219778;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      *(_QWORD *)v27 = v3;
      *(_WORD *)&v27[8] = 2114;
      *(_QWORD *)&v27[10] = v16;
      v28 = 2114;
      v29 = v17;
      v30 = 1024;
      v31 = v18;
      v32 = 2114;
      v33 = v19;
      _os_log_error_impl(&dword_2145AC000, v10, OS_LOG_TYPE_ERROR, "%p:%{public}@ client ramp action failed error:%{public}@ response:%{public}@, for update to visualState:%{public}@ presentationDate:%{public}@, animated:%{BOOL}u event:%{public}@", (uint8_t *)&v20, 0x4Eu);

    }
    if (*(_BYTE *)(a1 + 72))
      v11 = 0.5;
    else
      v11 = 0.0;
  }
  else
  {
    objc_msgSend(v3, "rampDuration");
    v11 = v12;
    bls_scenes_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_67_cold_1(a1);

  }
  (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(v11);

}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "bls_shortLoggingString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(unsigned __int8 *)(a1 + 80);
      v12 = *(_QWORD *)(a1 + 64);
      v13 = 134219778;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v3;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      v25 = 1024;
      v26 = v11;
      v27 = 2114;
      v28 = v12;
      _os_log_error_impl(&dword_2145AC000, v6, OS_LOG_TYPE_ERROR, "%p:%{public}@ client animation action failed error:%{public}@ response:%{public}@, for update to visualState:%{public}@ presentationDate:%{public}@, animated:%{BOOL}u event:%{public}@", (uint8_t *)&v13, 0x4Eu);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_71_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, id, void *);
  id WeakRetained;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  void (**v34)(id, id, void *);
  BOOL v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  BLSHBacklightFBSceneHostEnvironment *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, id, void *))a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  v14 = WeakRetained;
  if (!WeakRetained)
  {
    bls_scenes_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bls_shortLoggingString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bls_shortLoggingString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v39 = self;
      v40 = 2114;
      v41 = v16;
      v42 = 2114;
      v43 = v17;
      v44 = 2114;
      v45 = v18;
      v46 = 1024;
      v47 = v7;
      _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_INFO, "%p:%{public}@ nil scene, will return only now date for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x30u);

    }
    v19 = objc_alloc(MEMORY[0x24BE0B818]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithDate:fidelity:", v20, 0);
    v37 = v21;
    v22 = (void *)MEMORY[0x24BDBCE30];
    v23 = &v37;
    goto LABEL_10;
  }
  if ((objc_msgSend(WeakRetained, "isActive") & 1) == 0)
  {
    bls_scenes_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bls_shortLoggingString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bls_shortLoggingString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v39 = self;
      v40 = 2114;
      v41 = v25;
      v42 = 2114;
      v43 = v26;
      v44 = 2114;
      v45 = v27;
      v46 = 1024;
      v47 = v7;
      _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_INFO, "%p:%{public}@ inactive scene, will return only now date for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x30u);

    }
    -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)self);
    v28 = objc_alloc(MEMORY[0x24BE0B818]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v28, "initWithDate:fidelity:", v20, 0);
    v36 = v21;
    v22 = (void *)MEMORY[0x24BDBCE30];
    v23 = &v36;
LABEL_10:
    objc_msgSend(v22, "arrayWithObjects:count:", v23, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v10, v29);

    goto LABEL_11;
  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke;
  v30[3] = &unk_24D1BD978;
  v30[4] = self;
  v31 = v14;
  v32 = v10;
  v33 = v11;
  v35 = v7;
  v34 = v12;
  objc_msgSend(v31, "updateSettingsWithTransitionBlock:", v30);

LABEL_11:
}

id __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BLSHAggregatedProcessAssertion *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  int v36;
  int v37;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t *v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__6;
  v50 = __Block_byref_object_dispose__6;
  v51 = 0;
  if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](*(void **)(a1 + 32), *(void **)(a1 + 40), v3))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("requestPresentationDatesForDateInterval:%@ forScene:%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "definition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[BLSHAggregatedProcessAssertion initWithExplanation:processIdentity:duration:]([BLSHAggregatedProcessAssertion alloc], "initWithExplanation:processIdentity:duration:", v7, v10, 1.25);
      v12 = (void *)v47[5];
      v47[5] = (uint64_t)v11;

      objc_msgSend((id)v47[5], "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(_QWORD *)(a1 + 32)));
      objc_msgSend((id)v47[5], "acquireWithCompletion:", 0);
    }
    else
    {
      bls_scenes_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v53 = v14;
        v54 = 2114;
        v55 = v15;
        v56 = 2048;
        v57 = v16;
        _os_log_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU grant process assertion", buf, 0x20u);

      }
    }

  }
  v17 = objc_alloc(MEMORY[0x24BE0B900]);
  v18 = *(void **)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(unsigned __int8 *)(a1 + 72);
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_77;
  v39[3] = &unk_24D1BD950;
  v44 = &v46;
  v21 = v18;
  v22 = *(_QWORD *)(a1 + 32);
  v40 = v21;
  v41 = v22;
  v42 = *(id *)(a1 + 56);
  v45 = *(_BYTE *)(a1 + 72);
  v43 = *(id *)(a1 + 64);
  v23 = (void *)objc_msgSend(v17, "initWithDateInterval:previousPresentationDate:shouldReset:completion:", v21, v19, v20, v39);
  objc_msgSend(*(id *)(a1 + 40), "definition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "specification");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (objc_class *)objc_msgSend(v25, "transitionContextClass");

  v27 = objc_alloc_init(v26);
  v28 = (void *)MEMORY[0x24BDBCF20];
  v66[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActions:", v30);

  if (__disableFrontBoardRBAssertions)
    objc_msgSend(v27, "setRunningBoardAssertionDisabled:", 1);
  bls_scenes_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = *(void **)(a1 + 32);
    objc_msgSend(v32, "identifier");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "bls_shortLoggingString");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = *(unsigned __int8 *)(a1 + 72);
    v37 = objc_msgSend(*(id *)(a1 + 32), "clientHasDelegate");
    *(_DWORD *)buf = 134219522;
    v53 = v32;
    v54 = 2114;
    v55 = v33;
    v56 = 2114;
    v57 = v34;
    v58 = 2114;
    v59 = v35;
    v60 = 1024;
    v61 = v36;
    v62 = 1024;
    v63 = v37;
    v64 = 2114;
    v65 = v23;
    _os_log_impl(&dword_2145AC000, v31, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ request presentation dates for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u clientHasDelegate:%{BOOL}u created action:%{public}@", buf, 0x40u);

  }
  _Block_object_dispose(&v46, 8);

  return v27;
}

void __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  os_unfair_lock_s *v8;
  unsigned int v9;
  unsigned int v10;
  double v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  os_log_type_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _BYTE v46[34];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "invalidate");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(id *)(a1 + 32);
  v8 = *(os_unfair_lock_s **)(a1 + 40);
  if (v6)
  {
    v9 = -[BLSHBacklightFBSceneHostEnvironment incrementRequestDateSpecifierFailureCount](v8);
    v10 = v9;
    if (*(_QWORD *)(a1 + 40))
    {
      v11 = 10.0;
      if (v9 >= 2)
      {
        if (v9 >= 5)
          v11 = 900.0;
        else
          v11 = 60.0;
      }
    }
    else
    {
      v11 = 0.0;
    }
    bls_scenes_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v32 = *(void **)(a1 + 40);
      objc_msgSend(v32, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "formatDuration:", v11);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(unsigned __int8 *)(a1 + 72);
      *(_DWORD *)buf = 134220034;
      v42 = v32;
      v43 = 2114;
      v44 = v38;
      v45 = 1024;
      *(_DWORD *)v46 = v10;
      *(_WORD *)&v46[4] = 2114;
      *(_QWORD *)&v46[6] = v33;
      *(_WORD *)&v46[14] = 2114;
      *(_QWORD *)&v46[16] = v6;
      *(_WORD *)&v46[24] = 2114;
      *(_QWORD *)&v46[26] = v3;
      v47 = 2114;
      v48 = v34;
      v49 = 2114;
      v50 = v35;
      v51 = 1024;
      v52 = v36;
      _os_log_fault_impl(&dword_2145AC000, v12, OS_LOG_TYPE_FAULT, "%p:%{public}@ date specifier request failed (%d times). May retry after %{public}@ : error:%{public}@ response:%{public}@, for interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x54u);

    }
    v13 = objc_alloc(MEMORY[0x24BE0B818]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithDate:fidelity:", v14, 0);
    v40 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "laterDate:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v18, "initWithStartDate:endDate:", v19, v21);

    v7 = (id)v22;
  }
  else
  {
    -[BLSHBacklightFBSceneHostEnvironment resetRequestDateSpecifierFailureCount](v8);
    objc_msgSend(v3, "dateSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v16, "count");
    if (v23 < 0xB)
    {
      v26 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v24 = (double)v23;
      objc_msgSend(v7, "duration");
      if (v24 / v25 <= 4.0)
        v26 = OS_LOG_TYPE_INFO;
      else
        v26 = OS_LOG_TYPE_FAULT;
    }
    bls_scenes_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, v26))
    {
      v27 = *(void **)(a1 + 40);
      objc_msgSend(v27, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bls_boundedDescriptionWithMax:transformer:", 12, &__block_literal_global_82);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(unsigned __int8 *)(a1 + 72);
      *(_DWORD *)buf = 134219266;
      v42 = v27;
      v43 = 2114;
      v44 = v37;
      v45 = 2114;
      *(_QWORD *)v46 = v28;
      *(_WORD *)&v46[8] = 2114;
      *(_QWORD *)&v46[10] = v29;
      *(_WORD *)&v46[18] = 2114;
      *(_QWORD *)&v46[20] = v30;
      *(_WORD *)&v46[28] = 1024;
      *(_DWORD *)&v46[30] = v31;
      _os_log_impl(&dword_2145AC000, v17, v26, "%p:%{public}@ client dates:%{public}@ animation interval:%{public}@ previous:%{public}@ reset:%{BOOL}u", buf, 0x3Au);

      v6 = 0;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

id __124__BLSHBacklightFBSceneHostEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_80(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fidelity");

  NSStringFromBLSUpdateFidelity();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, fidelity:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  unint64_t lock_renderSeed;
  id v20;
  void (**v21)(_QWORD);
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  BLSHBacklightFBSceneHostEnvironment *v29;
  id v30;
  unint64_t v31;
  uint8_t buf[4];
  BLSHBacklightFBSceneHostEnvironment *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bls_visualState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!WeakRetained)
  {
    bls_scenes_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v33 = self;
      v34 = 2114;
      v35 = v17;
      v36 = 2114;
      v37 = 0;
      v38 = 2114;
      v39 = v6;
      v18 = "%p:%{public}@ nil scene, will not update scene:%{public}@ to dateSpecifier:%{public}@";
      goto LABEL_8;
    }
LABEL_9:

    v7[2](v7);
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bls_presentationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToDate:", v13))
  {
    v14 = objc_msgSend(v10, "updateFidelity");
    v15 = objc_msgSend(v6, "fidelity");

    if (v14 == v15)
    {
      bls_scenes_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v33 = self;
        v34 = 2114;
        v35 = v17;
        v36 = 2114;
        v37 = WeakRetained;
        v38 = 2114;
        v39 = v6;
        v18 = "%p:%{public}@ scene:%{public}@ already at dateSpecifier:%{public}@";
LABEL_8:
        _os_log_impl(&dword_2145AC000, v16, OS_LOG_TYPE_INFO, v18, buf, 0x2Au);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  os_unfair_lock_lock(&self->_lock);
  lock_renderSeed = self->_lock_renderSeed;
  os_unfair_lock_unlock(&self->_lock);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke;
  v25 = &unk_24D1BD9C8;
  v26 = v6;
  v27 = v10;
  v31 = lock_renderSeed;
  v20 = WeakRetained;
  v28 = v20;
  v29 = self;
  v21 = v7;
  v30 = v21;
  objc_msgSend(v20, "updateSettingsWithTransitionBlock:", &v22);
  if ((objc_msgSend(v20, "isActive", v22, v23, v24, v25) & 1) == 0)
    v21[2](v21);

LABEL_14:
}

id __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BLSHAggregatedProcessAssertion *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int8x16_t v41;
  NSObject *v42;
  _QWORD v43[4];
  NSObject *v44;
  int8x16_t v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "bls_setDelegateActive:", 1);
  objc_msgSend(*(id *)(a1 + 32), "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bls_setPresentationDate:", v4);

  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "newVisualStateWithUpdateFidelity:", objc_msgSend(*(id *)(a1 + 32), "fidelity"));
  objc_msgSend(v3, "bls_setVisualState:", v5);
  objc_msgSend(v3, "bls_setRenderSeed:", *(_QWORD *)(a1 + 72));
  v6 = objc_msgSend(*(id *)(a1 + 48), "isActive");
  v7 = *(void **)(a1 + 56);
  if ((v6 & 1) != 0)
  {
    if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](v7, *(void **)(a1 + 48), v3))
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("updateTo:%@ forScene:%@"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "definition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clientIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "processIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = -[BLSHAggregatedProcessAssertion initWithExplanation:processIdentity:duration:]([BLSHAggregatedProcessAssertion alloc], "initWithExplanation:processIdentity:duration:", v11, v14, 1.25);
        -[BLSHAggregatedProcessAssertion setShouldFaultOnFailureToAcquire:](v15, "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld](*(_QWORD *)(a1 + 56)));
        -[BLSHAggregatedProcessAssertion acquireWithCompletion:](v15, "acquireWithCompletion:", 0);
      }
      else
      {
        bls_scenes_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(void **)(a1 + 56);
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 134218498;
          v49 = v24;
          v50 = 2114;
          v51 = v25;
          v52 = 2048;
          v53 = v26;
          _os_log_impl(&dword_2145AC000, v23, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU/GPU grant process assertion", buf, 0x20u);

        }
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
    v27 = objc_alloc(MEMORY[0x24BE0B878]);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_88;
    v43[3] = &unk_24D1BD9A0;
    v16 = v15;
    v44 = v16;
    v41 = *(int8x16_t *)(a1 + 48);
    v28 = (id)v41.i64[0];
    v45 = vextq_s8(v41, v41, 8uLL);
    v46 = *(id *)(a1 + 32);
    v47 = *(id *)(a1 + 64);
    v29 = (void *)objc_msgSend(v27, "initWithBacklightChangeEvent:animated:touchTargetable:isUpdateToDateSpecifier:completion:", 0, 0, 0, 1, v43);
    objc_msgSend(*(id *)(a1 + 48), "definition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "specification");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_msgSend(v31, "transitionContextClass");

    v22 = objc_alloc_init(v32);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActions:", v33);

    if (__disableFrontBoardRBAssertions)
      objc_msgSend(v22, "setRunningBoardAssertionDisabled:", 1);
    bls_scenes_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = *(void **)(a1 + 56);
      objc_msgSend(v35, "identifier");
      v42 = v16;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 48);
      v39 = objc_msgSend(*(id *)(a1 + 56), "clientHasDelegate");
      *(_DWORD *)buf = 134219266;
      v49 = v35;
      v50 = 2114;
      v51 = v36;
      v52 = 2048;
      v53 = v38;
      v54 = 2114;
      v55 = v37;
      v56 = 1024;
      v57 = v39;
      v58 = 2114;
      v59 = v29;
      _os_log_impl(&dword_2145AC000, v34, OS_LOG_TYPE_INFO, "%p:%{public}@ request to update scene:%p to dateSpecifier:%{public}@ clientHasDelegate:%{BOOL}u action:%{public}@", buf, 0x3Au);

      v16 = v42;
    }

  }
  else
  {
    -[BLSHBacklightFBSceneHostEnvironment setShouldInvalidateWhenActivated]((uint64_t)v7);
    bls_scenes_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 56);
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = objc_msgSend(*(id *)(a1 + 56), "clientHasDelegate");
      *(_DWORD *)buf = 134219010;
      v49 = v17;
      v50 = 2114;
      v51 = v18;
      v52 = 2048;
      v53 = v20;
      v54 = 2114;
      v55 = v19;
      v56 = 1024;
      v57 = v21;
      _os_log_impl(&dword_2145AC000, v16, OS_LOG_TYPE_INFO, "%p:%{public}@ request to update inactive scene:%p to dateSpecifier:%{public}@ clientHasDelegate:%{BOOL}u", buf, 0x30u);

    }
    v22 = 0;
  }

  return v22;
}

void __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  bls_scenes_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = 134219266;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v4;
      v17 = 2114;
      v18 = v3;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      _os_log_error_impl(&dword_2145AC000, v6, OS_LOG_TYPE_ERROR, "%p:%{public}@ client update action failed error:%{public}@ response:%{public}@ will not update scene:%{public}@ to dateSpecifier:%{public}@", (uint8_t *)&v11, 0x3Eu);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_88_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)clearPresentationDate
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v1, v2, "%p:%{public}@ scene:%{public}@ already at presentationDate nil", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_14();
}

void __60__BLSHBacklightFBSceneHostEnvironment_clearPresentationDate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  bls_scenes_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __60__BLSHBacklightFBSceneHostEnvironment_clearPresentationDate__block_invoke_cold_1();

  objc_msgSend(v2, "bls_setPresentationDate:", 0);
}

- (void)willBeginRenderSession:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  BLSHAggregatedProcessAssertion *v12;
  void *v13;
  void *v14;
  void *v15;
  BLSHAggregatedProcessAssertion *v16;
  BLSHAggregatedProcessAssertion *lock_renderSessionAssertion;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  BLSHBacklightFBSceneHostEnvironment *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](self, WeakRetained, v7);

  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(WeakRetained, "definition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (self->_lock_renderSessionAssertion)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_renderSessionAssertion == nil"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[BLSHBacklightFBSceneHostEnvironment willBeginRenderSession:].cold.1(a2, (uint64_t)self, (uint64_t)v20);
        objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x2145F2024);
      }
      v12 = [BLSHAggregatedProcessAssertion alloc];
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("RenderSession:%p forScene:%@"), v5, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BLSHAggregatedProcessAssertion initWithExplanation:processIdentity:duration:](v12, "initWithExplanation:processIdentity:duration:", v15, v11, 1.79769313e308);
      lock_renderSessionAssertion = self->_lock_renderSessionAssertion;
      self->_lock_renderSessionAssertion = v16;

      -[BLSHAggregatedProcessAssertion setShouldFaultOnFailureToAcquire:](self->_lock_secondsFidelityAssertion, "setShouldFaultOnFailureToAcquire:", -[BLSHBacklightFBSceneHostEnvironment isAtLeastOneMinuteOld]((_BOOL8)self));
      -[BLSHAggregatedProcessAssertion acquireWithCompletion:](self->_lock_renderSessionAssertion, "acquireWithCompletion:", 0);
    }
    else
    {
      bls_scenes_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v22 = self;
        v23 = 2114;
        v24 = v19;
        v25 = 2048;
        v26 = WeakRetained;
        _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ couldn't get a client processIdentity for scene %p. cannot take CPU/GPU grant process assertion for render session", buf, 0x20u);

      }
    }
    os_unfair_lock_unlock(&self->_lock);

  }
}

- (void)willEndRenderSession:(id)a3
{
  os_unfair_lock_s *p_lock;
  BLSHAggregatedProcessAssertion *lock_renderSessionAssertion;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BLSHAggregatedProcessAssertion *v15;
  _BOOL4 v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  BLSHBacklightFBSceneHostEnvironment *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_renderSessionAssertion = self->_lock_renderSessionAssertion;
  if (!lock_renderSessionAssertion)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
    objc_msgSend(WeakRetained, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](self, WeakRetained, v7))
    {
      objc_msgSend(WeakRetained, "clientSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "bls_optsOutOfProcessAssertions");

      v10 = objc_msgSend(v7, "activityMode");
      objc_msgSend(WeakRetained, "definition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isLocal");

      bls_scenes_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v16 = v10 == 7;
        if (v10 == 7)
          v17 = 1;
        else
          v17 = v9;
        v18 = (v17 | v13) ^ 1;
        -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134219778;
        v21 = self;
        v22 = 2114;
        v23 = v19;
        v24 = 2048;
        v25 = WeakRetained;
        v26 = 2048;
        v27 = v7;
        v28 = 1024;
        v29 = v18;
        v30 = 1024;
        v31 = v9;
        v32 = 1024;
        v33 = v16;
        v34 = 1024;
        v35 = v13;
        _os_log_fault_impl(&dword_2145AC000, v14, OS_LOG_TYPE_FAULT, "%p:%{public}@ renderSessionAssertion=nil but scene:%p settings:%p wantsProcessAssertions:%{BOOL}u optsOut:%{BOOL}u externalManaged:%{BOOL}u local:%{BOOL}u", (uint8_t *)&v20, 0x42u);

      }
    }

    lock_renderSessionAssertion = self->_lock_renderSessionAssertion;
  }
  -[BLSHAggregatedProcessAssertion invalidate](lock_renderSessionAssertion, "invalidate");
  v15 = self->_lock_renderSessionAssertion;
  self->_lock_renderSessionAssertion = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)wantsStateUpdateToActiveAfterRemovalFromPresentation
{
  id WeakRetained;
  void *v4;
  char v5;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(WeakRetained, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLSHBacklightFBSceneHostEnvironment sceneWantsProcessAssertion:withSceneSettings:](self, WeakRetained, v4);

  bls_scenes_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightFBSceneHostEnvironment wantsStateUpdateToActiveAfterRemovalFromPresentation].cold.1(self);

  return v5 ^ 1;
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  bls_scenes_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bls_shortLoggingString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bls_shortLoggingString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "FBSceneHostEnv.updateToVisualState: (direct) sending scene settings from host to scene:%{public}@ state:%{public}@ presentationDate:%{public}@", buf, 0x20u);

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier___block_invoke;
  v16[3] = &unk_24D1BD9F0;
  v17 = v6;
  v18 = v9;
  v11 = v9;
  v12 = v6;
  objc_msgSend(WeakRetained, "updateSettingsWithBlock:", v16);

}

void __85__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bls_setVisualState:", v3);
  objc_msgSend(v4, "bls_setPresentationDate:", *(_QWORD *)(a1 + 40));

}

- (os_unfair_lock_s)clientSettingsDiffInspector
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  void *v3;
  BLSHBacklightSceneClientSettingsDiffInspector *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 16;
    os_unfair_lock_lock(a1 + 16);
    v3 = *(void **)&v1[4]._os_unfair_lock_opaque;
    if (!v3)
    {
      v4 = objc_alloc_init(BLSHBacklightSceneClientSettingsDiffInspector);
      v5 = *(void **)&v1[4]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[4]._os_unfair_lock_opaque = v4;

      v3 = *(void **)&v1[4]._os_unfair_lock_opaque;
    }
    v1 = v3;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v7 = a4;
  -[BLSHBacklightFBSceneHostEnvironment clientSettingsDiffInspector]((os_unfair_lock_s *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "inspectDiff:", v7);

  v10 = MEMORY[0x24BDAC760];
  if ((v9 & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v12[3] = &unk_24D1BDA18;
    v12[4] = self;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v12);
  }
  if ((v9 & 2) != 0)
  {
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
    v11[3] = &unk_24D1BDA18;
    v11[4] = self;
    -[BLSHBacklightFBSceneHostEnvironment notifyObserversWithBlock:]((uint64_t)self, v11);
  }
}

void __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:clientDidUpdateEnabled:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "clientHasDelegate"));

}

void __113__BLSHBacklightFBSceneHostEnvironment_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hostEnvironment:clientDidUpdateSupportsAlwaysOn:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "clientSupportsAlwaysOn"));

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  int v8;
  BLSHBacklightFBSceneHostEnvironment *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);

  if (WeakRetained == v4)
  {
    bls_scenes_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = self;
      v10 = 2114;
      v11 = v7;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ scene:%p did invalidate", (uint8_t *)&v8, 0x20u);

    }
    objc_storeWeak((id *)&self->_fbScene, 0);
  }

}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  id WeakRetained;
  _BOOL4 ShouldInvalidateWhen;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  BLSHBacklightFBSceneHostEnvironment *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_fbScene);

  if (WeakRetained == v4)
  {
    ShouldInvalidateWhen = -[BLSHBacklightFBSceneHostEnvironment readAndClearShouldInvalidateWhenActivated]((uint64_t)self);
    bls_scenes_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (ShouldInvalidateWhen)
      v9 = OS_LOG_TYPE_INFO;
    else
      v9 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v7, v9))
    {
      -[BLSHBacklightFBSceneHostEnvironment identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = self;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = v4;
      _os_log_impl(&dword_2145AC000, v8, v9, "%p:%{public}@ scene:%p did activate", (uint8_t *)&v11, 0x20u);

    }
    if (ShouldInvalidateWhen)
      -[BLSHBacklightFBSceneHostEnvironment invalidateContentForReason:](self, "invalidateContentForReason:", CFSTR("wasInPresentationWhileInactive"));
  }

}

+ (void)setAmendSceneSettingsDelegate:(id)a3
{
  os_unfair_lock_lock(&_classLock_3);
  _amendSceneSettingsDelegate = (uint64_t)a3;
  os_unfair_lock_unlock(&_classLock_3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_budgetProcessIdentity, 0);
  objc_storeStrong((id *)&self->_lock_renderSessionAssertion, 0);
  objc_storeStrong((id *)&self->_lock_secondsFidelityAssertion, 0);
  objc_storeStrong((id *)&self->_nilSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_diffInspector, 0);
  objc_destroyWeak((id *)&self->_fbScene);
}

- (void)initWithFBScene:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  os_log_t v6;
  os_log_type_t v7;
  const char *v8;
  uint8_t *v9;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_2();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x2Au);

}

- (void)requestedFidelityForInactiveContentWithCompletion:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_2145AC000, v2, v3, "%p:%{public}@ nil scene, requestedFidelityForInactiveContent:Minutes", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)requestedFidelityForInactiveContentWithCompletion:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_2145AC000, v2, v3, "%p:%{public}@ inactive scene, requestedFidelityForInactiveContent:Minutes", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_2145AC000, v2, v3, "%p:%{public}@ querying requestedFidelityForInactiveContent", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __89__BLSHBacklightFBSceneHostEnvironment_requestedFidelityForInactiveContentWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSUpdateFidelity();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v3, v4, "%p:%{public}@ requestedFidelityForInactiveContent:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_14();
}

- (void)sceneWantsProcessAssertion:withSceneSettings:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v2, v3, "%p:%{public}@ scene:%p wantsProcessAssertions:NO", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

- (void)updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v6 = (void *)MEMORY[0x2199D2BD8]();
  OUTLINED_FUNCTION_9_0(&dword_2145AC000, v0, v1, "animated=%{BOOL}u but animationCompleteBlock=%{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v6 = (void *)MEMORY[0x2199D2BD8]();
  OUTLINED_FUNCTION_9_0(&dword_2145AC000, v0, v1, "animated=%{BOOL}u but performBacklightRampBlock=%{public}@", v2, v3, v4, v5, 2u);

}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_63_cold_1(uint64_t a1, unsigned __int8 *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "bls_shortLoggingString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *a2;
  v12 = *(unsigned __int8 *)(a1 + 89);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = 134219778;
  v15 = v6;
  v16 = 2114;
  v17 = v7;
  v18 = 2114;
  v19 = v8;
  v20 = 2114;
  v21 = v9;
  v22 = 2114;
  v23 = v10;
  v24 = 1024;
  v25 = v11;
  v26 = 1024;
  v27 = v12;
  v28 = 2114;
  v29 = v13;
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ client did update scene:%{public}@ to visualState:%{public}@ presentationDate:%{public}@ animated:%{BOOL}u touchTarget:%{BOOL}u event:%{public}@", (uint8_t *)&v14, 0x4Au);

}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_67_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_2();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x44u);

}

void __183__BLSHBacklightFBSceneHostEnvironment_updateToVisualState_presentationDateSpecifier_animated_triggerEvent_touchTargetable_sceneContentsUpdated_performBacklightRamp_animationComplete___block_invoke_71_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(*(id *)(v1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 56), "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_2();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x3Au);

}

void __82__BLSHBacklightFBSceneHostEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke_88_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(*(id *)(v0 + 40), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v2, v3, "%p:%{public}@ client did update to dateSpecifier:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

void __60__BLSHBacklightFBSceneHostEnvironment_clearPresentationDate__block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_0();
  objc_msgSend(*(id *)(v0 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v2, v3, "%p:%{public}@ update to presentationDate nil for scene:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_14();
}

- (void)willBeginRenderSession:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHBacklightFBSceneHostEnvironment.m");
  v16 = 1024;
  v17 = 744;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)wantsStateUpdateToActiveAfterRemovalFromPresentation
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);

  OUTLINED_FUNCTION_2_1();
}

@end
