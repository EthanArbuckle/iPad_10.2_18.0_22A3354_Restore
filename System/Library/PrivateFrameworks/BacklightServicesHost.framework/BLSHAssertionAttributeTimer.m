@implementation BLSHAssertionAttributeTimer

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  __objc2_class **v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = off_24D1BB0F8;
  }
  else if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = off_24D1BB1D0;
  }
  else
  {
    if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("invalid class (not BLSDurationAttribute subclass) of attribute:%@"), v8);
      v12 = 0;
      goto LABEL_8;
    }
    v11 = off_24D1BB1B8;
  }
  v12 = (void *)objc_msgSend(objc_alloc(*v11), "initForAttribute:fromAssertion:forService:", v8, v9, v10);
  -[BLSHAssertionAttributeTimer startTimer]((uint64_t)v12);
LABEL_8:

  return v12;
}

- (void)startTimer
{
  id WeakRetained;
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "duration");
    if (v3 > 0.0)
    {
      v4 = v3;
      objc_initWeak(&location, (id)a1);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "osInterfaceProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __41__BLSHAssertionAttributeTimer_startTimer__block_invoke;
      v10[3] = &unk_24D1BD148;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v6, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", v7, v10, v4, v4 * 0.1);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v8;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

  }
}

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHAssertionAttributeTimer *v11;
  id *p_isa;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSHAssertionAttributeTimer;
  v11 = -[BLSHAssertionAttributeTimer init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_attribute, v8);
    objc_storeWeak(p_isa + 4, v9);
    objc_storeWeak(p_isa + 5, v10);
  }

  return p_isa;
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
  v15 = CFSTR("BLSHDurationAttributeHandler.m");
  v16 = 1024;
  v17 = 102;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (BOOL)reactivateIfPossible
{
  return 0;
}

void __41__BLSHAssertionAttributeTimer_startTimer__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_msgSend(a2, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timerFired");

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHAssertionAttributeTimer _with_lock_cancel]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (void)_with_lock_cancel
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "invalidate");
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  -[BLSHAssertionAttributeTimer _with_lock_cancel]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
}

- (BLSAssertionServiceResponding)assertion
{
  return (BLSAssertionServiceResponding *)objc_loadWeakRetained((id *)&self->_assertion);
}

- (BLSHAssertionAttributeHandlerService)service
{
  return (BLSHAssertionAttributeHandlerService *)objc_loadWeakRetained((id *)&self->_service);
}

- (BLSDurationAttribute)attribute
{
  return (BLSDurationAttribute *)objc_loadWeakRetained((id *)&self->_attribute);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attribute);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
