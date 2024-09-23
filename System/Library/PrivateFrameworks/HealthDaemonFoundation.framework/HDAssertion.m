@implementation HDAssertion

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[HDAssertion rawState](self, "rawState") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAssertion.m"), 53, CFSTR("Assertion %@ must be invalidated prior to deallocation"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)HDAssertion;
  -[HDAssertion dealloc](&v5, sel_dealloc);
}

- (int64_t)rawState
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionIdentifier, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (id)cloneWithOwnerIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDAssertion _lock_cloneWithOwnerIdentifier:](self, "_lock_cloneWithOwnerIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_cloneWithOwnerIdentifier:(id)a3
{
  id v4;
  HDAssertion *v5;
  double v6;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[HDAssertion _lock_state](self, "_lock_state") == 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[HDAssertion initWithAssertionIdentifier:ownerIdentifier:]([HDAssertion alloc], "initWithAssertionIdentifier:ownerIdentifier:", self->_assertionIdentifier, v4);
    if (self->_budget > 0.0)
    {
      -[HDAssertion _lock_remainingBudget](self, "_lock_remainingBudget");
      v5->_budget = v6;
      v5->_remainingBudget = v6;
    }
  }

  return v5;
}

- (void)_invalidateAndRelease:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id WeakRetained;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  HKLogAssertions();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    HKLogAssertions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[HDAssertion _invalidateAndRelease:].cold.1(self, v8);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  if (self->_state == 3)
  {
    self->_remainingBudget = 0.0;
    self->_budgetIntervalStartTime = 0.0;
    objc_storeWeak((id *)&self->_manager, 0);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_remainingBudget = 0.0;
    self->_budgetIntervalStartTime = 0.0;
    self->_state = 3;
    objc_storeWeak((id *)&self->_manager, 0);
    os_unfair_lock_unlock(p_lock);
    if (v3 && WeakRetained)
      objc_msgSend(WeakRetained, "_releaseAssertion:", self);
  }

}

- (NSString)assertionIdentifier
{
  return self->_assertionIdentifier;
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[HDAssertion _lock_state](self, "_lock_state");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)_lock_state
{
  double v3;

  os_unfair_lock_assert_owner(&self->_lock);
  -[HDAssertion _lock_remainingBudget](self, "_lock_remainingBudget");
  if (v3 <= 0.0 && self->_state == 2)
    return 3;
  else
    return self->_state;
}

- (double)_lock_remainingBudget
{
  double remainingBudget;
  double v4;
  double result;

  os_unfair_lock_assert_owner(&self->_lock);
  remainingBudget = self->_remainingBudget;
  if (self->_budgetIntervalStartTime != 0.0)
  {
    HKMachAbsoluteTimeGetCurrent();
    remainingBudget = remainingBudget - (v4 - self->_budgetIntervalStartTime);
  }
  result = 0.0;
  if (remainingBudget >= 0.0)
    return remainingBudget;
  return result;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (int64_t)_takeWithManager:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int64_t state;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 1)
  {
    self->_state = 2;
    objc_storeWeak((id *)&self->_manager, v4);
    _HKInitializeLogging();
    HKLogAssertions();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

    if (v7)
    {
      HKLogAssertions();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[HDAssertion _takeWithManager:].cold.1(self, (uint64_t)v4, v8);

    }
  }
  state = self->_state;
  os_unfair_lock_unlock(p_lock);

  return state;
}

- (HDAssertion)initWithAssertionIdentifier:(id)a3 ownerIdentifier:(id)a4
{
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAssertion.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertionIdentifier.length > 0"));

  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAssertion.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ownerIdentifier.length > 0"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HDAssertion;
  v9 = -[HDAssertion init](&v19, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v9 + 6);
    *((_QWORD *)v9 + 6) = v10;

    v12 = objc_msgSend(v7, "copy");
    v13 = (void *)*((_QWORD *)v9 + 7);
    *((_QWORD *)v9 + 7) = v12;

    v14 = objc_msgSend(v8, "copy");
    v15 = (void *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v14;

    *((_QWORD *)v9 + 2) = 1;
    *((_QWORD *)v9 + 9) = 0;
    *(_OWORD *)(v9 + 24) = xmmword_210FD5510;
    *((_DWORD *)v9 + 10) = 0;
  }

  return (HDAssertion *)v9;
}

- (void)invalidate
{
  -[HDAssertion _invalidateAndRelease:](self, "_invalidateAndRelease:", 1);
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDAssertion _lock_description](self, "_lock_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBudget:(double)a3
{
  os_unfair_lock_s *p_lock;
  BOOL v6;
  id v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = 0;
  v6 = -[HDAssertion _lock_setBudget:error:](self, "_lock_setBudget:error:", &v8, a3);
  v7 = v8;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unable to set assertion budget: %@"), v7);

}

- (double)remainingBudget
{
  os_unfair_lock_s *p_lock;
  double v4;
  double remainingBudget;
  double v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_budgetIntervalStartTime == 0.0)
  {
    remainingBudget = self->_remainingBudget;
  }
  else
  {
    HKMachAbsoluteTimeGetCurrent();
    remainingBudget = v4 - self->_budgetIntervalStartTime;
  }
  if (remainingBudget >= 0.0)
    v6 = remainingBudget;
  else
    v6 = 0.0;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_setBudgetIntervalStartTime:(double)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDAssertion _lock_setBudgetIntervalStartTime:](self, "_lock_setBudgetIntervalStartTime:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v6 = (void *)v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unable to set budget consumption interval start: %@"), v7);
    v6 = (void *)v7;
  }

}

- (BOOL)_consumeFromBudgetThroughTime:(double)a3
{
  os_unfair_lock_s *p_lock;
  int64_t v6;
  id v7;
  id v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = 0;
  v6 = -[HDAssertion _lock_consumeBudgetThroughTime:error:](self, "_lock_consumeBudgetThroughTime:error:", &v9, a3);
  v7 = v9;
  os_unfair_lock_unlock(p_lock);
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unable to end budget consumption interval: %@"), v7);

  return v6 == 1;
}

- (id)_lock_description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *assertionIdentifier;
  int64_t state;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  double budget;
  __CFString *v12;
  void *v13;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  assertionIdentifier = self->_assertionIdentifier;
  state = self->_state;
  v8 = CFSTR("ready");
  if (state == 2)
    v8 = CFSTR("active");
  if (state == 3)
    v9 = CFSTR("invalidated");
  else
    v9 = (__CFString *)v8;
  v10 = v9;
  budget = self->_budget;
  if (budget <= 0.0)
  {
    v12 = &stru_24CB19CC0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (%.3fs/%.3fs)"), *(_QWORD *)&self->_remainingBudget, *(_QWORD *)&budget);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@ %@%@: %@>"), v4, v5, assertionIdentifier, v10, v12, self->_ownerIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (budget > 0.0)

  return v13;
}

- (BOOL)_lock_setBudget:(double)a3 error:(id *)a4
{
  int64_t state;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;

  os_unfair_lock_assert_owner(&self->_lock);
  state = self->_state;
  if (state == 1)
  {
    if (a3 > 0.0)
    {
      self->_budget = a3;
      self->_remainingBudget = a3;
      return 1;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Cannot give assertion a non-postive budget of %f"), *(_QWORD *)&a3, v11);
  }
  else
  {
    v9 = CFSTR("active");
    if (state != 2)
      v9 = CFSTR("ready");
    if (state == 3)
      v10 = CFSTR("invalidated");
    else
      v10 = v9;
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Assertion state '%@', but expected '%@'"), v10, CFSTR("ready"));
  }
  return 0;
}

- (id)_lock_setBudgetIntervalStartTime:(double)a3
{
  void *v6;
  uint64_t v8;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_state == 2 && self->_budget > 0.0)
  {
    if (self->_budgetIntervalStartTime != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Budget interval already started with time (%f) cannot set to (%f)"), *(_QWORD *)&self->_budgetIntervalStartTime, *(_QWORD *)&a3);
LABEL_9:
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    if (a3 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Budget interval start (%f) must be positive"), *(_QWORD *)&a3, v8);
      goto LABEL_9;
    }
    v6 = 0;
    self->_budgetIntervalStartTime = a3;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)_lock_consumeBudgetThroughTime:(double)a3 error:(id *)a4
{
  double budgetIntervalStartTime;
  double v9;
  uint64_t v10;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_state != 2 || self->_budget <= 0.0)
    return 2;
  budgetIntervalStartTime = self->_budgetIntervalStartTime;
  if (budgetIntervalStartTime == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Cannot end budget time interval (%f) before starting it"), *(_QWORD *)&a3, v10);
    return 0;
  }
  if (budgetIntervalStartTime > a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Cannot end budget time interval (%f) before interval start (%f)"), *(_QWORD *)&a3, *(_QWORD *)&budgetIntervalStartTime);
    return 0;
  }
  self->_budgetIntervalStartTime = 0.0;
  v9 = self->_remainingBudget - (a3 - budgetIntervalStartTime);
  if (v9 < 0.0)
    v9 = 0.0;
  self->_remainingBudget = v9;
  if (v9 <= 0.0)
    return 1;
  else
    return 2;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (double)budget
{
  return self->_budget;
}

- (void)_takeWithManager:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_lock_description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_debug_impl(&dword_210F9A000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Taken at %{public}@.", (uint8_t *)&v6, 0x16u);

}

- (void)_invalidateAndRelease:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_lock_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_210F9A000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Invalidated.", (uint8_t *)&v4, 0xCu);

}

@end
