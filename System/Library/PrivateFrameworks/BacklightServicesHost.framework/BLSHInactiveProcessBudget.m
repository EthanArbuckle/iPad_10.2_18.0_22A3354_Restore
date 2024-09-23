@implementation BLSHInactiveProcessBudget

- (BLSHInactiveProcessBudget)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6;
  id v7;
  BLSHInactiveProcessBudget *v8;
  uint64_t v9;
  NSString *identifier;
  BLSHInactiveProcessSecondsBudget *v11;
  BLSHInactiveProcessSecondsBudget *secondsBudget;
  BLSHInactiveProcessMinutesBudget *v13;
  BLSHInactiveProcessMinutesBudget *minutesBudget;
  id v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BLSHInactiveProcessBudget;
  v8 = -[BLSHInactiveProcessBudget init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = -[BLSHInactiveProcessSecondsBudget initWithIdentifier:osInterfaceProvider:]([BLSHInactiveProcessSecondsBudget alloc], "initWithIdentifier:osInterfaceProvider:", v6, v7);
    secondsBudget = v8->_secondsBudget;
    v8->_secondsBudget = v11;

    v13 = -[BLSHInactiveProcessMinutesBudget initWithIdentifier:osInterfaceProvider:]([BLSHInactiveProcessMinutesBudget alloc], "initWithIdentifier:osInterfaceProvider:", v6, v7);
    minutesBudget = v8->_minutesBudget;
    v8->_minutesBudget = v13;

    objc_initWeak(&location, v8);
    v16 = v6;
    objc_copyWeak(&v17, &location);
    v8->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }

  return v8;
}

uint64_t __68__BLSHInactiveProcessBudget_initWithIdentifier_osInterfaceProvider___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BLSHInactiveProcessBudget : %@"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BLSStateDataWithTitleDescriptionAndHints();

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stateHandler)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)BLSHInactiveProcessBudget;
  -[BLSHInactiveProcessBudget dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHInactiveProcessBudget *v12;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __40__BLSHInactiveProcessBudget_description__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, &stru_24D1BE888, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

id __40__BLSHInactiveProcessBudget_description__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("minutesBudget"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("secondsBudget"));
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSHInactiveProcessBudget *v12;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __45__BLSHInactiveProcessBudget_debugDescription__block_invoke;
  v10 = &unk_24D1BBE80;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, &stru_24D1BE888, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __45__BLSHInactiveProcessBudget_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("minutesBudget"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "debugDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("secondsBudget"));

}

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  if (a4 == 1)
    return -[BLSHInactiveProcessMinutesBudget allowedFidelityAtDate:expectedFidelity:](self->_minutesBudget, "allowedFidelityAtDate:expectedFidelity:", a3);
  else
    return a4;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *secondsBudget;
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    if (a5 == 2)
    {
      secondsBudget = self->_secondsBudget;
      v14 = v8;
      v15 = v9;
      v16 = 2;
    }
    else
    {
      if (a5 == 3)
      {
        v10 = v8;
LABEL_11:
        v12 = v10;
        goto LABEL_12;
      }
      secondsBudget = self->_minutesBudget;
      v14 = v8;
      v15 = v9;
      v16 = a5;
    }
    objc_msgSend(secondsBudget, "validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:", v14, v15, v16);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  bls_budget_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[BLSHInactiveProcessBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:].cold.1((uint64_t)self, (uint64_t)v8, v11);

  v12 = 0;
LABEL_12:

  return v12;
}

- (void)resetFutureSpecifiers
{
  -[BLSHInactiveProcessSecondsBudget resetFutureSpecifiers](self->_secondsBudget, "resetFutureSpecifiers");
  -[BLSHInactiveProcessMinutesBudget resetFutureSpecifiers](self->_minutesBudget, "resetFutureSpecifiers");
}

- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = 24;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = 32;
LABEL_5:
    v8 = v6;
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "chargeRenderedSpecifier:expectedFidelity:", v6, a4);
    v6 = v8;
  }

}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  BLSHInactiveProcessSecondsBudget *secondsBudget;
  void *v12;
  BLSHInactiveProcessMinutesBudget *minutesBudget;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  void (**v17)(_QWORD);

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = v9;
  if (a4 == 1)
  {
    minutesBudget = self->_minutesBudget;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_2;
    v14[3] = &unk_24D1BC240;
    v15 = v9;
    -[BLSHInactiveProcessMinutesBudget invalidateAtRequestDate:expectedFidelity:invalidationBlock:](minutesBudget, "invalidateAtRequestDate:expectedFidelity:invalidationBlock:", v8, 1, v14);
    v12 = v15;
  }
  else
  {
    if (a4 != 2)
    {
      v9[2](v9);
      goto LABEL_7;
    }
    secondsBudget = self->_secondsBudget;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke;
    v16[3] = &unk_24D1BC240;
    v17 = v9;
    -[BLSHInactiveProcessSecondsBudget invalidateAtRequestDate:expectedFidelity:invalidationBlock:](secondsBudget, "invalidateAtRequestDate:expectedFidelity:invalidationBlock:", v8, 2, v16);
    v12 = v17;
  }

LABEL_7:
}

uint64_t __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__BLSHInactiveProcessBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performInvalidation
{
  -[BLSHInactiveProcessMinutesBudget performInvalidation](self->_minutesBudget, "performInvalidation");
  -[BLSHInactiveProcessSecondsBudget performInvalidation](self->_secondsBudget, "performInvalidation");
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[BLSHInactiveProcessSecondsBudget stillTrackingAfterPurgingStaleDataForNowDate:](self->_secondsBudget, "stillTrackingAfterPurgingStaleDataForNowDate:", v4)|| -[BLSHInactiveProcessMinutesBudget stillTrackingAfterPurgingStaleDataForNowDate:](self->_minutesBudget, "stillTrackingAfterPurgingStaleDataForNowDate:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutesBudget, 0);
  objc_storeStrong((id *)&self->_secondsBudget, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)validateAndChargeFutureSpecifier:(uint64_t)a1 nextSpecifier:(uint64_t)a2 expectedFidelity:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 134218498;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  _os_log_debug_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEBUG, "%p:%{public}@ expectedFidelity:BLSUpdateFidelityNever specifier:%{public}@ denied", (uint8_t *)&v4, 0x20u);
}

@end
