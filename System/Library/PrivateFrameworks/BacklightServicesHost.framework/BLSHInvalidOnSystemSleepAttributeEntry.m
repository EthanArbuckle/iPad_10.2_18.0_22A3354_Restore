@implementation BLSHInvalidOnSystemSleepAttributeEntry

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[BLSHInvalidOnSystemSleepAttributeEntry initForAttribute:fromAssertion:forService:]([BLSHInvalidOnSystemSleepAttributeEntry alloc], "initForAttribute:fromAssertion:forService:", v10, v9, v8);

  return v11;
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHInvalidOnSystemSleepAttributeEntry *v11;
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
  v19.super_class = (Class)BLSHInvalidOnSystemSleepAttributeEntry;
  v11 = -[BLSHInvalidOnSystemSleepAttributeEntry init](&v19, sel_init);
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
      block[2] = __84__BLSHInvalidOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke;
      block[3] = &unk_24D1BC268;
      v18 = p_isa;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

  return p_isa;
}

void __84__BLSHInvalidOnSystemSleepAttributeEntry_initForAttribute_fromAssertion_forService___block_invoke(uint64_t a1)
{
  -[BLSHInvalidOnSystemSleepAttributeEntry cancelAssertionForSleep](*(_QWORD *)(a1 + 32));
}

- (void)cancelAssertionForSleep
{
  os_unfair_lock_s *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(unsigned __int8 *)(a1 + 12);
    os_unfair_lock_unlock(v2);
    if (!v3)
    {
      objc_msgSend((id)a1, "service");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "assertion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = *MEMORY[0x24BE0B778];
      v10 = *MEMORY[0x24BDD0FC8];
      v11[0] = CFSTR("canceled due to system sleep");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 13, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cancelAssertion:withError:", v5, v9);

      objc_msgSend((id)a1, "invalidate");
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
  -[BLSHInvalidOnSystemSleepAttributeEntry cancelAssertionForSleep]((uint64_t)self);
  v5 = (id)v6[2](v6, 1, 0);

}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  void (**v5)(void);

  v5 = (void (**)(void))a4;
  -[BLSHInvalidOnSystemSleepAttributeEntry cancelAssertionForSleep]((uint64_t)self);
  v5[2]();

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

- (void)initForAttribute:(uint64_t)a1 fromAssertion:(NSObject *)a2 forService:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NSStringFromBLSAssertingObject();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218242;
  v6 = a1;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "%p attempted to acquire assertion when sleep is imminent, will immediately cancel assertion:%{public}@", (uint8_t *)&v5, 0x16u);

}

@end
