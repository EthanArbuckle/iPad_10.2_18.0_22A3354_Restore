@implementation BLSHPauseOnSystemSleepAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[BLSHPauseOnSystemSleepAttributeEntry initForAttribute:fromAssertion:forService:]([BLSHPauseOnSystemSleepAttributeEntry alloc], "initForAttribute:fromAssertion:forService:", v10, v9, v8);

  return v11;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHPauseOnSystemSleepAttributeEntry *v11;
  id *p_isa;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BLSHPauseOnSystemSleepAttributeEntry;
  v11 = -[BLSHPauseOnSystemSleepAttributeEntry init](&v19, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_attribute, v8);
    objc_storeWeak(p_isa + 3, v9);
    objc_storeWeak(p_isa + 4, v10);
    objc_msgSend(v10, "osInterfaceProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemSleepMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObserver:", p_isa);
    if (objc_msgSend(v14, "hasSleepBeenRequested"))
    {
      bls_assertions_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[BLSHInvalidOnSystemSleepAttributeEntry initForAttribute:fromAssertion:forService:].cold.1((uint64_t)v9, v15);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__BLSHPauseOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke;
      block[3] = &unk_24D1BC268;
      v18 = p_isa;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

  return p_isa;
}

void __82__BLSHPauseOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke(uint64_t a1)
{
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:](*(_QWORD *)(a1 + 32), 1);
}

- (void)setPaused:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(_BYTE *)(a1 + 12) || *(unsigned __int8 *)(a1 + 13) == a2)
    {
      os_unfair_lock_unlock(v4);
    }
    else
    {
      *(_BYTE *)(a1 + 13) = a2;
      os_unfair_lock_unlock(v4);
      objc_msgSend((id)a1, "service");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "assertion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        objc_msgSend(v6, "pauseAssertion:", v5);
      else
        objc_msgSend(v6, "resumeAssertion:", v5);

    }
  }
}

- (BOOL)reactivateIfPossible
{
  return 0;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_invalidated;
  void *v5;
  void *v6;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_invalidated = self->_lock_invalidated;
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  if (!lock_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_msgSend(WeakRetained, "osInterfaceProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemSleepMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

  }
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  id v5;
  uint64_t (**v6)(id, uint64_t, _QWORD);

  v6 = (uint64_t (**)(id, uint64_t, _QWORD))a4;
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:]((uint64_t)self, 1);
  v5 = (id)v6[2](v6, 1, 0);

}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  void (**v5)(void);

  v5 = (void (**)(void))a4;
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:]((uint64_t)self, 1);
  v5[2]();

}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:]((uint64_t)self, 0);
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  -[BLSHPauseOnSystemSleepAttributeEntry setPaused:]((uint64_t)self, 0);
}

- (BLSAttribute)attribute
{
  return (BLSAttribute *)objc_loadWeakRetained((id *)&self->_attribute);
}

- (BLSAssertionServiceResponding)assertion
{
  return (BLSAssertionServiceResponding *)objc_loadWeakRetained((id *)&self->_assertion);
}

- (BLSHAssertionAttributeHandlerService)service
{
  return (BLSHAssertionAttributeHandlerService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);
  objc_destroyWeak((id *)&self->_attribute);
}

@end
