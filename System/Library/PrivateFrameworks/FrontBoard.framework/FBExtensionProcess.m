@implementation FBExtensionProcess

- (void)_finishInit
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
  v15 = CFSTR("FBExtensionProcess.m");
  v16 = 1024;
  v17 = 28;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (FBProcess)hostProcess
{
  os_unfair_lock_s *p_hostProcessLock;
  FBProcess *lock_hostProcess;
  void *v5;
  FBProcess *v6;
  FBProcess *v7;
  FBProcess *v8;

  p_hostProcessLock = &self->_hostProcessLock;
  os_unfair_lock_lock(&self->_hostProcessLock);
  lock_hostProcess = self->_lock_hostProcess;
  if (!lock_hostProcess)
  {
    if (self->_hostPID < 1)
    {
      lock_hostProcess = 0;
    }
    else
    {
      +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processForPID:", self->_hostPID);
      v6 = (FBProcess *)objc_claimAutoreleasedReturnValue();
      v7 = self->_lock_hostProcess;
      self->_lock_hostProcess = v6;

      lock_hostProcess = self->_lock_hostProcess;
    }
  }
  v8 = lock_hostProcess;
  os_unfair_lock_unlock(p_hostProcessLock);
  return v8;
}

- (BOOL)isExtensionProcess
{
  return 1;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBExtensionProcess;
  -[FBProcess succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSExtensionInfo typeIdentifier](self->_extensionInfo, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("typeID"), 1);

  return v3;
}

- (FBSExtensionInfo)extensionInfo
{
  return self->_extensionInfo;
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_hostProcess, 0);
  objc_storeStrong((id *)&self->_extensionInfo, 0);
}

@end
