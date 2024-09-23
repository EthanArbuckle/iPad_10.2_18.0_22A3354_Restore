@implementation BLSHInactiveProcessSecondsBudget

- (BLSHInactiveProcessSecondsBudget)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6;
  id v7;
  BLSHInactiveProcessSecondsBudget *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHInactiveProcessSecondsBudget;
  v8 = -[BLSHInactiveProcessSecondsBudget init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_osInterfaceProvider, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[BSTimerScheduleQuerying invalidate](self->_lock_invalidationTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLSHInactiveProcessSecondsBudget;
  -[BLSHInactiveProcessSecondsBudget dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lock_previousSecondsFutureSpecifier, CFSTR("previousFuture"), 1);
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lock_exemptedSecondsFutureSpecifier, CFSTR("exemptedFuture"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lock_previousSecondsRenderedSpecifier, CFSTR("previousRendered"), 1);
  -[NSDate bls_loggingString](self->_lock_lastInvalidation, "bls_loggingString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v9, CFSTR("lastInvalidation"), 1);

  if (-[BSTimerScheduleQuerying isScheduled](self->_lock_invalidationTimer, "isScheduled"))
  {
    -[BSTimerScheduleQuerying timeRemaining](self->_lock_invalidationTimer, "timeRemaining");
    v11 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("pendingInvalidation"), 1);
  }
  objc_msgSend(v4, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v12;
}

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  id v5;
  int64_t result;
  void *v7;

  v5 = a3;
  if (a4 == 2)
  {

    return 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expectedFidelity == BLSUpdateFidelitySeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessSecondsBudget allowedFidelityAtDate:expectedFidelity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  os_unfair_lock_s *p_lock;
  BLSAlwaysOnDateSpecifier *lock_previousSecondsFutureSpecifier;
  BLSAlwaysOnDateSpecifier *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  BLSAlwaysOnDateSpecifier *v29;
  id v30;
  NSString *identifier;
  BLSAlwaysOnDateSpecifier *v33;
  BLSAlwaysOnDateSpecifier *lock_exemptedSecondsFutureSpecifier;
  void *v35;
  uint8_t buf[4];
  BLSHInactiveProcessSecondsBudget *v37;
  __int16 v38;
  NSString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  BLSAlwaysOnDateSpecifier *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  BLSAlwaysOnDateSpecifier *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (a5 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expectedFidelity == BLSUpdateFidelitySeconds"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessSecondsBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145D3D04);
  }
  v11 = v10;
  v12 = v9;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_previousSecondsFutureSpecifier = self->_lock_previousSecondsFutureSpecifier;
  if (lock_previousSecondsFutureSpecifier)
  {
    v15 = lock_previousSecondsFutureSpecifier;
  }
  else
  {
    v15 = self->_lock_previousSecondsRenderedSpecifier;
    if (!v15)
    {
LABEL_14:
      v28 = v12;
      goto LABEL_15;
    }
  }
  objc_msgSend(v12, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSAlwaysOnDateSpecifier date](v15, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  if (v18 >= 0.75)
  {

    goto LABEL_14;
  }
  objc_msgSend(v11, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v20);
  v22 = v21;

  if (v22 >= 0.75)
    goto LABEL_14;
  if (!self->_lock_exemptedSecondsFutureSpecifier)
    goto LABEL_14;
  objc_msgSend(v12, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSAlwaysOnDateSpecifier date](self->_lock_exemptedSecondsFutureSpecifier, "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceDate:", v24);
  v26 = v25;

  if (v26 < 1.0)
    goto LABEL_14;
  if (v26 >= 30.0)
  {
    objc_storeStrong((id *)&self->_lock_exemptedSecondsFutureSpecifier, a3);
    goto LABEL_14;
  }
  bls_budget_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    identifier = self->_identifier;
    v33 = self->_lock_previousSecondsFutureSpecifier;
    lock_exemptedSecondsFutureSpecifier = self->_lock_exemptedSecondsFutureSpecifier;
    *(_DWORD *)buf = 134219266;
    v37 = self;
    v38 = 2114;
    v39 = identifier;
    v40 = 2114;
    v41 = v12;
    v42 = 2114;
    v43 = v33;
    v44 = 2114;
    v45 = v11;
    v46 = 2114;
    v47 = lock_exemptedSecondsFutureSpecifier;
    _os_log_debug_impl(&dword_2145AC000, v27, OS_LOG_TYPE_DEBUG, "%p:%{public}@ expectedFidelity:BLSUpdateFidelitySeconds specifier:%{public}@ denied - previous:%{public}@ next:%{public}@ exempted:%{public}@", buf, 0x3Eu);
  }

  v28 = 0;
LABEL_15:
  v29 = self->_lock_previousSecondsFutureSpecifier;
  self->_lock_previousSecondsFutureSpecifier = (BLSAlwaysOnDateSpecifier *)v12;
  v30 = v12;

  os_unfair_lock_unlock(p_lock);
  return v28;
}

- (void)resetFutureSpecifiers
{
  os_unfair_lock_s *p_lock;
  BLSAlwaysOnDateSpecifier *lock_previousSecondsFutureSpecifier;
  BLSAlwaysOnDateSpecifier *lock_exemptedSecondsFutureSpecifier;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_previousSecondsFutureSpecifier = self->_lock_previousSecondsFutureSpecifier;
  self->_lock_previousSecondsFutureSpecifier = 0;

  lock_exemptedSecondsFutureSpecifier = self->_lock_exemptedSecondsFutureSpecifier;
  self->_lock_exemptedSecondsFutureSpecifier = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4
{
  BLSAlwaysOnDateSpecifier *v6;
  BLSAlwaysOnDateSpecifier *v7;
  BLSAlwaysOnDateSpecifier *lock_previousSecondsRenderedSpecifier;
  void *v9;

  v6 = (BLSAlwaysOnDateSpecifier *)a3;
  if (a4 == 2)
  {
    v7 = v6;
    os_unfair_lock_lock(&self->_lock);
    lock_previousSecondsRenderedSpecifier = self->_lock_previousSecondsRenderedSpecifier;
    self->_lock_previousSecondsRenderedSpecifier = v7;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expectedFidelity == BLSUpdateFidelitySeconds"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessSecondsBudget chargeRenderedSpecifier:expectedFidelity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  double v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSString *identifier;
  void *v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  void *v21;
  BLSHOSInterfaceProviding *osInterfaceProvider;
  BSTimerScheduleQuerying *v23;
  BSTimerScheduleQuerying *lock_invalidationTimer;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint8_t buf[4];
  BLSHInactiveProcessSecondsBudget *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  if (a4 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expectedFidelity == BLSUpdateFidelitySeconds"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHInactiveProcessSecondsBudget invalidateAtRequestDate:expectedFidelity:invalidationBlock:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145D4108);
  }
  v11 = v10;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_lastInvalidation && (objc_msgSend(v9, "timeIntervalSinceDate:"), v12 < 0.5))
  {
    v13 = -[BSTimerScheduleQuerying isScheduled](self->_lock_invalidationTimer, "isScheduled");
    bls_budget_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        identifier = self->_identifier;
        objc_msgSend(v9, "bls_shortLoggingString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BSTimerScheduleQuerying timeRemaining](self->_lock_invalidationTimer, "timeRemaining");
        *(_DWORD *)buf = 134218754;
        v29 = self;
        v30 = 2114;
        v31 = identifier;
        v32 = 2114;
        v33 = v17;
        v34 = 2048;
        v35 = v18;
        _os_log_impl(&dword_2145AC000, v14, OS_LOG_TYPE_INFO, "%p:%{public}@ will ignore budgeted invalidation (BLSUpdateFidelitySeconds) requesteDate:%{public}@ already have scheduled invalidation in %.3lfs", buf, 0x2Au);

      }
    }
    else
    {
      if (v15)
      {
        v19 = self->_identifier;
        objc_msgSend(v9, "bls_shortLoggingString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDate bls_shortLoggingString](self->_lock_lastInvalidation, "bls_shortLoggingString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v29 = self;
        v30 = 2114;
        v31 = v19;
        v32 = 2114;
        v33 = v20;
        v34 = 2048;
        v35 = 0x3FE0000000000000;
        v36 = 2114;
        v37 = v21;
        _os_log_impl(&dword_2145AC000, v14, OS_LOG_TYPE_INFO, "%p:%{public}@ will schedule budgeted invalidation (BLSUpdateFidelitySeconds) requesteDate:%{public}@ in %.0lfs  previous:%{public}@", buf, 0x34u);

      }
      -[BSTimerScheduleQuerying invalidate](self->_lock_invalidationTimer, "invalidate");
      osInterfaceProvider = self->_osInterfaceProvider;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __95__BLSHInactiveProcessSecondsBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke;
      v26[3] = &unk_24D1BCD20;
      v27 = v11;
      -[BLSHOSInterfaceProviding scheduledTimerWithIdentifier:interval:leewayInterval:handler:](osInterfaceProvider, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("SecondsInvalidationBudgetExceeded"), v26, 0.5, 0.125);
      v23 = (BSTimerScheduleQuerying *)objc_claimAutoreleasedReturnValue();
      lock_invalidationTimer = self->_lock_invalidationTimer;
      self->_lock_invalidationTimer = v23;

      v14 = v27;
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastInvalidation, a3);
    os_unfair_lock_unlock(&self->_lock);
    v11[2](v11);
  }

}

uint64_t __95__BLSHInactiveProcessSecondsBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performInvalidation
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;
  NSDate *lock_lastInvalidation;
  BSTimerScheduleQuerying *lock_invalidationTimer;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHOSInterfaceProviding now](self->_osInterfaceProvider, "now");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_lastInvalidation = self->_lock_lastInvalidation;
  self->_lock_lastInvalidation = v4;

  -[BSTimerScheduleQuerying invalidate](self->_lock_invalidationTimer, "invalidate");
  lock_invalidationTimer = self->_lock_invalidationTimer;
  self->_lock_invalidationTimer = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  BLSAlwaysOnDateSpecifier *lock_previousSecondsRenderedSpecifier;
  void *v7;
  double v8;
  double v9;
  BLSAlwaysOnDateSpecifier *lock_previousSecondsFutureSpecifier;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_previousSecondsRenderedSpecifier = self->_lock_previousSecondsRenderedSpecifier;
  if (lock_previousSecondsRenderedSpecifier)
  {
    -[BLSAlwaysOnDateSpecifier date](lock_previousSecondsRenderedSpecifier, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v7);
    v9 = v8;

    if (v9 < 1.0)
      goto LABEL_5;
  }
  lock_previousSecondsFutureSpecifier = self->_lock_previousSecondsFutureSpecifier;
  if (lock_previousSecondsFutureSpecifier
    && (-[BLSAlwaysOnDateSpecifier date](lock_previousSecondsFutureSpecifier, "date"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "timeIntervalSinceDate:", v11),
        v13 = v12,
        v11,
        v13 < 1.0))
  {
LABEL_5:
    v14 = 1;
  }
  else if (self->_lock_lastInvalidation)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    v14 = v15 < 1.0;
  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_lock_lastInvalidation, 0);
  objc_storeStrong((id *)&self->_lock_previousSecondsRenderedSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_exemptedSecondsFutureSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_previousSecondsFutureSpecifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

- (void)allowedFidelityAtDate:expectedFidelity:.cold.1()
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

- (void)validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:.cold.1()
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

- (void)chargeRenderedSpecifier:expectedFidelity:.cold.1()
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

- (void)invalidateAtRequestDate:expectedFidelity:invalidationBlock:.cold.1()
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
