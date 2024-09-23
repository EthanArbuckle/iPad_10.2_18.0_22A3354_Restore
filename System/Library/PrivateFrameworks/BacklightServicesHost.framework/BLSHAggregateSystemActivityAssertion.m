@implementation BLSHAggregateSystemActivityAssertion

- (BLSHAggregateSystemActivityAssertion)initWithConfigurator:(id)a3
{
  id v4;
  BLSHAggregateSystemActivityAssertion *v5;
  BLSHAggregateSystemActivityAssertion *v6;
  uint64_t v7;
  NSHashTable *lock_individualAssertions;
  BLSHAggregateSystemActivityAssertion *result;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHAggregateSystemActivityAssertion;
  v5 = -[BLSHAggregateSystemActivityAssertion init](&v11, sel_init);
  v6 = v5;
  if (v5
    && (v5->_lock._os_unfair_lock_opaque = 0,
        v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 4),
        lock_individualAssertions = v6->_lock_individualAssertions,
        v6->_lock_individualAssertions = (NSHashTable *)v7,
        lock_individualAssertions,
        -[BLSHAggregateSystemActivityAssertion performConfigurator:](v6, "performConfigurator:", v4),
        !v6->_osInterfaceProvider))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_osInterfaceProvider != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAggregateSystemActivityAssertion initWithConfigurator:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (BLSHAggregateSystemActivityAssertion *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    return v6;
  }
  return result;
}

- (void)performConfigurator:(id)a3
{
  self->_initializing = 1;
  (*((void (**)(id, BLSHAggregateSystemActivityAssertion *))a3 + 2))(a3, self);
  self->_initializing = 0;
}

- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_initializing)
  {
    self->_acquireWaitsToAbortSleepRequested = a3;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ called after initialization"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAggregateSystemActivityAssertion setAcquireWaitsToAbortSleepRequested:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setOSInterfaceProvider:(id)a3
{
  BLSHOSInterfaceProviding *v5;
  BLSHOSInterfaceProviding *osInterfaceProvider;
  void *v7;
  void *v8;
  void *v9;

  v5 = (BLSHOSInterfaceProviding *)a3;
  if (self->_initializing)
  {
    osInterfaceProvider = self->_osInterfaceProvider;
    self->_osInterfaceProvider = v5;

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ called after initialization"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAggregateSystemActivityAssertion setOSInterfaceProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (BOOL)isActive
{
  BLSHAggregateSystemActivityAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BLSHSystemActivityAsserting isActive](v2->_lock_systemActivityAssertion, "isActive");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_lock_addSystemActivityAcquisitionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id lock_acquisitionHandler;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x2199D2BD8](self->_lock_acquisitionHandler);
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__BLSHAggregateSystemActivityAssertion__lock_addSystemActivityAcquisitionHandler___block_invoke;
    v11[3] = &unk_24D1BDBE8;
    v12 = v5;
    v13 = v4;
    v7 = (void *)MEMORY[0x2199D2BD8](v11);
    lock_acquisitionHandler = self->_lock_acquisitionHandler;
    self->_lock_acquisitionHandler = v7;

    v9 = v12;
  }
  else
  {
    v10 = (void *)MEMORY[0x2199D2BD8](v4);
    v9 = self->_lock_acquisitionHandler;
    self->_lock_acquisitionHandler = v10;
  }

}

void __82__BLSHAggregateSystemActivityAssertion__lock_addSystemActivityAcquisitionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, id, id);
  id v9;
  id v10;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void (**)(uint64_t, uint64_t, id, id))(v7 + 16);
  v9 = a4;
  v10 = a3;
  v8(v7, a2, v10, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)didAcquireSystemActivityIsActive:(BOOL)a3 error:(id)a4 details:(id)a5
{
  _BOOL8 v6;
  SWSystemActivityAcquisitionDetails *v8;
  os_unfair_lock_s *p_lock;
  id v10;
  id lock_acquisitionHandler;
  SWSystemActivityAcquisitionDetails *lock_systemActivityAcquisitionDetails;
  SWSystemActivityAcquisitionDetails *v13;
  void (**v14)(id, _BOOL8, id, id);

  v6 = a3;
  v8 = (SWSystemActivityAcquisitionDetails *)a5;
  p_lock = &self->_lock;
  v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  v14 = (void (**)(id, _BOOL8, id, id))MEMORY[0x2199D2BD8](self->_lock_acquisitionHandler);
  lock_acquisitionHandler = self->_lock_acquisitionHandler;
  self->_lock_acquisitionHandler = 0;

  lock_systemActivityAcquisitionDetails = self->_lock_systemActivityAcquisitionDetails;
  self->_lock_systemActivityAcquisitionDetails = v8;
  v13 = v8;

  os_unfair_lock_unlock(p_lock);
  v14[2](v14, v6, v10, v13);

}

- (void)acquireIndividualAssertion:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  SWSystemActivityAcquisitionDetails *v9;
  SWSystemActivityAcquisitionDetails *v10;
  BLSHSystemActivityAsserting *lock_systemActivityAssertion;
  BLSHOSInterfaceProviding *osInterfaceProvider;
  void *v13;
  uint64_t v14;
  BLSHSystemActivityAsserting *v15;
  BLSHSystemActivityAsserting *v16;
  BLSHSystemActivityAsserting *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[5];
  _QWORD block[4];
  SWSystemActivityAcquisitionDetails *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_lock_individualAssertions, "addObject:", v6);
  if (-[BLSHSystemActivityAsserting isActive](self->_lock_systemActivityAssertion, "isActive"))
  {
    v9 = self->_lock_systemActivityAcquisitionDetails;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke;
    block[3] = &unk_24D1BDC10;
    v23 = v9;
    v24 = v7;
    v10 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    lock_systemActivityAssertion = self->_lock_systemActivityAssertion;
    -[BLSHAggregateSystemActivityAssertion _lock_addSystemActivityAcquisitionHandler:](self, "_lock_addSystemActivityAcquisitionHandler:", v7);
    if (!lock_systemActivityAssertion)
    {
      osInterfaceProvider = self->_osInterfaceProvider;
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_2;
      v21[3] = &unk_24D1BDC38;
      v21[4] = self;
      -[BLSHOSInterfaceProviding createSystemActivityAssertionWithIdentifier:configurator:](osInterfaceProvider, "createSystemActivityAssertionWithIdentifier:configurator:", v13, v21);
      v15 = (BLSHSystemActivityAsserting *)objc_claimAutoreleasedReturnValue();
      v16 = self->_lock_systemActivityAssertion;
      self->_lock_systemActivityAssertion = v15;

      objc_initWeak(&location, self);
      v17 = self->_lock_systemActivityAssertion;
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_3;
      v18[3] = &unk_24D1BDC88;
      objc_copyWeak(&v19, &location);
      -[BLSHSystemActivityAsserting acquireWithTimeout:handler:](v17, "acquireWithTimeout:handler:", v18, 0.0);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(p_lock);

}

uint64_t __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 53));
}

void __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_4;
  v11[3] = &unk_24D1BDC60;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  v15 = a2;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

  objc_destroyWeak(&v14);
}

void __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "didAcquireSystemActivityIsActive:error:details:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)invalidateIndividualAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BLSHSystemActivityAsserting *lock_systemActivityAssertion;
  BLSHSystemActivityAsserting *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_individualAssertions, "removeObject:", v5);

  if (!-[NSHashTable count](self->_lock_individualAssertions, "count"))
  {
    lock_systemActivityAssertion = self->_lock_systemActivityAssertion;
    if (lock_systemActivityAssertion)
    {
      -[BLSHSystemActivityAsserting invalidate](lock_systemActivityAssertion, "invalidate");
      v7 = self->_lock_systemActivityAssertion;
      self->_lock_systemActivityAssertion = 0;

    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_acquisitionHandler, 0);
  objc_storeStrong((id *)&self->_lock_individualAssertions, 0);
  objc_storeStrong((id *)&self->_lock_systemActivityAcquisitionDetails, 0);
  objc_storeStrong((id *)&self->_lock_systemActivityAssertion, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

- (void)initWithConfigurator:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setAcquireWaitsToAbortSleepRequested:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)setOSInterfaceProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
