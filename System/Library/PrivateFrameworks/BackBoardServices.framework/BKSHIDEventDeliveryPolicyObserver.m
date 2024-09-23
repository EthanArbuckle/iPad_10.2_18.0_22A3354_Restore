@implementation BKSHIDEventDeliveryPolicyObserver

- (BKSHIDEventDeliveryPolicyObserver)init
{
  uint64_t v4;
  void *v5;
  BKSHIDEventDeliveryPolicyObserver *v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKSHIDEventDeliveryPolicyObserver *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeliveryPolicyObserver does not support subclassing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
      v20 = 1024;
      v21 = 54;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1148ACLL);
  }
  +[BKSHIDEventObserver sharedInstance](BKSHIDEventObserver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKSHIDEventDeliveryPolicyObserver _initWithObserver:](self, "_initWithObserver:", v5);

  return v6;
}

- (id)_initWithObserver:(id)a3
{
  id v6;
  void *v7;
  BKSHIDEventDeliveryPolicyObserver *v8;
  BKSHIDEventDeliveryPolicyObserver *v9;
  uint64_t v10;
  NSHashTable *lock_observers;
  uint64_t v12;
  BSInvalidatable *observingAssertion;
  id v14;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  BKSHIDEventDeliveryPolicyObserver *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  BKSHIDEventDeliveryPolicyObserver *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v17;
      v25 = 2114;
      v26 = v19;
      v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
      v31 = 1024;
      v32 = 59;
      v33 = 2114;
      v34 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A114AE8);
  }
  v7 = v6;
  v22.receiver = self;
  v22.super_class = (Class)BKSHIDEventDeliveryPolicyObserver;
  v8 = -[BKSHIDEventDeliveryPolicyObserver init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_observer, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v10 = objc_claimAutoreleasedReturnValue();
    lock_observers = v9->_lock_observers;
    v9->_lock_observers = (NSHashTable *)v10;

    -[BKSHIDEventObserver addDeferringObserver:](v9->_observer, "addDeferringObserver:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    observingAssertion = v9->_observingAssertion;
    v9->_observingAssertion = (BSInvalidatable *)v12;

    os_unfair_lock_lock(&v9->_lock);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__BKSHIDEventDeliveryPolicyObserver__initWithObserver___block_invoke;
    v20[3] = &unk_1E1EA15A8;
    v21 = v9;
    v14 = -[BKSHIDEventDeliveryPolicyObserver _lock_updateStateWithBlock:](v21, "_lock_updateStateWithBlock:", v20);
    os_unfair_lock_unlock(&v9->_lock);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_observingAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeliveryPolicyObserver;
  -[BKSHIDEventDeliveryPolicyObserver dealloc](&v3, sel_dealloc);
}

- (BKSHIDEventDisplay)display
{
  os_unfair_lock_s *p_lock;
  BKSHIDEventDisplay *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_lock_display;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDisplay:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  BKSHIDEventDeliveryPolicyObserver *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_msgSend(v15, "classForCoder");
      if (!v7)
        v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v19 = v12;
        v20 = 2114;
        v21 = v14;
        v22 = 2048;
        v23 = self;
        v24 = 2114;
        v25 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
        v26 = 1024;
        v27 = 91;
        v28 = 2114;
        v29 = v11;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A114DDCLL);
    }
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__BKSHIDEventDeliveryPolicyObserver_setDisplay___block_invoke;
    v16[3] = &unk_1E1EA1BF8;
    v16[4] = self;
    v17 = v15;
    v5 = -[BKSHIDEventDeliveryPolicyObserver _lock_updateStateWithBlock:](self, "_lock_updateStateWithBlock:", v16);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  os_unfair_lock_s *p_lock;
  BKSHIDEventDeferringEnvironment *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_lock_environment;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeferringEnvironment:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  BKSHIDEventDeliveryPolicyObserver *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_msgSend(v15, "classForCoder");
      if (!v7)
        v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("environment"), v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v19 = v12;
        v20 = 2114;
        v21 = v14;
        v22 = 2048;
        v23 = self;
        v24 = 2114;
        v25 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
        v26 = 1024;
        v27 = 111;
        v28 = 2114;
        v29 = v11;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A115088);
    }
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__BKSHIDEventDeliveryPolicyObserver_setDeferringEnvironment___block_invoke;
    v16[3] = &unk_1E1EA1BF8;
    v16[4] = self;
    v17 = v15;
    v5 = -[BKSHIDEventDeliveryPolicyObserver _lock_updateStateWithBlock:](self, "_lock_updateStateWithBlock:", v16);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BKSHIDEventDeferringToken)deferringToken
{
  os_unfair_lock_s *p_lock;
  BKSHIDEventDeferringToken *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_lock_token;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeferringToken:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  BKSHIDEventDeliveryPolicyObserver *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_msgSend(v15, "classForCoder");
      if (!v7)
        v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("token"), v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v19 = v12;
        v20 = 2114;
        v21 = v14;
        v22 = 2048;
        v23 = self;
        v24 = 2114;
        v25 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
        v26 = 1024;
        v27 = 131;
        v28 = 2114;
        v29 = v11;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A115334);
    }
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ((BSEqualObjects() & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__BKSHIDEventDeliveryPolicyObserver_setDeferringToken___block_invoke;
    v16[3] = &unk_1E1EA1BF8;
    v16[4] = self;
    v17 = v15;
    v5 = -[BKSHIDEventDeliveryPolicyObserver _lock_updateStateWithBlock:](self, "_lock_updateStateWithBlock:", v16);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (int64_t)policyStatus
{
  os_unfair_lock_s *p_lock;
  int64_t lock_policyStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_policyStatus = self->_lock_policyStatus;
  os_unfair_lock_unlock(p_lock);
  return lock_policyStatus;
}

- (BOOL)canReceiveEvents
{
  BKSHIDEventDeliveryPolicyObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = v2->_lock_policyStatus == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BKSHIDEventDeliveryPolicyObserver *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
      v18 = 1024;
      v19 = 158;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A115540);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BKSHIDEventDeliveryPolicyObserver *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
      v18 = 1024;
      v19 = 166;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1156CCLL);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (int64_t)_lock_policyStatus
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  pid_t v10;
  BKSHIDEventDisplay *lock_display;
  void *v12;
  _BOOL4 v13;
  BKSHIDEventDeferringEnvironment *lock_environment;
  void *v15;
  _BOOL4 v16;
  BKSHIDEventDeferringToken *lock_token;
  void *v18;
  int v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_lock_observations;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
      v10 = getpid();
      if (v10 == objc_msgSend(v9, "pid", (_QWORD)v22))
      {
        lock_display = self->_lock_display;
        if (!lock_display
          || (objc_msgSend(v9, "display"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = -[BKSHIDEventDisplay isEqual:](lock_display, "isEqual:", v12),
              v12,
              v13))
        {
          lock_environment = self->_lock_environment;
          if (!lock_environment
            || (objc_msgSend(v9, "environment"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                v16 = -[BKSHIDEventDeferringEnvironment isEqual:](lock_environment, "isEqual:", v15),
                v15,
                v16))
          {
            lock_token = self->_lock_token;
            if (!lock_token
              || (objc_msgSend(v9, "token"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = -[BKSHIDEventDeferringToken isEqual:](lock_token, "isEqual:", v18),
                  v18,
                  v19))
            {
              v20 = objc_msgSend(v9, "policyStatus");
              if (v20 > v6)
                v6 = v20;
              if (v6 == 2)
                break;
            }
          }
        }
      }
      if (v5 == ++v8)
      {
        v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_lock_updateStateWithBlock:(id)a3
{
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);
  unint64_t lock_policyStatus;
  int64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BKSHIDEventDeliveryPolicyObserver *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v20 = v16;
      v21 = 2114;
      v22 = v18;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = CFSTR("BKSHIDEventDeliveryPolicyObserver.m");
      v27 = 1024;
      v28 = 206;
      v29 = 2114;
      v30 = v15;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A115AE0);
  }
  v6 = v5;
  os_unfair_lock_assert_owner(&self->_lock);
  lock_policyStatus = self->_lock_policyStatus;
  v6[2](v6);
  v8 = -[BKSHIDEventDeliveryPolicyObserver _lock_policyStatus](self, "_lock_policyStatus");
  self->_lock_policyStatus = v8;
  if (v8 == lock_policyStatus)
  {
    v9 = 0;
  }
  else
  {
    BKLogEventDelivery();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[BKSHIDEventDeliveryPolicyObserver _lock_description](self, "_lock_description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBKSHIDEventDeferringPolicyStatus(lock_policyStatus);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_DEFAULT, "policyStatus:%{public}@ was:%{public}@", buf, 0x16u);

    }
    -[NSHashTable allObjects](self->_lock_observers, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v13, "copy");

  }
  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)_lock_description
{
  if (_lock_description_onceToken != -1)
    dispatch_once(&_lock_description_onceToken, &__block_literal_global_2166);
  return (id)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:withStyle:", self, _lock_description_lockedStyle);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_lock_appendDescriptionToStream:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke;
  v9[3] = &unk_1E1EA1BF8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v6, "appendProem:block:", self, v9);
  if (objc_msgSend(v6, "hasDebugStyle"))
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke_2;
    v7[3] = &unk_1E1EA1BF8;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v8, "appendBodySectionWithName:block:", 0, v7);

  }
}

- (void)appendDescriptionToStream:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("_BKSHIDEventDeliveryPolicyObserver_locked"));

  if (v6)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    -[BKSHIDEventDeliveryPolicyObserver _lock_appendDescriptionToStream:](self, "_lock_appendDescriptionToStream:", v7);

  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[BKSHIDEventDeliveryPolicyObserver _lock_appendDescriptionToStream:](self, "_lock_appendDescriptionToStream:", v7);

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)deferringResolutionsChanged
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  uint8_t buf[4];
  BKSHIDEventDeliveryPolicyObserver *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__BKSHIDEventDeliveryPolicyObserver_deferringResolutionsChanged__block_invoke;
  v18[3] = &unk_1E1EA15A8;
  v18[4] = self;
  -[BKSHIDEventDeliveryPolicyObserver _lock_updateStateWithBlock:](self, "_lock_updateStateWithBlock:", v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        BKLogEventDelivery();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_opt_class();
          *(_DWORD *)buf = 134218498;
          v20 = self;
          v21 = 2114;
          v22 = v12;
          v23 = 2048;
          v24 = v10;
          v13 = v12;
          _os_log_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_DEFAULT, "observerPolicyDidChange: %p -> <%{public}@: %p>", buf, 0x20u);

        }
        objc_msgSend(v10, "observerDeliveryPolicyDidChange:", self);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_observations, 0);
  objc_storeStrong((id *)&self->_lock_token, 0);
  objc_storeStrong((id *)&self->_lock_environment, 0);
  objc_storeStrong((id *)&self->_lock_display, 0);
  objc_storeStrong((id *)&self->_observingAssertion, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

void __64__BKSHIDEventDeliveryPolicyObserver_deferringResolutionsChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deferringObservations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[4];
  if (v3)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v2[4], CFSTR("display"));
    v2 = *(_QWORD **)(a1 + 32);
  }
  v5 = v2[5];
  if (v5)
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v5, CFSTR("environment"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if (!v7)
      goto LABEL_8;
    goto LABEL_7;
  }
  v7 = v2[6];
  if (v7)
  {
LABEL_7:
    v8 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v7, CFSTR("token"));
    goto LABEL_8;
  }
  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", CFSTR("process scope"), 0);
LABEL_8:
  v9 = *(void **)(a1 + 40);
  NSStringFromBKSHIDEventDeferringPolicyStatus(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("status"));

}

id __69__BKSHIDEventDeliveryPolicyObserver__lock_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  id result;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), CFSTR("observations"));
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  if (result)
    return (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("observers"));
  return result;
}

void __54__BKSHIDEventDeliveryPolicyObserver__lock_description__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D01758], "build:", &__block_literal_global_39);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_lock_description_lockedStyle;
  _lock_description_lockedStyle = v0;

}

void __54__BKSHIDEventDeliveryPolicyObserver__lock_description__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a2;
  objc_msgSend(v2, "setWithObject:", CFSTR("_BKSHIDEventDeliveryPolicyObserver_locked"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientInformation:", v4);

}

void __55__BKSHIDEventDeliveryPolicyObserver_setDeferringToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __61__BKSHIDEventDeliveryPolicyObserver_setDeferringEnvironment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__BKSHIDEventDeliveryPolicyObserver_setDisplay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __55__BKSHIDEventDeliveryPolicyObserver__initWithObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deferringObservations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

@end
