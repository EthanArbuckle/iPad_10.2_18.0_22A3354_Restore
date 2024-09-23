@implementation MSVTaskAssertion

- (void)dealloc
{
  NSObject *v3;
  NSObject *invalidationTimer;
  objc_super v5;
  uint8_t buf[4];
  MSVTaskAssertion *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_INFO, "Invalidating task assertion: %{public}@ (dealloc)", buf, 0xCu);
  }

  -[BKSProcessAssertion invalidate](self->_processAssertion, "invalidate");
  invalidationTimer = self->_invalidationTimer;
  if (invalidationTimer)
    dispatch_source_cancel(invalidationTimer);
  v5.receiver = self;
  v5.super_class = (Class)MSVTaskAssertion;
  -[MSVTaskAssertion dealloc](&v5, sel_dealloc);
}

- (id)_initWithName:(id)a3 bundleID:(id)a4 pid:(int)a5 subsystem:(id)a6 reason:(unint64_t)a7 flags:(unint64_t)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  MSVTaskAssertion *v17;
  void *v18;
  uint64_t v19;
  NSString *uuid;
  uint64_t v21;
  NSString *subsystem;
  uint64_t v23;
  NSString *bundleID;
  uint64_t v25;
  NSString *name;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  BKSProcessAssertion *processAssertion;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  BKSProcessAssertion *v35;
  char v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  uint8_t buf[4];
  MSVTaskAssertion *v45;
  uint64_t v46;

  v11 = *(_QWORD *)&a5;
  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v43.receiver = self;
  v43.super_class = (Class)MSVTaskAssertion;
  v17 = -[MSVTaskAssertion init](&v43, sel_init);
  if (!v17)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = objc_claimAutoreleasedReturnValue();
  uuid = v17->_uuid;
  v17->_uuid = (NSString *)v19;

  v21 = objc_msgSend(v16, "copy");
  subsystem = v17->_subsystem;
  v17->_subsystem = (NSString *)v21;

  v23 = objc_msgSend(v15, "copy");
  bundleID = v17->_bundleID;
  v17->_bundleID = (NSString *)v23;

  v17->_pid = v11;
  v25 = objc_msgSend(v14, "copy");
  name = v17->_name;
  v17->_name = (NSString *)v25;

  v27 = -[MSVTaskAssertion _BSKFlagsForMSVFlags:](v17, "_BSKFlagsForMSVFlags:", a8);
  v28 = -[MSVTaskAssertion _BSKReasonForMSVReason:](v17, "_BSKReasonForMSVReason:", a7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ %@"), v16, v17->_uuid, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v11)
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:", v11, v27, v28, v29);
    processAssertion = v17->_processAssertion;
    v17->_processAssertion = (BKSProcessAssertion *)v30;

    if (!v17->_bundleID)
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FallbackIdentifier-%d"), v11);
      v33 = v17->_bundleID;
      v17->_bundleID = (NSString *)v32;
LABEL_7:

    }
  }
  else if (v15)
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithBundleIdentifier:flags:reason:name:", v15, v27, v28, v29);
    v33 = v17->_processAssertion;
    v17->_processAssertion = (BKSProcessAssertion *)v34;
    goto LABEL_7;
  }
  objc_initWeak(&location, v17);
  v35 = v17->_processAssertion;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __70__MSVTaskAssertion__initWithName_bundleID_pid_subsystem_reason_flags___block_invoke;
  v40[3] = &unk_1E43E9DF0;
  objc_copyWeak(&v41, &location);
  -[BKSProcessAssertion setInvalidationHandler:](v35, "setInvalidationHandler:", v40);
  v36 = -[BKSProcessAssertion acquire](v17->_processAssertion, "acquire");
  v17->_acquired = v36;
  if ((v36 & 1) == 0)
  {
    v37 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v17;
      _os_log_impl(&dword_1A077D000, v37, OS_LOG_TYPE_ERROR, "Failed to acquire process assertion for task %@", buf, 0xCu);
    }

  }
  v38 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v17;
    _os_log_impl(&dword_1A077D000, v38, OS_LOG_TYPE_INFO, "Began task assertion: %@", buf, 0xCu);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

LABEL_15:
  return v17;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t pid;
  NSString *subsystem;
  NSString *bundleID;
  NSString *name;
  NSString *uuid;
  _BOOL4 v10;
  const __CFString *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  pid = self->_pid;
  bundleID = self->_bundleID;
  subsystem = self->_subsystem;
  name = self->_name;
  uuid = self->_uuid;
  v10 = -[MSVTaskAssertion isValid](self, "isValid");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p, bundleID = %@, pid = %lu, subsystem = %@, name = %@, uuid = %@, valid = %@>"), v4, self, bundleID, pid, subsystem, name, uuid, v11);
}

- (BOOL)isValid
{
  BKSProcessAssertion *processAssertion;

  processAssertion = self->_processAssertion;
  if (processAssertion)
    LOBYTE(processAssertion) = -[BKSProcessAssertion valid](processAssertion, "valid");
  return (char)processAssertion;
}

- (unsigned)_BSKReasonForMSVReason:(unint64_t)a3
{
  unsigned int result;
  void *v6;

  if (a3 < 3)
    return dword_1A07D49F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVTaskAssertion.m"), 233, CFSTR("Attempting to convert a non-existing MSVProcessAssertionReason value!"));

  return result;
}

- (unsigned)_BSKFlagsForMSVFlags:(unint64_t)a3
{
  return a3 & 3;
}

- (MSVTaskAssertion)initWithName:(id)a3 pid:(int)a4 bundleID:(id)a5 subsystem:(id)a6 reason:(unint64_t)a7 flags:(unint64_t)a8
{
  return (MSVTaskAssertion *)-[MSVTaskAssertion _initWithName:bundleID:pid:subsystem:reason:flags:](self, "_initWithName:bundleID:pid:subsystem:reason:flags:", a3, a5, *(_QWORD *)&a4, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MSVTaskAssertion)initWithName:(id)a3 pid:(int)a4 subsystem:(id)a5 reason:(unint64_t)a6 flags:(unint64_t)a7
{
  return (MSVTaskAssertion *)-[MSVTaskAssertion _initWithName:bundleID:pid:subsystem:reason:flags:](self, "_initWithName:bundleID:pid:subsystem:reason:flags:", a3, 0, *(_QWORD *)&a4, a5, a6, a7);
}

- (MSVTaskAssertion)initWithName:(id)a3 bundleID:(id)a4 subsystem:(id)a5 reason:(unint64_t)a6 flags:(unint64_t)a7
{
  return (MSVTaskAssertion *)-[MSVTaskAssertion _initWithName:bundleID:pid:subsystem:reason:flags:](self, "_initWithName:bundleID:pid:subsystem:reason:flags:", a3, a4, 0, a5, a6, a7);
}

- (MSVTaskAssertion)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithName_bundleID_subsystem_reason_flags_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithName_pid_subsystem_reason_flags_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is invalid. You must provide bundleID with %@ or a PID with %@."), v5, v6, v7);

  return 0;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

- (BOOL)acquire
{
  return self->_acquired;
}

- (void)invalidate
{
  NSObject *v3;
  void (**invalidationHandler)(id, MSVTaskAssertion *);
  id v5;
  int v6;
  MSVTaskAssertion *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEBUG, "Invalidating task assertion: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[BKSProcessAssertion invalidate](self->_processAssertion, "invalidate");
  -[MSVTaskAssertion _cancelInvalidationTimerWithCompletion:](self, "_cancelInvalidationTimerWithCompletion:", 0);
  invalidationHandler = (void (**)(id, MSVTaskAssertion *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, self);
    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (void)invalidateOnDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MSVTaskAssertion_invalidateOnDate___block_invoke;
  v6[3] = &unk_1E43E9F20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MSVTaskAssertion _cancelInvalidationTimerWithCompletion:](self, "_cancelInvalidationTimerWithCompletion:", v6);

}

- (void)_cancelInvalidationTimerWithCompletion:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MSVTaskAssertion__cancelInvalidationTimerWithCompletion___block_invoke;
  v6[3] = &unk_1E43E9EF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)name
{
  return self->_name;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

uint64_t __59__MSVTaskAssertion__cancelInvalidationTimerWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __37__MSVTaskAssertion_invalidateOnDate___block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  v6 = dispatch_time(0, 1000000000 * (unint64_t)v5);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 40), v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__MSVTaskAssertion_invalidateOnDate___block_invoke_2;
  v8[3] = &unk_1E43E9DF0;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__MSVTaskAssertion_invalidateOnDate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __70__MSVTaskAssertion__initWithName_bundleID_pid_subsystem_reason_flags___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1A077D000, v2, OS_LOG_TYPE_DEFAULT, "Task assertion %@ was invalidated.", (uint8_t *)&v3, 0xCu);
    }

  }
}

@end
