@implementation FCOperation

void __39__FCOperation_associateChildOperation___block_invoke(uint64_t a1)
{
  -[FCOperation _associateChildOperation:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __41__FCOperation__finishOperationWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_storeStrong((id *)(v1 + 328), 0);
}

- (FCOperation)init
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  FCOnce *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_group_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)FCOperation;
  v2 = -[FCOperation init](&v24, sel_init);
  if (v2)
  {
    FCGenerateOperationID();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 38);
    *((_QWORD *)v2 + 38) = v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)*((_QWORD *)v2 + 41);
    *((_QWORD *)v2 + 41) = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0D60B18]);
    v8 = (void *)*((_QWORD *)v2 + 42);
    *((_QWORD *)v2 + 42) = v7;

    v9 = -[FCOnce initWithOptions:]([FCOnce alloc], "initWithOptions:", 1);
    v10 = (void *)*((_QWORD *)v2 + 43);
    *((_QWORD *)v2 + 43) = v9;

    objc_storeStrong((id *)v2 + 37, CFSTR("unknown"));
    *((_QWORD *)v2 + 35) = 0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@>"), objc_opt_class(), *((_QWORD *)v2 + 38));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 32);
    *((_QWORD *)v2 + 32) = v11;

    v13 = dispatch_group_create();
    v14 = (void *)*((_QWORD *)v2 + 44);
    *((_QWORD *)v2 + 44) = v13;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 44));
    v15 = FCCurrentQoSOrUtilityIfMain();
    v23.receiver = v2;
    v23.super_class = (Class)FCOperation;
    -[FCOperation setQualityOfService:](&v23, sel_setQualityOfService_, v15);
    if (v15 == 33 || v15 == 25)
    {
      v16 = 4;
      v17 = 1;
    }
    else if (v15 == 9)
    {
      v16 = -4;
      v17 = -1;
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
    *((_QWORD *)v2 + 33) = v17;
    v22.receiver = v2;
    v22.super_class = (Class)FCOperation;
    -[FCOperation setQueuePriority:](&v22, sel_setQueuePriority_, v16);
    v18 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v2, "shortOperationDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ created", buf, 0xCu);

    }
  }
  return (FCOperation *)v2;
}

- (void)_associateChildOperation:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1 || !v3)
    goto LABEL_15;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE658BC0))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = (void *)FCOperationLog;
  v8 = os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_12;
    v9 = v7;
    objc_msgSend(v6, "shortOperationDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "shortOperationDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v10;
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v25, 0x16u);

  }
  else
  {
    if (!v8)
      goto LABEL_12;
    v9 = v7;
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend((id)a1, "shortOperationDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v12;
    v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "associated child operation %{public}@ with parent %{public}@", (uint8_t *)&v25, 0x16u);

  }
LABEL_12:
  if (*(_BYTE *)(a1 + 250) || (v15 = *(void **)(a1 + 328)) == 0)
  {
    objc_msgSend(v4, "cancel");
  }
  else
  {
    objc_msgSend(v15, "addObject:", v4);
    if ((objc_msgSend((id)a1, "propertiesInheritedByChildOperations") & 2) != 0)
    {
      if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE658C50))
        v16 = v4;
      else
        v16 = 0;
      v17 = v16;
      objc_msgSend(v17, "setRelativePriority:", objc_msgSend((id)a1, "relativePriority"));

    }
    if ((objc_msgSend((id)a1, "propertiesInheritedByChildOperations") & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v4;
      else
        v18 = 0;
      v19 = v18;
      objc_msgSend(v19, "setQualityOfService:", objc_msgSend((id)a1, "qualityOfService"));

    }
    if ((objc_msgSend((id)a1, "propertiesInheritedByChildOperations") & 4) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v4;
      else
        v20 = 0;
      v21 = v20;
      objc_msgSend((id)a1, "purpose");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPurpose:", v22);

    }
    if ((objc_msgSend((id)a1, "propertiesInheritedByChildOperations") & 8) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v4;
      else
        v23 = 0;
      v24 = v23;
      objc_msgSend(v24, "setFlags:", objc_msgSend((id)a1, "flags"));

    }
  }

LABEL_15:
}

- (NSString)shortOperationDescription
{
  return self->_shortOperationDescription;
}

- (unint64_t)propertiesInheritedByChildOperations
{
  return 15;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setQualityOfService:(int64_t)a3
{
  NFUnfairLock *childOperationsLock;
  _QWORD v6[6];
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCOperation;
  if (-[FCOperation qualityOfService](&v8, sel_qualityOfService) != (id)a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)FCOperation;
    -[FCOperation setQualityOfService:](&v7, sel_setQualityOfService_, a3);
    if ((-[FCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 1) != 0)
    {
      if (self)
        childOperationsLock = self->_childOperationsLock;
      else
        childOperationsLock = 0;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __35__FCOperation_setQualityOfService___block_invoke;
      v6[3] = &unk_1E4640A20;
      v6[4] = self;
      v6[5] = a3;
      -[NFUnfairLock performWithLockSync:](childOperationsLock, "performWithLockSync:", v6);
    }
  }
}

- (void)setRelativePriority:(int64_t)a3
{
  int64_t v5;
  NFUnfairLock *childOperationsLock;
  _QWORD v7[6];

  if (self->_relativePriority != a3)
  {
    self->_relativePriority = a3;
    if ((unint64_t)(a3 + 1) >= 4)
      v5 = 0;
    else
      v5 = 4 * (a3 + 1) - 4;
    -[FCOperation setQueuePriority:](self, "setQueuePriority:", v5);
    if ((-[FCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 2) != 0)
    {
      childOperationsLock = self->_childOperationsLock;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35__FCOperation_setRelativePriority___block_invoke;
      v7[3] = &unk_1E4640A20;
      v7[4] = self;
      v7[5] = a3;
      -[NFUnfairLock performWithLockSync:](childOperationsLock, "performWithLockSync:", v7);
    }
  }
}

- (NSString)longOperationDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  FCStringFromQualityOfService(-[FCOperation qualityOfService](self, "qualityOfService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromQueuePriority(-[FCOperation queuePriority](self, "queuePriority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCOperation purpose](self, "purpose");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[FCOperation operationID](self, "operationID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5 == CFSTR("unknown"))
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %@, qos=%@, priority=%@>"), v7, v8, v3, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FCOperation purpose](self, "purpose");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %@, qos=%@, priority=%@, purpose=%@>"), v7, v9, v3, v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v11;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (BOOL)isExecuting
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_executing);
  return v2 & 1;
}

- (void)_startIfNeeded
{
  unsigned __int8 *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  dispatch_time_t v19;
  void *v20;
  void *v21;
  SEL v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a1[43], "trigger"))
  {
    objc_storeStrong(a1 + 45, a1);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(a1, "setOperationStartTime:");
    v2 = a1;
    objc_msgSend(v2, "throttleGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCOperation _userDefaultsKeyForThrottleEndDate](v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v6, "timeIntervalSinceNow");
        if (v7 > 0.0)
        {
          v8 = ceil(v7) + 1.0;

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "errorUserInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addEntriesFromDictionary:", v10);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("FCErrorRetryAfter"));

          objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:additionalUserInfo:", 12, CFSTR("The operation was throttled."), v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCOperation _finishOperationWithError:]((uint64_t)v2, v12);

          v13 = 0;
LABEL_18:

          return;
        }
      }

    }
    v24 = 0;
    v14 = objc_msgSend(v2, "validateOperationError:", &v24);
    v13 = v24;
    if ((v14 & 1) != 0)
    {
      if (objc_msgSend(v2, "isCancelled"))
      {
        objc_msgSend(v2, "finishFromEarlyCancellation");
      }
      else
      {
        objc_msgSend(v2, "willChangeValueForKey:", CFSTR("isExecuting"));
        atomic_store(1u, v2 + 248);
        objc_msgSend(v2, "didChangeValueForKey:", CFSTR("isExecuting"));
        v15 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          objc_msgSend(v2, "longOperationDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ started", buf, 0xCu);

        }
        objc_msgSend(v2, "timeoutDuration");
        if (v18 == 1.79769313e308)
          v19 = -1;
        else
          v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
        FCDispatchQueueForQualityOfService(objc_msgSend(v2, "qualityOfService"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __29__FCOperation__startIfNeeded__block_invoke_80;
        v23[3] = &unk_1E463AB18;
        v23[4] = v2;
        FCHandleOperationTimeout(v19, v20, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_nonatomic_copy(v2, v22, v21, 320);

        objc_msgSend(v2, "prepareOperation");
        objc_msgSend(v2, "performOperation");
      }
    }
    else
    {
      -[FCOperation _finishOperationWithError:]((uint64_t)v2, v13);
    }
    goto LABEL_18;
  }
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setOperationStartTime:(double)a3
{
  self->_operationStartTime = a3;
}

- (BOOL)validateOperationError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;

  v5 = -[FCOperation validateOperation](self, "validateOperation");
  if (v5)
  {
    *a3 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    -[FCOperation errorUserInfo](self, "errorUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_errorWithCode:description:additionalUserInfo:", 9, CFSTR("The operation failed validation."), v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)throttleGroup
{
  return 0;
}

- (void)_finishOperationWithError:(uint64_t)a1
{
  char *v3;
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (objc_msgSend((id)a1, "isFinished") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend((id)a1, "shortOperationDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("operation %@ must only be finished once"), v16);
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCOperation _finishOperationWithError:]";
      v23 = 2080;
      v24 = "FCOperation.m";
      v25 = 1024;
      v26 = 594;
      v27 = 2114;
      v28 = v17;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    if (objc_msgSend((id)a1, "isCancelled"))
    {
      v6 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v6;
        objc_msgSend((id)a1, "shortOperationDescription");
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v8;
        v9 = "%{public}@ cancelled";
        v10 = v7;
        v11 = 12;
LABEL_16:
        _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);

      }
LABEL_17:
      objc_msgSend((id)a1, "operationWillFinishWithError:", v3);
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("isExecuting"));
      atomic_store(0, (unsigned __int8 *)(a1 + 248));
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("isExecuting"));
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("isFinished"));
      atomic_store(1u, (unsigned __int8 *)(a1 + 249));
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("isFinished"));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 352));
      v14 = *(void **)(a1 + 336);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __41__FCOperation__finishOperationWithError___block_invoke;
      v20[3] = &unk_1E463AB18;
      v20[4] = a1;
      objc_msgSend(v14, "performWithLockSync:", v20);
      objc_msgSend((id)a1, "operationDidFinishWithError:", v3);
      objc_storeStrong((id *)(a1 + 360), 0);
      goto LABEL_18;
    }
    v12 = FCOperationLog;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
      {
        v18 = v12;
        objc_msgSend((id)a1, "shortOperationDescription");
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v19;
        v23 = 2114;
        v24 = v3;
        _os_log_error_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed with error: %{public}@. This log is being duplicated as an default-level log", buf, 0x16u);

        v12 = FCOperationLog;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v7 = v12;
      objc_msgSend((id)a1, "shortOperationDescription");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v8;
      v23 = 2114;
      v24 = v3;
      v9 = "%{public}@ failed with error: %{public}@. This log is being duplicated as an error-level log";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v7 = v12;
      objc_msgSend((id)a1, "shortOperationDescription");
      v8 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "operationStartTime");
      *(_DWORD *)buf = 138543618;
      v22 = v8;
      v23 = 2048;
      v24 = (char *)(fmax(v5 - v13, 0.0) * 1000.0);
      v9 = "%{public}@ finished with total time: %llums";
    }
    v10 = v7;
    v11 = 22;
    goto LABEL_16;
  }
LABEL_18:

}

- (BOOL)isFinished
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (double)operationStartTime
{
  return self->_operationStartTime;
}

- (void)dealloc
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_finished);
  v4 = atomic_load((unsigned __int8 *)&self->_executing);
  if ((v3 & 1) == 0 && (v4 & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("an operation should never be deallocated while still executing"));
      *(_DWORD *)buf = 136315906;
      v8 = "-[FCOperation dealloc]";
      v9 = 2080;
      v10 = "FCOperation.m";
      v11 = 1024;
      v12 = 92;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_6;
  }
  if ((v3 & 1) == 0)
LABEL_6:
    dispatch_group_leave((dispatch_group_t)self->_finishedGroup);
  v6.receiver = self;
  v6.super_class = (Class)FCOperation;
  -[FCOperation dealloc](&v6, sel_dealloc);
}

- (void)setPurpose:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *purpose;
  NFUnfairLock *childOperationsLock;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DE7910];
    -[FCOperation purpose](self, "purpose");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "nf_object:isEqualToObject:", v4, v6);

    if ((v5 & 1) == 0)
    {
      v7 = (NSString *)objc_msgSend(v4, "copy");
      purpose = self->_purpose;
      self->_purpose = v7;

      if ((-[FCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 4) != 0)
      {
        childOperationsLock = self->_childOperationsLock;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __26__FCOperation_setPurpose___block_invoke_2;
        v10[3] = &unk_1E463AD10;
        v10[4] = self;
        v11 = v4;
        -[NFUnfairLock performWithLockSync:](childOperationsLock, "performWithLockSync:", v10);

      }
    }
  }
  else
  {
    -[FCOperation setPurpose:](self, "setPurpose:", CFSTR("unknown"));
  }

}

- (void)associateChildOperation:(id)a3
{
  id v4;
  void *v5;
  NFUnfairLock *childOperationsLock;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self)
      childOperationsLock = self->_childOperationsLock;
    else
      childOperationsLock = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__FCOperation_associateChildOperation___block_invoke;
    v7[3] = &unk_1E463AD10;
    v7[4] = self;
    v8 = v4;
    -[NFUnfairLock performWithLockSync:](childOperationsLock, "performWithLockSync:", v7);

  }
}

- (BOOL)validateOperation
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retentionToken, 0);
  objc_storeStrong((id *)&self->_finishedGroup, 0);
  objc_storeStrong((id *)&self->_startOnce, 0);
  objc_storeStrong((id *)&self->_childOperationsLock, 0);
  objc_storeStrong((id *)&self->_childOperations, 0);
  objc_storeStrong(&self->_timedOutTest, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_shortOperationDescription, 0);
}

- (void)finishedPerformingOperationWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!self)
  {
    v5 = 0;
LABEL_4:
    -[FCOperation _finishedPerformingOperationWithError:](self, v6);
    goto LABEL_5;
  }
  v4 = self->_timedOutTest;
  v5 = v4;
  if (!v4 || ((*((uint64_t (**)(id))v4 + 2))(v4) & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (void)_finishedPerformingOperationWithError:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  _BYTE buf[24];
  _BYTE v30[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_21;
  if (!v3 || (objc_msgSend(v3, "fc_isOperationThrottledError") & 1) != 0)
    goto LABEL_20;
  v28 = 0;
  if (objc_msgSend(a1, "shouldStartThrottlingWithError:retryAfter:", v4, &v28))
  {
    v5 = v28;
    v6 = v4;
    if (qword_1EE657BD0 != -1)
      dispatch_once(&qword_1EE657BD0, &__block_literal_global_88_0);
    objc_msgSend(a1, "throttleGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("a throttled operation must be part of a throttle group"));
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCOperation _handleThrottlingFromError:delay:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCOperation.m";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v30 = 372;
      *(_WORD *)&v30[4] = 2114;
      *(_QWORD *)&v30[6] = v26;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v8 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(a1, "shortOperationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "throttleGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)v30 = v5;
      *(_WORD *)&v30[8] = 2114;
      *(_QWORD *)&v30[10] = v6;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will start throttling requests from group %@ for %.2f seconds due to error %{public}@", buf, 0x2Au);

    }
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __48__FCOperation__handleThrottlingFromError_delay___block_invoke_92;
    *(_QWORD *)v30 = &unk_1E4640A20;
    *(_QWORD *)&v30[8] = a1;
    *(_QWORD *)&v30[16] = v5;
    objc_msgSend((id)_MergedGlobals_16, "performWithLockSync:", buf);

    goto LABEL_20;
  }
  if ((objc_msgSend(a1, "isCancelled") & 1) != 0
    || (v12 = objc_msgSend(a1, "maxRetries"), objc_msgSend(a1, "retryCount") >= v12))
  {
LABEL_20:
    -[FCOperation _finishOperationWithError:]((uint64_t)a1, v4);
    goto LABEL_21;
  }
  v27 = 0;
  v13 = objc_msgSend(a1, "canRetryWithError:retryAfter:", v4, &v27);
  v14 = v27;
  v15 = v14;
  if ((v13 & 1) == 0)
  {

    goto LABEL_20;
  }
  v16 = v4;
  v17 = v15;
  objc_msgSend(a1, "setRetryCount:", objc_msgSend(a1, "retryCount") + 1);
  v18 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(a1, "shortOperationDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(a1, "retryCount");
    v22 = objc_msgSend(a1, "maxRetries");
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)v30 = v22;
    *(_WORD *)&v30[8] = 2114;
    *(_QWORD *)&v30[10] = v17;
    *(_WORD *)&v30[18] = 2114;
    *(_QWORD *)&v30[20] = v16;
    _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform retry %lu of %lu after %{public}@ due to error: %{public}@", buf, 0x34u);

  }
  FCDispatchQueueForQualityOfService(objc_msgSend(a1, "qualityOfService"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __44__FCOperation__handleRetryFromError_signal___block_invoke;
  *(_QWORD *)v30 = &unk_1E4647E50;
  *(_QWORD *)&v30[8] = a1;
  v24 = v16;
  *(_QWORD *)&v30[16] = v24;
  v25 = v17;
  *(_QWORD *)&v30[24] = v25;
  objc_msgSend(v25, "onQueue:signal:", v23, buf);

LABEL_21:
}

- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4
{
  return 0;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (unint64_t)maxRetries
{
  return 0;
}

- (id)_userDefaultsKeyForThrottleEndDate
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "throttleGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("FCOperationThrottling:%@"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __35__FCOperation_setRelativePriority___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[41];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (v8)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "conformsToProtocol:", &unk_1EE658C50, (_QWORD)v11))v9 = v8;
          else
            v9 = 0;
        }
        else
        {
          v9 = 0;
        }
        v10 = v9;
        objc_msgSend(v10, "setRelativePriority:", *(_QWORD *)(a1 + 40));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __35__FCOperation_setQualityOfService___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[41];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (v8)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = v8;
          else
            v9 = 0;
        }
        else
        {
          v9 = 0;
        }
        v10 = v9;
        objc_msgSend(v10, "setQualityOfService:", *(_QWORD *)(a1 + 40), (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __26__FCOperation_setPurpose___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[41];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (v8)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = v8;
          else
            v9 = 0;
        }
        else
        {
          v9 = 0;
        }
        v10 = v9;
        objc_msgSend(v10, "setPurpose:", *(_QWORD *)(a1 + 40), (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)addCompletionHandler:(id)a3
{
  OS_dispatch_group *finishedGroup;
  NSObject *v6;
  id v7;
  NSObject *v8;

  if (a3)
  {
    if (self)
      finishedGroup = self->_finishedGroup;
    else
      finishedGroup = 0;
    v6 = finishedGroup;
    v7 = a3;
    FCDispatchQueueForQualityOfService(-[FCOperation qualityOfService](self, "qualityOfService"));
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v6, v8, v7);

  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCOperation;
  -[FCOperation cancel](&v3, sel_cancel);
  -[FCOperation cancelChildOperations](self, "cancelChildOperations");
}

- (void)setFlags:(int64_t)a3
{
  NFUnfairLock *childOperationsLock;
  _QWORD v6[6];

  if (self->_flags != a3)
  {
    self->_flags = a3;
    if ((-[FCOperation propertiesInheritedByChildOperations](self, "propertiesInheritedByChildOperations") & 8) != 0)
    {
      childOperationsLock = self->_childOperationsLock;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __24__FCOperation_setFlags___block_invoke;
      v6[3] = &unk_1E4640A20;
      v6[4] = self;
      v6[5] = a3;
      -[NFUnfairLock performWithLockSync:](childOperationsLock, "performWithLockSync:", v6);
    }
  }
}

void __24__FCOperation_setFlags___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[41];
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (v8)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = v8;
          else
            v9 = 0;
        }
        else
        {
          v9 = 0;
        }
        v10 = v9;
        objc_msgSend(v10, "setFlags:", *(_QWORD *)(a1 + 40), (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

void __29__FCOperation__startIfNeeded__block_invoke_80(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cancelChildOperations");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fc_errorWithCode:description:", 15, CFSTR("The operation timed out."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FCOperation _finishedPerformingOperationWithError:](v2, v3);

}

- (void)performOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCOperation performOperation]";
      v11 = 2080;
      v12 = "FCOperation.m";
      v13 = 1024;
      v14 = 315;
      v15 = 2114;
      v16 = v4;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCOperation performOperation]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
}

void __48__FCOperation__handleThrottlingFromError_delay___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D60AE0]);
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v0;

}

void __48__FCOperation__handleThrottlingFromError_delay___block_invoke_92(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCOperation _userDefaultsKeyForThrottleEndDate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || objc_msgSend(v4, "fc_isLaterThan:", v7))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCOperation _userDefaultsKeyForThrottleEndDate](*(void **)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

  }
}

void __44__FCOperation__handleRetryFromError_signal___block_invoke(uint64_t a1, int a2)
{
  if (a2 && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "resetForRetry");
    objc_msgSend(*(id *)(a1 + 32), "performOperation");
  }
  else
  {
    -[FCOperation _finishOperationWithError:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

- (void)finishFromEarlyCancellation
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  -[FCOperation errorUserInfo](self, "errorUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_operationCancelledErrorWithAdditionalUserInfo:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCOperation _finishOperationWithError:]((uint64_t)self, v4);

}

- (void)associateChildOperations:(id)a3
{
  id v4;
  NFUnfairLock *childOperationsLock;
  _QWORD v6[4];
  id v7;
  FCOperation *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (self)
      childOperationsLock = self->_childOperationsLock;
    else
      childOperationsLock = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__FCOperation_associateChildOperations___block_invoke;
    v6[3] = &unk_1E463AD10;
    v7 = v4;
    v8 = self;
    -[NFUnfairLock performWithLockSync:](childOperationsLock, "performWithLockSync:", v6);

  }
}

void __40__FCOperation_associateChildOperations___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        -[FCOperation _associateChildOperation:](*(_QWORD *)(a1 + 40), *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)cancelChildOperations
{
  NFUnfairLock *childOperationsLock;
  NFUnfairLock *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__58;
  v10 = __Block_byref_object_dispose__58;
  v11 = 0;
  if (self)
    childOperationsLock = self->_childOperationsLock;
  else
    childOperationsLock = 0;
  v4 = childOperationsLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__FCOperation_cancelChildOperations__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v5);

  objc_msgSend((id)v7[5], "makeObjectsPerformSelector:", sel_cancel);
  _Block_object_dispose(&v6, 8);

}

uint64_t __36__FCOperation_cancelChildOperations__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[41];
  v3 = v2;
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7 && (*(_BYTE *)(v7 + 250) = 1, (v8 = *(_QWORD *)(a1 + 32)) != 0))
    v9 = *(void **)(v8 + 328);
  else
    v9 = 0;
  return objc_msgSend(v9, "removeAllObjects");
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  return 0;
}

- (BOOL)waitUntilFinishedWithTimeout:(double)a3
{
  OS_dispatch_group *finishedGroup;
  int64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;

  if (self)
    finishedGroup = self->_finishedGroup;
  else
    finishedGroup = 0;
  v4 = (uint64_t)(a3 * 1000000000.0);
  v5 = finishedGroup;
  v6 = dispatch_time(0, v4);
  v7 = dispatch_group_wait(v5, v6);

  return v7 == 0;
}

- (FCOperation)proxyOperation
{
  return (FCOperation *)+[FCProxyOperation proxyForOperation:](FCProxyOperation, "proxyForOperation:", self);
}

- (BOOL)hasOperationStarted
{
  if (self)
    self = (FCOperation *)self->_startOnce;
  return -[FCOperation hasBeenTriggered](self, "hasBeenTriggered");
}

- (NSDictionary)errorUserInfo
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("FCErrorOperationClassNameKey");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = CFSTR("FCErrorOperationIDKey");
  -[FCOperation operationID](self, "operationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (int64_t)flags
{
  return self->_flags;
}

@end
