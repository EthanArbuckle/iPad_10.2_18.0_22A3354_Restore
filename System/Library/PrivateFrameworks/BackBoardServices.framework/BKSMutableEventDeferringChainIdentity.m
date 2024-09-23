@implementation BKSMutableEventDeferringChainIdentity

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSEventDeferringChainIdentity _initWithCopyOf:]((id *)[BKSEventDeferringChainIdentity alloc], self);
}

- (void)setDisplay:(id)a3
{
  BKSHIDEventDisplay *v5;
  BKSHIDEventDisplay *v6;
  BKSHIDEventDisplay *display;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BKSMutableEventDeferringChainIdentity *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (BKSHIDEventDisplay *)a3;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      v26 = 2114;
      v27 = v14;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSEventDeferringChainIdentity.m");
      v32 = 1024;
      v33 = 215;
      v34 = 2114;
      v35 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A142930);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)-[BKSHIDEventDisplay classForCoder](v6, "classForCoder");
    if (!v16)
      v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v21;
      v26 = 2114;
      v27 = v23;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSEventDeferringChainIdentity.m");
      v32 = 1024;
      v33 = 215;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A142A6CLL);
  }

  display = self->super._display;
  self->super._display = v6;

}

- (void)setEnvironment:(id)a3
{
  BKSHIDEventDeferringEnvironment *v5;
  BKSHIDEventDeferringEnvironment *v6;
  BKSHIDEventDeferringEnvironment *environment;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BKSMutableEventDeferringChainIdentity *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (BKSHIDEventDeferringEnvironment *)a3;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("environment"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      v26 = 2114;
      v27 = v14;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSEventDeferringChainIdentity.m");
      v32 = 1024;
      v33 = 221;
      v34 = 2114;
      v35 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A142C20);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)-[BKSHIDEventDeferringEnvironment classForCoder](v6, "classForCoder");
    if (!v16)
      v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("environment"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v21;
      v26 = 2114;
      v27 = v23;
      v28 = 2048;
      v29 = self;
      v30 = 2114;
      v31 = CFSTR("BKSEventDeferringChainIdentity.m");
      v32 = 1024;
      v33 = 221;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A142D5CLL);
  }

  environment = self->super._environment;
  self->super._environment = v6;

}

@end
