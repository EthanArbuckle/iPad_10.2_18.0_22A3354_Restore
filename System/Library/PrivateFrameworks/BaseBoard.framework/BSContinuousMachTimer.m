@implementation BSContinuousMachTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)invalidate
{
  -[BSDispatchTimer invalidate]((uint64_t)self->_timer);
}

- (void)scheduleWithFireInterval:(double)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  id v11;
  BSDispatchTimer *timer;
  int64_t v19;
  dispatch_time_t v20;
  uint64_t v21;
  void *v22;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
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
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  BSContinuousMachTimer *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v40 = a5;
  v11 = a6;
  if ((*(uint64_t *)&a3 <= -1 || ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a3 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid fireInterval %f"), *(_QWORD *)&a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v24;
      v43 = 2114;
      v44 = v26;
      v45 = 2048;
      v46 = self;
      v47 = 2114;
      v48 = CFSTR("BSContinuousMachTimer.m");
      v49 = 1024;
      v50 = 62;
      v51 = 2114;
      v52 = v22;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BCF64);
  }
  if ((*(uint64_t *)&a4 <= -1 || ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid leeway %f"), *(_QWORD *)&a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v29;
      v43 = 2114;
      v44 = v31;
      v45 = 2048;
      v46 = self;
      v47 = 2114;
      v48 = CFSTR("BSContinuousMachTimer.m");
      v49 = 1024;
      v50 = 63;
      v51 = 2114;
      v52 = v27;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BD060);
  }
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v33;
      v43 = 2114;
      v44 = v35;
      v45 = 2048;
      v46 = self;
      v47 = 2114;
      v48 = CFSTR("BSContinuousMachTimer.m");
      v49 = 1024;
      v50 = 64;
      v51 = 2114;
      v52 = v32;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BD164);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v37;
      v43 = 2114;
      v44 = v39;
      v45 = 2048;
      v46 = self;
      v47 = 2114;
      v48 = CFSTR("BSContinuousMachTimer.m");
      v49 = 1024;
      v50 = 65;
      v51 = 2114;
      v52 = v36;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BD268);
  }
  timer = self->_timer;
  if (a3 >= 9223372040.0)
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a3 <= -9223372040.0)
  {
    v19 = 0x8000000000000000;
  }
  else
  {
    v19 = (uint64_t)(a3 * 1000000000.0);
  }
  v20 = dispatch_time(0x8000000000000000, v19);
  if (a4 >= 9223372040.0)
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4 <= -9223372040.0)
  {
    v21 = 0x8000000000000000;
  }
  else
  {
    v21 = (uint64_t)(a4 * 1000000000.0);
  }
  -[BSDispatchTimer scheduleWithFireTime:repeatNanoseconds:leewayNanoseconds:queue:weakContext:handler:]((uint64_t)timer, v20, -1, v21, v40, self, v11);

}

- (BSContinuousMachTimer)initWithIdentifier:(id)a3
{
  id v4;
  BSContinuousMachTimer *v5;
  uint64_t v6;
  BSDispatchTimer *timer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSContinuousMachTimer;
  v5 = -[BSContinuousMachTimer init](&v9, sel_init);
  if (v5)
  {
    +[BSDispatchTimer timerWithIdentifier:]((uint64_t)BSDispatchTimer, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    timer = v5->_timer;
    v5->_timer = (BSDispatchTimer *)v6;

  }
  return v5;
}

- (void)cancel
{
  -[BSDispatchTimer cancel]((os_unfair_lock_s *)self->_timer);
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
  BSContinuousMachTimer *v17;
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
      v19 = CFSTR("BSContinuousMachTimer.m");
      v20 = 1024;
      v21 = 31;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20E9E4);
  }
  v11.receiver = self;
  v11.super_class = (Class)BSContinuousMachTimer;
  -[BSContinuousMachTimer dealloc](&v11, sel_dealloc);
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

- (void)scheduleRepeatingWithFireInterval:(double)a3 repeatInterval:(double)a4 leewayInterval:(double)a5 queue:(id)a6 handler:(id)a7
{
  id v13;
  int64_t v23;
  BSDispatchTimer *timer;
  dispatch_time_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v36;
  objc_class *v37;
  void *v38;
  void *v39;
  id v41;
  objc_class *v42;
  void *v43;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  objc_class *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  BSContinuousMachTimer *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v52 = a6;
  v13 = a7;
  if ((*(uint64_t *)&a3 <= -1 || ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a3 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid fireInterval %f"), *(_QWORD *)&a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v31;
      v55 = 2114;
      v56 = v33;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BSContinuousMachTimer.m");
      v61 = 1024;
      v62 = 79;
      v63 = 2114;
      v64 = v29;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20EE70);
  }
  if ((*(uint64_t *)&a4 <= -1 || ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid repeatInterval %f"), *(_QWORD *)&a4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v36;
      v55 = 2114;
      v56 = v38;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BSContinuousMachTimer.m");
      v61 = 1024;
      v62 = 80;
      v63 = 2114;
      v64 = v34;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20EF6CLL);
  }
  if ((*(uint64_t *)&a5 <= -1 || ((*(_QWORD *)&a5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a5 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(_QWORD *)&a5 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid leeway %f"), *(_QWORD *)&a5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v41;
      v55 = 2114;
      v56 = v43;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BSContinuousMachTimer.m");
      v61 = 1024;
      v62 = 81;
      v63 = 2114;
      v64 = v39;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20F068);
  }
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v45;
      v55 = 2114;
      v56 = v47;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BSContinuousMachTimer.m");
      v61 = 1024;
      v62 = 82;
      v63 = 2114;
      v64 = v44;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20F16CLL);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v49;
      v55 = 2114;
      v56 = v51;
      v57 = 2048;
      v58 = self;
      v59 = 2114;
      v60 = CFSTR("BSContinuousMachTimer.m");
      v61 = 1024;
      v62 = 83;
      v63 = 2114;
      v64 = v48;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20F270);
  }
  if (a3 >= 9223372040.0)
  {
    v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a3 <= -9223372040.0)
  {
    v23 = 0x8000000000000000;
  }
  else
  {
    v23 = (uint64_t)(a3 * 1000000000.0);
  }
  timer = self->_timer;
  v25 = dispatch_time(0x8000000000000000, v23);
  if (a4 >= 9223372040.0)
  {
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4 <= -9223372040.0)
  {
    v26 = 0x8000000000000000;
  }
  else
  {
    v26 = (uint64_t)(a4 * 1000000000.0);
  }
  if (a5 >= 9223372040.0)
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a5 <= -9223372040.0)
  {
    v27 = 0x8000000000000000;
  }
  else
  {
    v27 = (uint64_t)(a5 * 1000000000.0);
  }
  if (v26 <= 1)
    v28 = 1;
  else
    v28 = v26;
  -[BSDispatchTimer scheduleWithFireTime:repeatNanoseconds:leewayNanoseconds:queue:weakContext:handler:]((uint64_t)timer, v25, v28, v27, v52, self, v13);

}

@end
