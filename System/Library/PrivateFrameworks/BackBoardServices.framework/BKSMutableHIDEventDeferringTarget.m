@implementation BKSMutableHIDEventDeferringTarget

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDeferringTarget _initWithPID:token:](+[BKSHIDEventDeferringTarget allocWithZone:](BKSHIDEventDeferringTarget, "allocWithZone:", a3), "_initWithPID:token:", self->super._pid, self->super._token);
}

- (BKSMutableHIDEventDeferringTarget)init
{
  uint64_t v4;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BKSMutableHIDEventDeferringTarget *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSMutableHIDEventDeferringTarget cannot be subclassed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544642;
      v11 = v7;
      v12 = 2114;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEventDeferringTarget.m");
      v18 = 1024;
      v19 = 148;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FDB60);
  }
  return (BKSMutableHIDEventDeferringTarget *)-[BKSHIDEventDeferringTarget _initWithPID:token:](self, "_initWithPID:token:", getpid(), 0);
}

- (void)setToken:(id)a3
{
  BKSHIDEventDeferringToken *v5;
  BKSHIDEventDeferringToken *token;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BKSMutableHIDEventDeferringTarget *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)objc_msgSend(v16, "classForCoder");
      if (!v8)
        v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("token"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        v19 = 2114;
        v20 = v15;
        v21 = 2048;
        v22 = self;
        v23 = 2114;
        v24 = CFSTR("BKSHIDEventDeferringTarget.m");
        v25 = 1024;
        v26 = 160;
        v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FDE30);
    }
  }

  v5 = (BKSHIDEventDeferringToken *)objc_msgSend(v16, "copy");
  token = self->super._token;
  self->super._token = v5;

}

- (void)setPid:(int)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSMutableHIDEventDeferringTarget *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138544642;
      v10 = v6;
      v11 = 2114;
      v12 = v8;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BKSHIDEventDeferringTarget.m");
      v17 = 1024;
      v18 = 154;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0FE2A8);
  }
  self->super._pid = a3;
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventDeferringTarget);
}

@end
