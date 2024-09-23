@implementation HDPowerAssertion

+ (HDPowerAssertion)powerAssertionWithIdentifier:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5
{
  __CFString *v9;
  id v10;
  IOReturn v11;
  IOReturn v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  dispatch_source_t v22;
  void *v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  void *v28;
  IOPMAssertionID AssertionID;
  id location;
  _BYTE handler[24];
  void *v32;
  id v33[2];

  v33[1] = *(id *)MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = a5;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDPowerAssertion.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeout > 0.0"));

  }
  AssertionID = 0;
  v11 = IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), v9, 0, 0, 0, a4 + 60.0, CFSTR("TimeoutActionTurnOff"), &AssertionID);
  if (v11)
  {
    v12 = v11;
    _HKInitializeLogging();
    HKLogInfrastructure();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)handler = 138412546;
      *(_QWORD *)&handler[4] = v9;
      *(_WORD *)&handler[12] = 1024;
      *(_DWORD *)&handler[14] = v12;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Failed to create power assertion \"%@\": %d", handler, 0x12u);
    }

    v14 = 0;
  }
  else
  {
    v14 = objc_alloc((Class)a1);
    v15 = v9;
    v16 = v10;
    if (v14)
    {
      *(_QWORD *)handler = v14;
      *(_QWORD *)&handler[8] = HDPowerAssertion;
      v14 = objc_msgSendSuper2((objc_super *)handler, sel_init);
      if (v14)
      {
        v17 = -[__CFString copy](v15, "copy");
        v18 = (void *)*((_QWORD *)v14 + 5);
        *((_QWORD *)v14 + 5) = v17;

        *((double *)v14 + 6) = a4;
        v19 = objc_msgSend(v16, "copy");
        v20 = (void *)*((_QWORD *)v14 + 3);
        *((_QWORD *)v14 + 3) = v19;

      }
    }

    *((_DWORD *)v14 + 2) = AssertionID;
    dispatch_get_global_queue(21, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v21);
    v23 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v22;

    v24 = *((_QWORD *)v14 + 2);
    v25 = dispatch_time(0, (unint64_t)(*((double *)v14 + 6) * 1000000000.0));
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, v14);
    v26 = *((_QWORD *)v14 + 2);
    *(_QWORD *)handler = MEMORY[0x1E0C809B0];
    *(_QWORD *)&handler[8] = 3221225472;
    *(_QWORD *)&handler[16] = __34__HDPowerAssertion__scheduleTimer__block_invoke;
    v32 = &unk_1E6CECE78;
    objc_copyWeak(v33, &location);
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume(*((dispatch_object_t *)v14 + 2));
    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }

  return (HDPowerAssertion *)v14;
}

- (HDPowerAssertion)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3;
  void *v5;
  objc_super v6;

  v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDPowerAssertion.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidated"));

  }
  v6.receiver = self;
  v6.super_class = (Class)HDPowerAssertion;
  -[HDPowerAssertion dealloc](&v6, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)invalidated
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  BOOL *p_invalidated;
  NSObject *timer;
  OS_dispatch_source *v6;
  id timeoutHandler;
  IOReturn v8;
  IOReturn v9;
  NSObject *v10;
  NSString *identifier;
  int v12;
  NSString *v13;
  __int16 v14;
  IOReturn v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_invalidated = &self->_invalidated;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_invalidated))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v6 = self->_timer;
    self->_timer = 0;

  }
  timeoutHandler = self->_timeoutHandler;
  self->_timeoutHandler = 0;

  v8 = IOPMAssertionRelease(self->_assertionID);
  if (v8)
  {
    v9 = v8;
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      identifier = self->_identifier;
      v12 = 138412546;
      v13 = identifier;
      v14 = 1024;
      v15 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Failed to release power assertion \"%@\": %d", (uint8_t *)&v12, 0x12u);
    }

  }
}

void __34__HDPowerAssertion__scheduleTimer__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCACAC4]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v7 = v4[5];
        v8 = v4[6];
        v9 = 138412546;
        v10 = v7;
        v11 = 2048;
        v12 = v8;
        _os_log_fault_impl(&dword_1B7802000, v6, OS_LOG_TYPE_FAULT, "Power assertion \"%@\" timed out after %f seconds", (uint8_t *)&v9, 0x16u);
      }

    }
    objc_msgSend(v4, "invalidate");
  }

  objc_autoreleasePoolPop(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
