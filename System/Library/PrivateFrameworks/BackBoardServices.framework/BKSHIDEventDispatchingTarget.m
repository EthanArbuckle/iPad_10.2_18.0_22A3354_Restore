@implementation BKSHIDEventDispatchingTarget

- (unint64_t)hash
{
  unint64_t v3;
  BKSHIDEventDeferringToken *deferringToken;

  v3 = -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash") ^ (105491 * self->_pid);
  deferringToken = self->_deferringToken;
  if (deferringToken)
    v3 ^= -[BKSHIDEventDeferringToken hash](deferringToken, "hash");
  return v3;
}

id __61__BKSHIDEventDispatchingTarget_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deferringEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, 0, 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deferringToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("token"), 1);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", (int)objc_msgSend(*(id *)(a1 + 40), "pid"), CFSTR("pid"));
}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  return self->_environment;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventDispatchingTarget *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__BKSHIDEventDispatchingTarget_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (BKSHIDEventDispatchingTarget)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDispatchingTarget *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDispatchingTarget *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDispatchingTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BKSHIDEventDispatchingTarget.m");
    v17 = 1024;
    v18 = 26;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDispatchingTarget *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithEnvironment:(id)a3 token:(id)a4 pid:(int)a5
{
  id v9;
  id v10;
  uint64_t v11;
  BKSHIDEventDispatchingTarget *v12;
  uint64_t v13;
  BKSHIDEventDeferringEnvironment *environment;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  BKSHIDEventDispatchingTarget *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDispatchingTarget is not subclassable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v22 = v17;
      v23 = 2114;
      v24 = v19;
      v25 = 2048;
      v26 = self;
      v27 = 2114;
      v28 = CFSTR("BKSHIDEventDispatchingTarget.m");
      v29 = 1024;
      v30 = 31;
      v31 = 2114;
      v32 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1137A8);
  }
  v20.receiver = self;
  v20.super_class = (Class)BKSHIDEventDispatchingTarget;
  v12 = -[BKSHIDEventDispatchingTarget init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    environment = v12->_environment;
    v12->_environment = (BKSHIDEventDeferringEnvironment *)v13;

    v12->_pid = a5;
    objc_storeStrong((id *)&v12->_deferringToken, a4);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDeferringEnvironment *environment;
  id v5;

  environment = self->_environment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deferringToken, CFSTR("deferringToken"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_pid, CFSTR("pid"));

}

- (BKSHIDEventDispatchingTarget)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BKSHIDEventDispatchingTarget *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB28A8];
    v19 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDispatchingTarget: subclasses are not allowed : %@"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 4866, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);
LABEL_9:

    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferringToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
  if (v8)
    v12 = (int)v11 < 1;
  else
    v12 = 1;
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v21 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDispatchingTarget: invalid pid or environment : pid=%i environment=%@"), v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4866, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v16);

    goto LABEL_9;
  }
  v18 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:]([BKSHIDEventDispatchingTarget alloc], "_initWithEnvironment:token:pid:", v8, v9, v11);
LABEL_10:

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDispatchingTarget *v4;
  uint64_t v5;
  char v6;

  v4 = (BKSHIDEventDispatchingTarget *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && self->_pid == v4->_pid && BSEqualObjects())
      v6 = BSEqualObjects();
    else
      v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BKSHIDEventDeferringToken)deferringToken
{
  return self->_deferringToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1)
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_1918);
  return (id)systemTarget___systemTarget;
}

+ (id)keyboardFocusTarget
{
  if (keyboardFocusTarget_onceToken != -1)
    dispatch_once(&keyboardFocusTarget_onceToken, &__block_literal_global_8);
  return (id)keyboardFocusTarget___focusTarget;
}

+ (id)systemTargetWithDeferringToken:(id)a3
{
  id v3;
  BKSHIDEventDispatchingTarget *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = [BKSHIDEventDispatchingTarget alloc];
  +[BKSHIDEventDeferringEnvironment systemEnvironment](BKSHIDEventDeferringEnvironment, "systemEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:](v4, "_initWithEnvironment:token:pid:", v5, v3, getpid());

  return v6;
}

+ (id)keyboardFocusTargetWithDeferringToken:(id)a3
{
  id v3;
  BKSHIDEventDispatchingTarget *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = [BKSHIDEventDispatchingTarget alloc];
  +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:](v4, "_initWithEnvironment:token:pid:", v5, v3, getpid());

  return v6;
}

+ (id)targetForDeferringEnvironment:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:]([BKSHIDEventDispatchingTarget alloc], "_initWithEnvironment:token:pid:", v3, 0, getpid());

  return v4;
}

+ (id)targetForDeferringEnvironment:(id)a3 deferringToken:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:]([BKSHIDEventDispatchingTarget alloc], "_initWithEnvironment:token:pid:", v6, v5, getpid());

  return v7;
}

+ (id)targetForPID:(int)a3 environment:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v4 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((int)v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544642;
      v21 = v17;
      v22 = 2114;
      v23 = v19;
      v24 = 2048;
      v25 = a1;
      v26 = 2114;
      v27 = CFSTR("BKSHIDEventDispatchingTarget.m");
      v28 = 1024;
      v29 = 82;
      v30 = 2114;
      v31 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v20, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A113FB4);
  }
  v8 = v7;
  if (getpid() != (_DWORD)v4)
    goto LABEL_7;
  +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v10)
  {
    +[BKSHIDEventDeferringEnvironment systemEnvironment](BKSHIDEventDeferringEnvironment, "systemEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqual:", v12);

    if (v13)
    {
      +[BKSHIDEventDispatchingTarget systemTarget](BKSHIDEventDispatchingTarget, "systemTarget");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v11 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:]([BKSHIDEventDispatchingTarget alloc], "_initWithEnvironment:token:pid:", v8, 0, v4);
    goto LABEL_8;
  }
  +[BKSHIDEventDispatchingTarget keyboardFocusTarget](BKSHIDEventDispatchingTarget, "keyboardFocusTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = v11;

  return v14;
}

+ (id)focusTargetForPID:(int)a3
{
  uint64_t v3;
  BKSHIDEventDispatchingTarget *v5;
  void *v6;
  id v7;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = a1;
      v20 = 2114;
      v21 = CFSTR("BKSHIDEventDispatchingTarget.m");
      v22 = 1024;
      v23 = 96;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11416CLL);
  }
  v3 = *(_QWORD *)&a3;
  if (getpid() == a3)
  {
    +[BKSHIDEventDispatchingTarget keyboardFocusTarget](BKSHIDEventDispatchingTarget, "keyboardFocusTarget");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [BKSHIDEventDispatchingTarget alloc];
    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:](v5, "_initWithEnvironment:token:pid:", v6, 0, v3);

    return v7;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __51__BKSHIDEventDispatchingTarget_keyboardFocusTarget__block_invoke()
{
  BKSHIDEventDispatchingTarget *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [BKSHIDEventDispatchingTarget alloc];
  +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:](v0, "_initWithEnvironment:token:pid:", v3, 0, getpid());
  v2 = (void *)keyboardFocusTarget___focusTarget;
  keyboardFocusTarget___focusTarget = v1;

}

void __44__BKSHIDEventDispatchingTarget_systemTarget__block_invoke()
{
  BKSHIDEventDispatchingTarget *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [BKSHIDEventDispatchingTarget alloc];
  +[BKSHIDEventDeferringEnvironment systemEnvironment](BKSHIDEventDeferringEnvironment, "systemEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[BKSHIDEventDispatchingTarget _initWithEnvironment:token:pid:](v0, "_initWithEnvironment:token:pid:", v3, 0, getpid());
  v2 = (void *)systemTarget___systemTarget;
  systemTarget___systemTarget = v1;

}

@end
