@implementation FBWaitForSceneDestructionTransaction

- (FBWaitForSceneDestructionTransaction)initWithScene:(id)a3
{
  id v6;
  void *v7;
  FBWaitForSceneDestructionTransaction *v8;
  FBWaitForSceneDestructionTransaction *v9;
  FBWaitForSceneDestructionTransaction *result;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)FBWaitForSceneDestructionTransaction;
    v8 = -[FBTransaction init](&v12, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_sceneToWaitForDeath, a3);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWaitForSceneDestructionTransaction initWithScene:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (FBWaitForSceneDestructionTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[FBScene removeObserver:](self->_sceneToWaitForDeath, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)FBWaitForSceneDestructionTransaction;
  -[FBWaitForSceneDestructionTransaction dealloc](&v3, sel_dealloc);
}

- (void)_begin
{
  objc_super v3;

  if (-[FBScene isValid](self->_sceneToWaitForDeath, "isValid"))
  {
    -[FBWaitForSceneDestructionTransaction addMilestone:](self, "addMilestone:", CFSTR("SBWTMilestoneSceneDestruction"));
    -[FBScene addObserver:](self->_sceneToWaitForDeath, "addObserver:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)FBWaitForSceneDestructionTransaction;
  -[FBWaitForSceneDestructionTransaction _begin](&v3, sel__begin);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  objc_super v3;

  -[FBScene removeObserver:](self->_sceneToWaitForDeath, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)FBWaitForSceneDestructionTransaction;
  -[FBWaitForSceneDestructionTransaction _didComplete](&v3, sel__didComplete);
}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene succinctDescription](self->_sceneToWaitForDeath, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Scene"));

  return v3;
}

- (void)sceneDidInvalidate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_sceneToWaitForDeath == a3)
  {
    objc_msgSend(a3, "removeObserver:", self);
    -[FBWaitForSceneDestructionTransaction queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__FBWaitForSceneDestructionTransaction_sceneDidInvalidate___block_invoke;
    block[3] = &unk_1E4A12348;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __59__FBWaitForSceneDestructionTransaction_sceneDidInvalidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "satisfyMilestone:", CFSTR("SBWTMilestoneSceneDestruction"));
}

- (FBScene)scene
{
  return self->_sceneToWaitForDeath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneToWaitForDeath, 0);
}

- (void)initWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("FBWaitForSceneDestructionTransaction.m");
  v16 = 1024;
  v17 = 31;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
