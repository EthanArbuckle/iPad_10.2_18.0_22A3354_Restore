@implementation FBSProcess

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1)
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_21);
  return (id)currentProcess___CurrentProcess;
}

void __28__FBSProcess_currentProcess__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FBSProcess _initForCurrentProcess]([FBSProcess alloc], "_initForCurrentProcess");
  v1 = (void *)currentProcess___CurrentProcess;
  currentProcess___CurrentProcess = (uint64_t)v0;

}

- (id)_initForCurrentProcess
{
  FBSProcess *v2;
  uint64_t v3;
  BSProcessHandle *handle;
  uint64_t v5;
  RBSProcessIdentity *identity;
  uint64_t v7;
  BSMachPortTaskNameRight *taskNameRight;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FBSProcess;
  v2 = -[FBSProcess init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(off_1E38E9E58, "processHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    handle = v2->_handle;
    v2->_handle = (BSProcessHandle *)v3;

    objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
    v5 = objc_claimAutoreleasedReturnValue();
    identity = v2->_identity;
    v2->_identity = (RBSProcessIdentity *)v5;

    objc_msgSend(off_1E38E9E18, "taskNameForPID:", -[BSProcessHandle pid](v2->_handle, "pid"));
    v7 = objc_claimAutoreleasedReturnValue();
    taskNameRight = v2->_taskNameRight;
    v2->_taskNameRight = (BSMachPortTaskNameRight *)v7;

  }
  return v2;
}

- (FBSProcess)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSProcess *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSProcess *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBSProcess"));
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
    v16 = CFSTR("FBSProcess.m");
    v17 = 1024;
    v18 = 70;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSProcess *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMachPortTaskNameRight invalidate](self->_taskNameRight, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FBSProcess;
  -[FBSProcess dealloc](&v3, sel_dealloc);
}

- (BOOL)isRunning
{
  return -[BSProcessHandle isValid](self->_handle, "isValid");
}

- (int)pid
{
  return -[BSProcessHandle pid](self->_handle, "pid");
}

- (BSProcessHandle)handle
{
  return self->_handle;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)_watchdog:(id)a3 shouldTerminateWithDeclineReason:(id *)a4
{
  return 0;
}

- (id)_watchdog:(id)a3 terminationRequestForViolatedProvision:(id)a4 error:(id)a5
{
  return 0;
}

- (void)_terminateWithRequest:(id)a3 forWatchdog:(id)a4
{
  -[BSProcessHandle pid](self->_handle, "pid", a3, a4);
  getpid();
}

- (NSString)description
{
  return (NSString *)-[FBSProcess descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcess succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  FBSProcess *v4;
  void *v5;
  id v6;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  FBSProcessPrettyDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, 0);

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[FBSProcess isRunning](v4, "isRunning"), CFSTR("running"));
  objc_sync_exit(v4);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcess descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BSMachPortTaskNameRight)taskNameRight
{
  return self->_taskNameRight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskNameRight, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
