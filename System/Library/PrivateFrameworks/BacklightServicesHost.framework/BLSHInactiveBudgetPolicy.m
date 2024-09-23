@implementation BLSHInactiveBudgetPolicy

- (BLSHInactiveBudgetPolicy)initWithOSInterfaceProvider:(id)a3
{
  id v4;
  id v5;
  BLSHInactiveBudgetPolicy *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__BLSHInactiveBudgetPolicy_initWithOSInterfaceProvider___block_invoke;
  v8[3] = &unk_24D1BCD48;
  v9 = v4;
  v5 = v4;
  v6 = -[BLSHInactiveBudgetPolicy initWithBudgetFactory:](self, "initWithBudgetFactory:", v8);

  return v6;
}

BLSHInactiveProcessBudget *__56__BLSHInactiveBudgetPolicy_initWithOSInterfaceProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BLSHInactiveProcessBudget *v4;
  void *v5;
  BLSHInactiveProcessBudget *v6;

  v3 = a2;
  v4 = [BLSHInactiveProcessBudget alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BLSHInactiveProcessBudget initWithIdentifier:osInterfaceProvider:](v4, "initWithIdentifier:osInterfaceProvider:", v5, *(_QWORD *)(a1 + 32));
  return v6;
}

- (BLSHInactiveBudgetPolicy)initWithBudgetFactory:(id)a3
{
  id v4;
  BLSHInactiveBudgetPolicy *v5;
  uint64_t v6;
  NSMutableDictionary *budgets;
  uint64_t v8;
  id budgetFactory;
  BLSHNullInactiveProcessBudget *v10;
  BLSHNullInactiveProcessBudget *nullBudget;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHInactiveBudgetPolicy;
  v5 = -[BLSHInactiveBudgetPolicy init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    budgets = v5->_budgets;
    v5->_budgets = (NSMutableDictionary *)v6;

    v8 = MEMORY[0x2199D2BD8](v4);
    budgetFactory = v5->_budgetFactory;
    v5->_budgetFactory = (id)v8;

    v10 = objc_alloc_init(BLSHNullInactiveProcessBudget);
    nullBudget = v5->_nullBudget;
    v5->_nullBudget = v10;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_budgets, CFSTR("budgets"), 1);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)allowedFidelityAtDate:(id)a3 forEnvironment:(id)a4 expectedFidelity:(int64_t)a5
{
  id v8;
  void *v9;
  int64_t v10;

  v8 = a3;
  -[BLSHInactiveBudgetPolicy budgetForEnvironment:]((uint64_t)self, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowedFidelityAtDate:expectedFidelity:", v8, a5);

  return v10;
}

- (id)budgetForEnvironment:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "budgetProcessIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v6, v5);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
    else
    {
      v6 = *(id *)(a1 + 24);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 forEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = BLSDefaultFidelityForBacklightState(1, v8);
  -[BLSHInactiveBudgetPolicy budgetForEnvironment:]((uint64_t)self, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:", v10, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)resetFutureSpecifiers
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_budgets, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __49__BLSHInactiveBudgetPolicy_resetFutureSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "resetFutureSpecifiers");
}

- (void)chargeRenderedSpecifier:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__BLSHInactiveBudgetPolicy_chargeRenderedSpecifier___block_invoke;
  v3[3] = &unk_24D1BCD90;
  v3[4] = self;
  objc_msgSend(a3, "enumerateDateSpecifiersUsingBlock:", v3);
}

void __52__BLSHInactiveBudgetPolicy_chargeRenderedSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v7 = BLSDefaultFidelityForBacklightState(1, v5);
  -[BLSHInactiveBudgetPolicy budgetForEnvironment:](*(_QWORD *)(a1 + 32), v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "chargeRenderedSpecifier:expectedFidelity:", v6, v7);
}

- (void)invalidateAtRequestDate:(id)a3 forEnvironment:(id)a4 invalidationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = BLSDefaultFidelityForBacklightState(1, v9);
  -[BLSHInactiveBudgetPolicy budgetForEnvironment:]((uint64_t)self, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "invalidateAtRequestDate:expectedFidelity:invalidationBlock:", v10, v11, v8);
}

- (void)performInvalidation
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_budgets, "copy");
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __47__BLSHInactiveBudgetPolicy_performInvalidation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "performInvalidation");
}

- (void)resetBudgetForProcess:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  BLSHInactiveBudgetPolicy *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    bls_budget_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 134218498;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_INFO, "%p will reset budget for process:%{public}@ reason:%{public}@", (uint8_t *)&v9, 0x20u);
    }

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary removeObjectForKey:](self->_budgets, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)purgeStaleDataForNowDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BLSHInactiveBudgetPolicy *v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary copy](self->_budgets, "copy");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__BLSHInactiveBudgetPolicy_purgeStaleDataForNowDate___block_invoke;
  v7[3] = &unk_24D1BCDD8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  os_unfair_lock_unlock(&self->_lock);
}

void __53__BLSHInactiveBudgetPolicy_purgeStaleDataForNowDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "stillTrackingAfterPurgingStaleDataForNowDate:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nullBudget, 0);
  objc_storeStrong(&self->_budgetFactory, 0);
  objc_storeStrong((id *)&self->_budgets, 0);
}

@end
