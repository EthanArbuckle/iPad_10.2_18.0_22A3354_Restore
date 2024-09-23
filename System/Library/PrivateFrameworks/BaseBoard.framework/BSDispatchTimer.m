@implementation BSDispatchTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_handler, 0);
  objc_destroyWeak(&self->_lock_context);
  objc_storeStrong((id *)&self->_lock_source, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)dealloc
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSDispatchTimer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must invalidate timer \"%@\" before dealloc"), self->_identifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BSDispatchTimer.m");
      v17 = 1024;
      v18 = 59;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B26C8);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSDispatchTimer;
  -[BSDispatchTimer dealloc](&v8, sel_dealloc);
}

void __102__BSDispatchTimer_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void (**v3)(_QWORD, _QWORD);
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_DWORD *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 16));
    if (*(_DWORD *)(v1 + 88) == v2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 40));
      v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC](*(_QWORD *)(v1 + 48));
      ++*(_QWORD *)(v1 + 80);
      if (!WeakRetained || *(uint64_t *)(v1 + 64) <= 0)
        -[BSDispatchTimer _lock_cancel](v1);
    }
    else
    {
      v3 = 0;
      WeakRetained = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
    if (WeakRetained)
    {
      if (v3)
        ((void (**)(_QWORD, id))v3)[2](v3, WeakRetained);
    }

  }
}

- (void)cancel
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    -[BSDispatchTimer _lock_cancel]((uint64_t)a1);
    os_unfair_lock_unlock(v2);
  }
}

- (void)invalidate
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(_BYTE *)(a1 + 92))
    {
      *(_BYTE *)(a1 + 92) = 1;
      -[BSDispatchTimer _lock_cancel](a1);
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)_lock_cancel
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
    objc_storeWeak((id *)(a1 + 40), 0);
    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    ++*(_DWORD *)(a1 + 88);
  }
}

- (void)scheduleWithFireTime:(uint64_t)a3 repeatNanoseconds:(uint64_t)a4 leewayNanoseconds:(void *)a5 queue:(void *)a6 weakContext:(void *)a7 handler:
{
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  dispatch_source_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  objc_class *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  void *v43;
  id obj;
  _QWORD handler[5];
  int v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  obj = a6;
  v15 = a7;
  v16 = v15;
  if (a1)
  {
    if (!obj)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("context"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v48 = v29;
        v49 = 2114;
        v50 = v31;
        v51 = 2048;
        v52 = a1;
        v53 = 2114;
        v54 = CFSTR("BSDispatchTimer.m");
        v55 = 1024;
        v56 = 168;
        v57 = 2114;
        v58 = v28;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BDC90);
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v48 = v33;
        v49 = 2114;
        v50 = v35;
        v51 = 2048;
        v52 = a1;
        v53 = 2114;
        v54 = CFSTR("BSDispatchTimer.m");
        v55 = 1024;
        v56 = 169;
        v57 = 2114;
        v58 = v32;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BDD94);
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v48 = v37;
        v49 = 2114;
        v50 = v39;
        v51 = 2048;
        v52 = a1;
        v53 = 2114;
        v54 = CFSTR("BSDispatchTimer.m");
        v55 = 1024;
        v56 = 170;
        v57 = 2114;
        v58 = v36;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BDE98);
    }
    v17 = v14;
    v18 = dispatch_time(a2, 0);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(_BYTE *)(a1 + 92))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot schedule after invalidating"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler_);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v48 = v41;
        v49 = 2114;
        v50 = v43;
        v51 = 2048;
        v52 = a1;
        v53 = 2114;
        v54 = CFSTR("BSDispatchTimer.m");
        v55 = 1024;
        v56 = 176;
        v57 = 2114;
        v58 = v40;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BDF90);
    }
    if (*(_QWORD *)(a1 + 32) && *(NSObject **)(a1 + 24) != v17)
      -[BSDispatchTimer _lock_cancel](a1);
    v19 = *(_DWORD *)(a1 + 88) + 1;
    *(_DWORD *)(a1 + 88) = v19;
    *(_QWORD *)(a1 + 56) = v18;
    *(_QWORD *)(a1 + 64) = a3;
    *(_QWORD *)(a1 + 72) = a4 & ~(a4 >> 63);
    objc_storeWeak((id *)(a1 + 40), obj);
    objc_storeStrong((id *)(a1 + 24), a5);
    v14 = v17;
    v20 = MEMORY[0x18D769CFC](v16);
    v21 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v20;

    *(_QWORD *)(a1 + 80) = 0;
    v22 = *(NSObject **)(a1 + 32);
    if (v22)
    {
      dispatch_suspend(v22);
    }
    else
    {
      v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v17);
      v24 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v23;

    }
    v25 = *(NSObject **)(a1 + 32);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __102__BSDispatchTimer_scheduleWithFireTime_repeatNanoseconds_leewayNanoseconds_queue_weakContext_handler___block_invoke;
    handler[3] = &unk_1E1EBF620;
    handler[4] = a1;
    v46 = v19;
    v26 = (id)a1;
    dispatch_source_set_event_handler(v25, handler);
    if (*(uint64_t *)(a1 + 64) <= 0)
      v27 = -1;
    else
      v27 = *(_QWORD *)(a1 + 64);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), *(_QWORD *)(a1 + 56), v27, *(_QWORD *)(a1 + 72));
    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

  }
}

+ (_QWORD)timerWithIdentifier:(uint64_t)a1
{
  id v2;
  BSDispatchTimer *v3;
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  _BYTE v14[22];
  __int16 v15;
  BSDispatchTimer *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = [BSDispatchTimer alloc];
  v4 = v2;
  v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v14 = 138544642;
        *(_QWORD *)&v14[4] = v11;
        *(_WORD *)&v14[12] = 2114;
        *(_QWORD *)&v14[14] = v13;
        v15 = 2048;
        v16 = v3;
        v17 = 2114;
        v18 = CFSTR("BSDispatchTimer.m");
        v19 = 1024;
        v20 = 46;
        v21 = 2114;
        v22 = v10;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v14, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BE368);
    }
    *(_QWORD *)v14 = v3;
    *(_QWORD *)&v14[8] = BSDispatchTimer;
    v6 = objc_msgSendSuper2((objc_super *)v14, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)v6[1];
      v6[1] = v7;

      *((_DWORD *)v6 + 4) = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BSDispatchTimer)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSDispatchTimer *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSDispatchTimer *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is unavailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BSDispatchTimer.m");
    v17 = 1024;
    v18 = 41;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (BSDispatchTimer *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (os_unfair_lock_s)isScheduled
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)(*(_QWORD *)&v1[8]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (double)timeRemaining
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  dispatch_time_t v5;
  uint64_t v6;

  if (!a1)
    return 0.0;
  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 80);
  os_unfair_lock_unlock(v2);
  if (v3)
    return BSDispatchTimerTimeRemainingForFireTimeWithRepeat(v5, v6, v4);
  else
    return NAN;
}

- (void)appendDescriptionToBuilder:(int)a3 forDebugging:
{
  id v5;
  void *v6;
  uint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "appendString:withName:", *(_QWORD *)(a1 + 8), CFSTR("identifier"));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 80);
    v16 = *(_QWORD *)(a1 + 72);
    v11 = *(unsigned __int8 *)(a1 + 92);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    v12 = (id)objc_msgSend(v6, "appendBool:withName:", v7 != 0, CFSTR("isScheduled"));
    if (v7)
    {
      v13 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", CFSTR("timeRemaining"), 1, BSDispatchTimerTimeRemainingForFireTimeWithRepeat(v8, v10, v9));
      if (a3)
      {
        if (v9 != -1)
          dispatch_time_to_nsec();
        v14 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", CFSTR("leeway"), 0, (double)(v16 % 0x3B9ACA00) / 1000000000.0+ (double)(v16 / 0x3B9ACA00));
      }
    }
    v15 = (id)objc_msgSend(v6, "appendBool:withName:", v11 != 0, CFSTR("isInvalidated"));
  }

}

- (os_unfair_lock_s)hasBeenInvalidated
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[23]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

@end
