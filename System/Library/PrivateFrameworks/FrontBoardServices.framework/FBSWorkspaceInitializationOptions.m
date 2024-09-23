@implementation FBSWorkspaceInitializationOptions

- (BOOL)_startsInactive
{
  return self->_startsInactive;
}

- (void)setCallOutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callOutQueue, a3);
}

- (FBSWorkspaceDelegate)delegate
{
  return self->_delegate;
}

- (FBSSerialQueue)callOutQueue
{
  return self->_callOutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

+ (id)optionsWithDelegate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[FBSWorkspaceInitializationOptions _initWithDelegate:]([FBSWorkspaceInitializationOptions alloc], "_initWithDelegate:", v3);

  return v4;
}

- (id)_initWithDelegate:(id)a3
{
  id v6;
  void *v7;
  FBSWorkspaceInitializationOptions *v8;
  FBSWorkspaceInitializationOptions *v9;
  id result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)FBSWorkspaceInitializationOptions;
    v8 = -[FBSWorkspaceInitializationOptions init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_delegate, a3);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSWorkspaceInitializationOptions _initWithDelegate:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSWorkspaceInitializationOptions)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSWorkspaceInitializationOptions *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSWorkspaceInitializationOptions *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on FBSWorkspaceInitializationOptions"));
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
    v16 = CFSTR("FBSWorkspaceInitializationOptions.m");
    v17 = 1024;
    v18 = 17;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSWorkspaceInitializationOptions *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_setStartsInactive:(BOOL)a3
{
  self->_startsInactive = a3;
}

- (void)_initWithDelegate:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSWorkspaceInitializationOptions.m");
  v16 = 1024;
  v17 = 22;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
