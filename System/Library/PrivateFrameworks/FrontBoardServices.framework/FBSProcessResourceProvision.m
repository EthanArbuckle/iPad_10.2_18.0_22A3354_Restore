@implementation FBSProcessResourceProvision

__n128 __50__FBSProcessResourceProvision_allowanceRemaining___block_invoke(uint64_t a1)
{
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  if (objc_msgSend(*(id *)(a1 + 32), "isMonitoring"))
    objc_msgSend(*(id *)(a1 + 32), "_queue_updateConsumption");
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 56);
  v2[2] = result;
  v2[3].n128_u64[0] = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  return result;
}

- (void)_stopMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FBSProcessResourceProvision__stopMonitoring__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_beginMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FBSProcessExecutionProvision process](self, "process");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBSProcessPrettyDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProcessResourceType(self->_allowance.type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.frontboardservices.watchdog-%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E38E9DF8, "serial");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceClass:", 33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (OS_dispatch_queue *)BSDispatchQueueCreate();
  queue = self->_queue;
  self->_queue = v10;

  v12 = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FBSProcessResourceProvision__beginMonitoring__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(v12, block);

}

- (BOOL)_queue_updateConsumption
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  void *v6;
  $FE9EE766AA2F25CB6FFEABD6DDE6A993 *p_allowance;
  void *v8;
  void *v9;
  double v10;
  unint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[FBSProcessExecutionProvision isMonitoring](self, "isMonitoring")
    && !-[FBSProcessExecutionProvision isViolated](self, "isViolated"))
  {
    -[FBSProcessExecutionProvision process](self, "process");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v3 = -[FBSProcessResourceProvision _queue_calculateValueConsumed:](self, "_queue_calculateValueConsumed:", &v12);
    if (v3)
    {
      self->_consumedValue = v12;
      FBLogWatchdog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        FBSProcessPrettyDescription(v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        p_allowance = &self->_allowance;
        NSStringFromProcessResourceType(self->_allowance.type);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromProcessResourceValue(p_allowance->type, v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (double)v12 / (double)p_allowance->value;
        *(_DWORD *)buf = 138544130;
        v14 = v6;
        v15 = 2114;
        v16 = v8;
        v17 = 2114;
        v18 = v9;
        v19 = 2048;
        v20 = v10 * 100.0;
        _os_log_debug_impl(&dword_19A6D4000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] [%{public}@] Updated resource consumption: %{public}@ (%.2f%%)", buf, 0x2Au);

      }
    }
    else
    {
      FBLogWatchdog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[FBSProcessResourceProvision _queue_updateConsumption].cold.1(v4, (uint64_t)self);
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_prepareForReuse
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  FBSProcessPrettyDescription(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProcessResourceType(*(_QWORD *)(a2 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_19A6D4000, v5, v6, "[%{public}@] [%{public}@] Invalidated", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

void __47__FBSProcessResourceProvision__beginMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  unint64_t v17;
  double v18;
  void *v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  double v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "process");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("FBProcess"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "rbsHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D87D68];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "pid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleForIdentifier:error:", v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 112);
    *(_QWORD *)(v8 + 112) = v7;

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 56);
  if (v11 != 2)
  {
    if (v11 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = FBSProcessResourceValueForTimeInterval(v12);
      v13 = FBSProcessResourceTimeIntervalForValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v14 = -1.0;
      goto LABEL_14;
    }
LABEL_19:
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("FBSProcessResourceProvisionErrorDomain"), 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "_noteViolatedWithError:", v34);

    goto LABEL_20;
  }
  v15 = *(void **)(v10 + 112);
  if (!v15)
    goto LABEL_19;
  objc_msgSend(v15, "elapsedCPUTimeForFrontBoard");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = FBSProcessResourceValueForTimeInterval(v16);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v17)
  {
    v14 = FBSProcessResourceTimeIntervalForValue(v17);
    v13 = v14;
  }
  else
  {
    v18 = FBSProcessResourceTimeIntervalForValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)) * 0.5;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18 / (double)(unint64_t)objc_msgSend(v19, "processorCount");

    if (v20 >= 1.0)
      v14 = v20;
    else
      v14 = 1.0;
    v13 = v14;
  }
LABEL_14:
  if (v13 <= 0.0)
    goto LABEL_19;
  FBLogWatchdog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    FBSProcessPrettyDescription(v2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProcessResourceType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = FBSProcessResourceTimeIntervalForValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    *(_DWORD *)buf = 138544130;
    v41 = v22;
    v42 = 2114;
    v43 = v23;
    v44 = 2048;
    v45 = v24;
    v46 = 2048;
    v47 = v14;
    _os_log_impl(&dword_19A6D4000, v21, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Now monitoring resource allowance of %.2fs (at refreshInterval %.2fs)", buf, 0x2Au);

  }
  v25 = objc_msgSend(objc_alloc((Class)off_1E38E9DA8), "initWithIdentifier:", CFSTR("FBSProcessResourceProvisionMonitor"));
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 104);
  *(_QWORD *)(v26 + 104) = v25;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  *(double *)(*(_QWORD *)(a1 + 32) + 120) = v13;
  v28 = BSFloatLessThanFloat();
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 104);
  v31 = *(_QWORD *)(v29 + 96);
  if (v28)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __47__FBSProcessResourceProvision__beginMonitoring__block_invoke_24;
    v36[3] = &unk_1E38ED5C0;
    v32 = v2;
    v33 = *(_QWORD *)(a1 + 32);
    v37 = v32;
    v38 = v33;
    v39 = v13;
    objc_msgSend(v30, "scheduleWithFireInterval:leewayInterval:queue:handler:", v31, v36, v13, 1.0);

  }
  else
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __47__FBSProcessResourceProvision__beginMonitoring__block_invoke_26;
    v35[3] = &unk_1E38ED5E8;
    v35[4] = v29;
    objc_msgSend(v30, "scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:", v31, v35, v13, v14, 1.0);
  }
LABEL_20:

}

- (BOOL)_queue_calculateValueConsumed:(unint64_t *)a3
{
  int64_t type;
  unint64_t v6;
  RBSProcessHandle *processHandle;
  double v8;
  unint64_t Value;
  double v10;
  unint64_t v11;

  BSDispatchQueueAssert();
  type = self->_allowance.type;
  if (type != 2)
  {
    if (type != 1)
    {
LABEL_11:
      LOBYTE(processHandle) = 1;
      return (char)processHandle;
    }
    if (-[BSAbsoluteMachTimer isScheduled](self->_timer, "isScheduled"))
    {
      v6 = FBSProcessResourceValueForTimeInterval(self->_timerFireInterval * (double)self->_timerFireCount);
    }
    else
    {
      Value = FBSProcessResourceAllowanceGetValue((uint64_t)&self->_allowance);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v11 = FBSProcessResourceValueForTimeInterval(v10);
      if (Value >= v11 - self->_baselineValue)
        v6 = v11 - self->_baselineValue;
      else
        v6 = Value;
    }
LABEL_10:
    *a3 = v6;
    goto LABEL_11;
  }
  processHandle = self->_processHandle;
  if (processHandle)
  {
    -[RBSProcessHandle elapsedCPUTimeForFrontBoard](processHandle, "elapsedCPUTimeForFrontBoard");
    v6 = FBSProcessResourceValueForTimeInterval(v8) - self->_baselineValue;
    goto LABEL_10;
  }
  return (char)processHandle;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  FBSProcessResourceProvision *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBSProcessResourceProvision;
  -[FBSProcessExecutionProvision succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  NSStringFromProcessResourceAllowance(&v4->_allowance.type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("allowance"));

  objc_sync_exit(v4);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isResourceProvision
{
  return 1;
}

uint64_t __46__FBSProcessResourceProvision__stopMonitoring__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_stopMonitoring");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateConsumption");
}

- (void)_queue_stopMonitoring
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BSAbsoluteMachTimer *timer;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[FBSProcessExecutionProvision process](self, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FBLogWatchdog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    FBSProcessPrettyDescription(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProcessResourceType(self->_allowance.type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_19A6D4000, v4, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Stopped monitoring.", (uint8_t *)&v8, 0x16u);

  }
  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (int64_t)type
{
  return self->_allowance.type;
}

- (BOOL)allowanceRemaining:(id *)a3
{
  $7A943687CD0E45FBDC9482F4CE369844 *v3;
  NSObject *queue;
  unint64_t Value;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  unint64_t v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  if (a3)
  {
    if (-[FBSProcessExecutionProvision isViolated](self, "isViolated"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3810000000;
      v22 = &unk_19A77B5DA;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__FBSProcessResourceProvision_allowanceRemaining___block_invoke;
      block[3] = &unk_1E38ED598;
      block[4] = self;
      block[5] = &v19;
      block[6] = &v15;
      dispatch_sync(queue, block);
      Value = FBSProcessResourceAllowanceGetValue((uint64_t)(v20 + 4));
      v7 = v16[3];
      v8 = Value >= v7;
      v9 = Value - v7;
      if (v9 != 0 && v8)
      {
        if (v8)
          v10 = v9;
        else
          v10 = 0;
        FBSProcessResourceAllowanceMake(v20[4], v10, v20[6], &v12);
        *(_OWORD *)&v3->var0 = v12;
        v3->var2 = v13;
        LOBYTE(v3) = FBSProcessResourceAllowanceIsValid(v3);
      }
      else
      {
        LOBYTE(v3) = 0;
      }
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
    }
  }
  return (char)v3;
}

+ (id)provisionWithAllowance:(id *)a3
{
  id v5;
  __int128 v7;
  unint64_t var2;

  if (!FBSProcessResourceAllowanceIsValid(a3))
    return 0;
  v5 = objc_alloc((Class)a1);
  v7 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  return (id)objc_msgSend(v5, "initWithAllowance:", &v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $FE9EE766AA2F25CB6FFEABD6DDE6A993 allowance;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  allowance = self->_allowance;
  v5 = objc_msgSend(v4, "initWithAllowance:", &allowance);
  v6 = -[NSError copy](self->super._error, "copy");
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(_BYTE *)(v5 + 33) = self->super._violated;
  *(_BYTE *)(v5 + 32) = self->super._monitoring;
  *(_QWORD *)(v5 + 80) = self->_baselineValue;
  *(_QWORD *)(v5 + 88) = self->_consumedValue;
  return (id)v5;
}

- (FBSProcessResourceProvision)initWithAllowance:(id *)a3
{
  FBSProcessResourceProvision *result;
  unint64_t var2;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBSProcessResourceProvision;
  result = -[FBSProcessExecutionProvision init](&v6, sel_init);
  if (result)
  {
    var2 = a3->var2;
    *(_OWORD *)&result->_allowance.type = *(_OWORD *)&a3->var0;
    result->_allowance.reserved = var2;
    result->_consumedValue = 0;
  }
  return result;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __47__FBSProcessResourceProvision__prepareForReuse__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = 0;

}

- ($7A943687CD0E45FBDC9482F4CE369844)allowance
{
  *($FE9EE766AA2F25CB6FFEABD6DDE6A993 *)retstr = *($FE9EE766AA2F25CB6FFEABD6DDE6A993 *)((char *)self + 56);
  return self;
}

+ (id)provisionWithResourceType:(int64_t)a3 timeInterval:(double)a4
{
  _QWORD v6[3];

  FBSProcessResourceAllowanceMakeWithTimeInterval(a3, v6, a4);
  objc_msgSend(a1, "provisionWithAllowance:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__FBSProcessResourceProvision__beginMonitoring__block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  FBLogWatchdog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    FBSProcessPrettyDescription(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProcessResourceType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_19A6D4000, v2, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Watchdog fired because one shot interval hit (%f)", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_queue_updateConsumption");
  objc_msgSend(*(id *)(a1 + 40), "_queue_noteAllowanceExhausted");
  return objc_msgSend(*(id *)(a1 + 40), "_queue_stopMonitoring");
}

uint64_t __47__FBSProcessResourceProvision__beginMonitoring__block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateConsumptionFromTimer:", 1);
}

- (void)_updateProgress
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__FBSProcessResourceProvision__updateProgress__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __46__FBSProcessResourceProvision__updateProgress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateConsumptionFromTimer:", 0);
}

- (void)_queue_noteAllowanceExhausted
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  FBSProcessPrettyDescription(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProcessResourceType(*(_QWORD *)(a2 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_19A6D4000, v5, v6, "[%{public}@] [%{public}@] Allowance exhausted!", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

- (void)_queue_evaluateConsumptionFromTimer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t timerFireCount;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[FBSProcessExecutionProvision process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    ++self->_timerFireCount;
  FBLogWatchdog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    FBSProcessPrettyDescription(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProcessResourceType(self->_allowance.type);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    timerFireCount = self->_timerFireCount;
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2048;
    v15 = timerFireCount;
    _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Evaluating consumption... (%llu)", (uint8_t *)&v10, 0x20u);

  }
  if (!-[FBSProcessResourceProvision _queue_updateConsumption](self, "_queue_updateConsumption"))
    goto LABEL_8;
  if (self->_consumedValue >= self->_allowance.value)
  {
    -[FBSProcessResourceProvision _queue_noteAllowanceExhausted](self, "_queue_noteAllowanceExhausted");
LABEL_8:
    -[FBSProcessResourceProvision _queue_stopMonitoring](self, "_queue_stopMonitoring");
  }

}

- (void)setAllowance:(id *)a3
{
  unint64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_allowance.type = *(_OWORD *)&a3->var0;
  self->_allowance.reserved = var2;
}

- (void)_queue_updateConsumption
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  FBSProcessPrettyDescription(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProcessResourceType(*(_QWORD *)(a2 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_19A6D4000, v5, v6, "[%{public}@] [%{public}@] Unable to calculate resource consumption :(", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

@end
