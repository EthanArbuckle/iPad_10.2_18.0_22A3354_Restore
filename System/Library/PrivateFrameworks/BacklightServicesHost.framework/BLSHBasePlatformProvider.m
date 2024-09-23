@implementation BLSHBasePlatformProvider

- (BLSHBasePlatformProvider)init
{
  BLSHBasePlatformProvider *v2;
  BLSHBasePlatformProvider *v3;
  BLSHFlipbookSpecification *v4;
  BLSHFlipbookSpecification *lock_flipbookSpecification;
  uint64_t v6;
  NSHashTable *lock_observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLSHBasePlatformProvider;
  v2 = -[BLSHBasePlatformProvider init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    *(int64x2_t *)&v2->_lock_backlightFadeInDuration = vdupq_n_s64(0x3FB999999999999AuLL);
    v2->_lock_backlightDimmingDuration = 0.1;
    v2->_lock_backlightDimmedFactor = 0.05;
    v4 = -[BLSHFlipbookSpecification initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:]([BLSHFlipbookSpecification alloc], "initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:", 104857600, 100, 30.0, 3.0, 0.0028, 90.0, 300.0);
    lock_flipbookSpecification = v3->_lock_flipbookSpecification;
    v3->_lock_flipbookSpecification = v4;

    v3->_lock_alwaysOnSettingEnabled = 1;
    objc_storeStrong((id *)&v3->_lock_sessionProvider, v3);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v6;

  }
  return v3;
}

- (void)platformDidDetectSignificantUserInteraction
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71__BLSHBasePlatformProvider_platformDidDetectSignificantUserInteraction__block_invoke;
  v2[3] = &unk_24D1BC2A8;
  v2[4] = self;
  -[BLSHBasePlatformProvider notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v2);
}

uint64_t __71__BLSHBasePlatformProvider_platformDidDetectSignificantUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "platformProviderDidDetectSignificantUserInteraction:", *(_QWORD *)(a1 + 32));
}

- (void)serviceInitializing:(id)a3
{
  BLSHService *v4;
  BLSHService *lock_service;

  v4 = (BLSHService *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_service = self->_lock_service;
  self->_lock_service = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (double)backlightFadeInDuration
{
  os_unfair_lock_s *p_lock;
  double lock_backlightFadeInDuration;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backlightFadeInDuration = self->_lock_backlightFadeInDuration;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightFadeInDuration;
}

- (void)setBacklightFadeInDuration:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_backlightFadeInDuration = a3;
  os_unfair_lock_unlock(p_lock);
}

- (double)backlightFadeOutDuration
{
  os_unfair_lock_s *p_lock;
  double lock_backlightFadeOutDuration;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backlightFadeOutDuration = self->_lock_backlightFadeOutDuration;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightFadeOutDuration;
}

- (void)setBacklightFadeOutDuration:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_backlightFadeOutDuration = a3;
  os_unfair_lock_unlock(p_lock);
}

- (double)backlightDimmingDuration
{
  os_unfair_lock_s *p_lock;
  double lock_backlightDimmingDuration;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backlightDimmingDuration = self->_lock_backlightDimmingDuration;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightDimmingDuration;
}

- (void)setBacklightDimmingDuration:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_backlightDimmingDuration = a3;
  os_unfair_lock_unlock(p_lock);
}

- (float)backlightDimmedFactor
{
  os_unfair_lock_s *p_lock;
  float lock_backlightDimmedFactor;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backlightDimmedFactor = self->_lock_backlightDimmedFactor;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightDimmedFactor;
}

- (void)setBacklightDimmedFactor:(float)a3
{
  os_unfair_lock_s *p_lock;
  float lock_backlightDimmedFactor;
  BLSHService *lock_service;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  BLSHBasePlatformProvider *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backlightDimmedFactor = self->_lock_backlightDimmedFactor;
  self->_lock_backlightDimmedFactor = a3;
  lock_service = self->_lock_service;
  os_unfair_lock_unlock(p_lock);
  if (lock_backlightDimmedFactor != a3 && lock_service != 0)
  {
    objc_msgSend(MEMORY[0x24BE0B848], "sharedBacklight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "backlightState");

    if (v10 == 3)
    {
      bls_backlight_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 134218496;
        v13 = self;
        v14 = 2048;
        v15 = lock_backlightDimmedFactor;
        v16 = 2048;
        v17 = a3;
        _os_log_error_impl(&dword_2145AC000, v11, OS_LOG_TYPE_ERROR, "%p changed dimmed factor (%.2lf->%.2lf) while currently dimmed - change will not be reflected until next update", (uint8_t *)&v12, 0x20u);
      }

    }
  }
}

- (BOOL)isAlwaysOnEnabled
{
  BLSHBasePlatformProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BLSHBasePlatformProvider _lock_isAlwaysOnEnabled](v2, "_lock_isAlwaysOnEnabled");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_lock_isAlwaysOnEnabled
{
  BOOL result;

  result = -[BLSHService deviceSupportsAlwaysOn](self->_lock_service, "deviceSupportsAlwaysOn");
  if (!self->_lock_alwaysOnSettingEnabled)
    return 0;
  return result;
}

- (BOOL)isAlwaysOnSettingEnabled
{
  BLSHBasePlatformProvider *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnSettingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnSettingEnabled:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 v6;
  int lock_alwaysOnSettingEnabled;
  _QWORD v9[5];
  char v10;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[BLSHService deviceSupportsAlwaysOn](self->_lock_service, "deviceSupportsAlwaysOn");
  lock_alwaysOnSettingEnabled = self->_lock_alwaysOnSettingEnabled;
  self->_lock_alwaysOnSettingEnabled = v3;
  os_unfair_lock_unlock(p_lock);
  if (v6 && lock_alwaysOnSettingEnabled != v3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__BLSHBasePlatformProvider_setAlwaysOnSettingEnabled___block_invoke;
    v9[3] = &unk_24D1BC2D0;
    v9[4] = self;
    v10 = v3;
    -[BLSHBasePlatformProvider notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v9);
  }
}

uint64_t __54__BLSHBasePlatformProvider_setAlwaysOnSettingEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "platformProvider:didChangeAlwaysOnSetting:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BLSHFlipbookSpecification)flipbookSpecification
{
  os_unfair_lock_s *p_lock;
  BLSHFlipbookSpecification *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_flipbookSpecification;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFlipbookSpecification:(id)a3
{
  BLSHFlipbookSpecification *v5;
  BLSHFlipbookSpecification *lock_flipbookSpecification;
  void *v7;

  v5 = (BLSHFlipbookSpecification *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_service)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot mutate flipbookSpecification after service initialization : %@"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBasePlatformProvider setFlipbookSpecification:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    lock_flipbookSpecification = self->_lock_flipbookSpecification;
    self->_lock_flipbookSpecification = v5;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BLSHBacklightEnvironmentSessionProviding)sessionProvider
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightEnvironmentSessionProviding *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_sessionProvider;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSessionProvider:(id)a3
{
  BLSHBacklightEnvironmentSessionProviding *v5;
  BLSHBacklightEnvironmentSessionProviding *lock_sessionProvider;
  void *v7;

  v5 = (BLSHBacklightEnvironmentSessionProviding *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_service)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot mutate sessionProvider after service initialization : %@"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBasePlatformProvider setSessionProvider:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    lock_sessionProvider = self->_lock_sessionProvider;
    self->_lock_sessionProvider = v5;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)isShowingBlankingWindow
{
  return 0;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL8 v5;
  id v6;

  p_lock = &self->_lock;
  v6 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v6);
  v5 = -[BLSHBasePlatformProvider _lock_isAlwaysOnEnabled](self, "_lock_isAlwaysOnEnabled");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "platformProvider:didChangeAlwaysOnSetting:", self, v5);

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

- (id)createInactiveEnvironmentSession
{
  BLSHBacklightEnvironmentPresentation *v2;
  BLSHBacklightEnvironmentPresentation *v3;
  void *v4;

  v2 = [BLSHBacklightEnvironmentPresentation alloc];
  v3 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:](v2, "initWithPresentationEntries:flipbookContext:expirationDate:", MEMORY[0x24BDBD1A8], 0, 0);
  +[BLSHBacklightInactiveEnvironmentSession sessionWithPresentation:](BLSHBacklightInactiveEnvironmentSession, "sessionWithPresentation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)suppressionSupported
{
  return self->_suppressionSupported;
}

- (void)setSuppressionSupported:(BOOL)a3
{
  self->_suppressionSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_flipbookSpecification, 0);
  objc_storeStrong((id *)&self->_lock_service, 0);
  objc_storeStrong((id *)&self->_lock_sessionProvider, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)setFlipbookSpecification:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setSessionProvider:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
