@implementation BSWallclockTimer

- (BSWallclockTimer)initWithIdentifier:(id)a3
{
  id v4;
  BSWallclockTimer *v5;
  uint64_t v6;
  BSDispatchTimer *timer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSWallclockTimer;
  v5 = -[BSWallclockTimer init](&v9, sel_init);
  if (v5)
  {
    +[BSDispatchTimer timerWithIdentifier:]((uint64_t)BSDispatchTimer, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    timer = v5->_timer;
    v5->_timer = (BSDispatchTimer *)v6;

  }
  return v5;
}

- (void)dealloc
{
  void *v4;
  BSDispatchTimer *timer;
  BSDispatchTimer *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BSWallclockTimer *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[BSDispatchTimer cancel]((os_unfair_lock_s *)self->_timer);
  if ((-[BSDispatchTimer hasBeenInvalidated]((os_unfair_lock_s *)self->_timer) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    timer = self->_timer;
    if (timer)
      timer = (BSDispatchTimer *)timer->_identifier;
    v6 = timer;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("must invalidate timer \"%@\" before dealloc"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BSWallclockTimer.m");
      v20 = 1024;
      v21 = 29;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E2C00);
  }
  v11.receiver = self;
  v11.super_class = (Class)BSWallclockTimer;
  -[BSWallclockTimer dealloc](&v11, sel_dealloc);
}

- (NSString)identifier
{
  BSDispatchTimer *timer;

  timer = self->_timer;
  if (timer)
    return timer->_identifier;
  else
    return 0;
}

- (BOOL)isScheduled
{
  return -[BSDispatchTimer isScheduled]((os_unfair_lock_s *)self->_timer);
}

- (double)timeRemaining
{
  return -[BSDispatchTimer timeRemaining]((uint64_t)self->_timer);
}

- (NSString)description
{
  void *v3;
  void *v4;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSDispatchTimer appendDescriptionToBuilder:forDebugging:]((uint64_t)self->_timer, v3, 0);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSDispatchTimer appendDescriptionToBuilder:forDebugging:]((uint64_t)self->_timer, v3, 1);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)scheduleForDate:(id)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  long double v18;
  long double v19;
  float64x2_t v20;
  dispatch_time_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  float64_t __y;
  _BYTE when[22];
  __int16 v38;
  BSWallclockTimer *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if ((*(uint64_t *)&a4 <= -1 || ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid leeway %f"), *(_QWORD *)&a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)when = 138544642;
      *(_QWORD *)&when[4] = v25;
      *(_WORD *)&when[12] = 2114;
      *(_QWORD *)&when[14] = v27;
      v38 = 2048;
      v39 = self;
      v40 = 2114;
      v41 = CFSTR("BSWallclockTimer.m");
      v42 = 1024;
      v43 = 60;
      v44 = 2114;
      v45 = v23;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", when, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E2FE4);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)when = 138544642;
      *(_QWORD *)&when[4] = v29;
      *(_WORD *)&when[12] = 2114;
      *(_QWORD *)&when[14] = v31;
      v38 = 2048;
      v39 = self;
      v40 = 2114;
      v41 = CFSTR("BSWallclockTimer.m");
      v42 = 1024;
      v43 = 61;
      v44 = 2114;
      v45 = v28;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", when, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E30E8);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)when = 138544642;
      *(_QWORD *)&when[4] = v33;
      *(_WORD *)&when[12] = 2114;
      *(_QWORD *)&when[14] = v35;
      v38 = 2048;
      v39 = self;
      v40 = 2114;
      v41 = CFSTR("BSWallclockTimer.m");
      v42 = 1024;
      v43 = 62;
      v44 = 2114;
      v45 = v32;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", when, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1E31ECLL);
  }
  __y = 0.0;
  objc_msgSend(v11, "timeIntervalSince1970");
  v19 = modf(v18, (long double *)&__y);
  v20.f64[0] = __y;
  v20.f64[1] = v19 * 1000000000.0;
  *(int64x2_t *)when = vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(v20, (float64x2_t)vdupq_n_s64(0xC3E0000000000000)), (float64x2_t)vdupq_n_s64(0x43E0000000000000uLL)));
  v21 = dispatch_walltime((const timespec *)when, 0);
  if (a4 >= 9223372040.0)
  {
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4 <= -9223372040.0)
  {
    v22 = 0x8000000000000000;
  }
  else
  {
    v22 = (uint64_t)(a4 * 1000000000.0);
  }
  -[BSDispatchTimer scheduleWithFireTime:repeatNanoseconds:leewayNanoseconds:queue:weakContext:handler:]((uint64_t)self->_timer, v21, -1, v22, v12, self, v14);

}

- (void)cancel
{
  -[BSDispatchTimer cancel]((os_unfair_lock_s *)self->_timer);
}

- (void)invalidate
{
  -[BSDispatchTimer invalidate]((uint64_t)self->_timer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
