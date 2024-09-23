@implementation BLSHWaiterForBacklight

+ (id)waitForBacklightState:(int64_t)a3
{
  return -[BLSHWaiterForBacklightState initWithBacklightState:]([BLSHWaiterForBacklightState alloc], "initWithBacklightState:", a3);
}

+ (id)waitForBacklightStatePassingTest:(id)a3
{
  id v3;
  BLSHWaiterForBacklightState *v4;

  v3 = a3;
  v4 = -[BLSHWaiterForBacklightState initWithPredicate:]([BLSHWaiterForBacklightState alloc], "initWithPredicate:", v3);

  return v4;
}

+ (id)waitForBacklightDisplayMode:(int64_t)a3
{
  return -[BLSHWaiterForBacklightDisplayMode initWithDisplayMode:]([BLSHWaiterForBacklightDisplayMode alloc], "initWithDisplayMode:", a3);
}

+ (id)waitForBacklightDisplayModePassingTest:(id)a3
{
  id v3;
  BLSHWaiterForBacklightDisplayMode *v4;

  v3 = a3;
  v4 = -[BLSHWaiterForBacklightDisplayMode initWithPredicate:]([BLSHWaiterForBacklightDisplayMode alloc], "initWithPredicate:", v3);

  return v4;
}

+ (id)waitForBlanked
{
  return -[BLSHWaiterForBacklightDisplayMode initWithPredicate:]([BLSHWaiterForBacklightDisplayMode alloc], "initWithPredicate:", &__block_literal_global_11);
}

BOOL __40__BLSHWaiterForBacklight_waitForBlanked__block_invoke(uint64_t a1, uint64_t a2)
{
  return IsBlankedForBLSBacklightDisplayMode(a2);
}

+ (id)waitForUnblanked
{
  return -[BLSHWaiterForBacklightDisplayMode initWithPredicate:]([BLSHWaiterForBacklightDisplayMode alloc], "initWithPredicate:", &__block_literal_global_2);
}

BOOL __42__BLSHWaiterForBacklight_waitForUnblanked__block_invoke(uint64_t a1, uint64_t a2)
{
  return !IsBlankedForBLSBacklightDisplayMode(a2);
}

- (BLSHWaiterForBacklight)init
{
  BLSHWaiterForBacklight *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLSHWaiterForBacklight;
  result = -[BLSHWaiterForBacklight init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
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
  v15 = CFSTR("BLSHWaiterForBacklight.m");
  v16 = 1024;
  v17 = 79;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (BOOL)isAlreadyAtDesiredState
{
  return 1;
}

- (void)waitWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __45__BLSHWaiterForBacklight_waitWithCompletion___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isAlreadyAtDesiredState"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_main_waitWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_main_waitWithCompletion:(id)a3
{
  void *v4;
  id completion;
  id v6;

  v4 = (void *)MEMORY[0x2199D2BD8](a3, a2);
  completion = self->_completion;
  self->_completion = v4;

  +[BLSHBacklightHost sharedBacklightHost](BLSHBacklightHost, "sharedBacklightHost");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

}

- (void)callCompletion
{
  BSDispatchMain();
}

uint64_t __40__BLSHWaiterForBacklight_callCompletion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_callCompletion");
}

- (void)_main_callCompletion
{
  id completion;

  if (!-[BLSHWaiterForBacklight isInvalidated](self, "isInvalidated"))
  {
    (*((void (**)(void))self->_completion + 2))();
    -[BLSHWaiterForBacklight invalidate](self, "invalidate");
    completion = self->_completion;
    self->_completion = 0;

  }
}

- (BOOL)isInvalidated
{
  BLSHWaiterForBacklight *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  +[BLSHBacklightHost sharedBacklightHost](BLSHBacklightHost, "sharedBacklightHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
