@implementation MSPowerAssertionManager

- (void)retainBusy
{
  int v3;
  MSPowerAssertionManager *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ++self->_busyCount;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 138543874;
    v4 = self;
    v5 = 1024;
    v6 = -[MSPowerAssertionManager busyCount](self, "busyCount");
    v7 = 1024;
    v8 = -[MSPowerAssertionManager UIBusyCount](self, "UIBusyCount");
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retaining process busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  -[MSPowerAssertionManager _recomputePowerAssertion](self, "_recomputePowerAssertion");
}

- (void)releaseBusy
{
  int v3;
  MSPowerAssertionManager *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  --self->_busyCount;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 138543874;
    v4 = self;
    v5 = 1024;
    v6 = -[MSPowerAssertionManager busyCount](self, "busyCount");
    v7 = 1024;
    v8 = -[MSPowerAssertionManager UIBusyCount](self, "UIBusyCount");
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Releasing process busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  -[MSPowerAssertionManager _recomputePowerAssertion](self, "_recomputePowerAssertion");
}

- (void)retainUIBusy
{
  int v3;
  MSPowerAssertionManager *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ++self->_UIBusyCount;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 138543874;
    v4 = self;
    v5 = 1024;
    v6 = -[MSPowerAssertionManager busyCount](self, "busyCount");
    v7 = 1024;
    v8 = -[MSPowerAssertionManager UIBusyCount](self, "UIBusyCount");
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Retaining process UI busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  -[MSPowerAssertionManager _recomputePowerAssertion](self, "_recomputePowerAssertion");
}

- (void)releaseUIBusy
{
  int v3;
  MSPowerAssertionManager *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  --self->_UIBusyCount;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 138543874;
    v4 = self;
    v5 = 1024;
    v6 = -[MSPowerAssertionManager busyCount](self, "busyCount");
    v7 = 1024;
    v8 = -[MSPowerAssertionManager UIBusyCount](self, "UIBusyCount");
    _os_log_debug_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Releasing process UI busy. New busy: %d, UI busy: %d", (uint8_t *)&v3, 0x18u);
  }
  -[MSPowerAssertionManager _recomputePowerAssertion](self, "_recomputePowerAssertion");
}

- (void)_assertPowerAssertion
{
  IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("Photo Stream activity"), 0, 0, 0, 3600.0, CFSTR("TimeoutActionTurnOff"), &self->_assertionID);
}

- (void)_deassertPowerAssertion
{
  IOPMAssertionRelease(self->_assertionID);
}

- (void)_recomputePowerAssertion
{
  int v3;
  MSPowerAssertionManager *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (-[MSPowerAssertionManager busyCount](self, "busyCount") < 1
    || -[MSPowerAssertionManager UIBusyCount](self, "UIBusyCount"))
  {
    if (-[MSPowerAssertionManager isAssertingPowerAssertion](self, "isAssertingPowerAssertion"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v3 = 138543362;
        v4 = self;
        _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Releasing process power assertion.", (uint8_t *)&v3, 0xCu);
      }
      -[MSPowerAssertionManager setIsAssertingPowerAssertion:](self, "setIsAssertingPowerAssertion:", 0);
      -[MSPowerAssertionManager _deassertPowerAssertion](self, "_deassertPowerAssertion");
    }
  }
  else if (!-[MSPowerAssertionManager isAssertingPowerAssertion](self, "isAssertingPowerAssertion"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Retaining process power assertion.", (uint8_t *)&v3, 0xCu);
    }
    -[MSPowerAssertionManager setIsAssertingPowerAssertion:](self, "setIsAssertingPowerAssertion:", 1);
    -[MSPowerAssertionManager _assertPowerAssertion](self, "_assertPowerAssertion");
  }
}

- (void)setBusyCount:(int)a3
{
  self->_busyCount = a3;
  -[MSPowerAssertionManager _recomputePowerAssertion](self, "_recomputePowerAssertion");
}

- (void)setUIBusyCount:(int)a3
{
  self->_UIBusyCount = self->_busyCount;
  -[MSPowerAssertionManager _recomputePowerAssertion](self, "_recomputePowerAssertion", *(_QWORD *)&a3);
}

- (BOOL)isBusy
{
  return -[MSPowerAssertionManager busyCount](self, "busyCount") > 0;
}

- (void)toggleAssertion
{
  int v3;
  MSPowerAssertionManager *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (-[MSPowerAssertionManager isAssertingPowerAssertion](self, "isAssertingPowerAssertion"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v3 = 138543362;
      v4 = self;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@: Toggling process power assertion off then on.", (uint8_t *)&v3, 0xCu);
    }
    -[MSPowerAssertionManager _deassertPowerAssertion](self, "_deassertPowerAssertion");
    -[MSPowerAssertionManager _assertPowerAssertion](self, "_assertPowerAssertion");
  }
}

- (int)busyCount
{
  return self->_busyCount;
}

- (int)UIBusyCount
{
  return self->_UIBusyCount;
}

- (BOOL)isAssertingPowerAssertion
{
  return self->_isAssertingPowerAssertion;
}

- (void)setIsAssertingPowerAssertion:(BOOL)a3
{
  self->_isAssertingPowerAssertion = a3;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_mgr;
}

void __40__MSPowerAssertionManager_sharedManager__block_invoke()
{
  MSPowerAssertionManager *v0;
  void *v1;

  v0 = objc_alloc_init(MSPowerAssertionManager);
  v1 = (void *)sharedManager_mgr;
  sharedManager_mgr = (uint64_t)v0;

}

@end
