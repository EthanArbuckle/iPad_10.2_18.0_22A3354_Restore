@implementation FBWorkspaceSceneRequest

- (FBWorkspaceSceneRequest)init
{
  return -[FBWorkspaceSceneRequest initWithTargetIdentifier:](self, "initWithTargetIdentifier:", 0);
}

- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3
{
  id v4;
  FBWorkspaceSceneRequest *v5;
  uint64_t v6;
  NSString *targetIdentifier;
  FBWorkspaceSceneRequest *result;
  void *v9;
  objc_super v10;

  v4 = a3;
  if (v4 && (NSClassFromString(CFSTR("NSString")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceSceneRequest initWithTargetIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (FBWorkspaceSceneRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v10.receiver = self;
    v10.super_class = (Class)FBWorkspaceSceneRequest;
    v5 = -[FBWorkspaceSceneRequest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      targetIdentifier = v5->_targetIdentifier;
      v5->_targetIdentifier = (NSString *)v6;

      v5->_lock._os_unfair_lock_opaque = 0;
    }

    return v5;
  }
  return result;
}

- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  FBWorkspaceSceneRequest *v12;
  FBWorkspaceSceneRequest *v13;
  uint64_t v14;
  id lock_completion;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (v11)
  {
    NSClassFromString(CFSTR("FBSWorkspaceSceneRequestOptions"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSWorkspaceSceneRequestOptionsClass]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceSceneRequest initWithTargetIdentifier:options:completion:].cold.2();
LABEL_12:
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35E2D6CLL);
    }
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceSceneRequest initWithTargetIdentifier:options:completion:].cold.1();
    goto LABEL_12;
  }
  v12 = -[FBWorkspaceSceneRequest initWithTargetIdentifier:](self, "initWithTargetIdentifier:", v8);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a4);
    v14 = objc_msgSend(v10, "copy");
    lock_completion = v13->_lock_completion;
    v13->_lock_completion = (id)v14;

  }
  return v13;
}

- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  FBWorkspaceSceneRequest *v10;
  uint64_t v11;
  NSSet *actions;
  uint64_t v13;
  id lock_completion;

  v8 = a4;
  v9 = a5;
  v10 = -[FBWorkspaceSceneRequest initWithTargetIdentifier:](self, "initWithTargetIdentifier:", a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    actions = v10->_actions;
    v10->_actions = (NSSet *)v11;

    v13 = objc_msgSend(v9, "copy");
    lock_completion = v10->_lock_completion;
    v10->_lock_completion = (id)v13;

  }
  return v10;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (BOOL)requiresModernDispatcher
{
  return (-[FBSWorkspaceSceneRequestOptions isClientFuture](self->_options, "isClientFuture") & 1) != 0
      || self->_actions != 0;
}

- (BOOL)requiresTargetPreregistration
{
  return !-[FBWorkspaceSceneRequest requiresModernDispatcher](self, "requiresModernDispatcher");
}

- (void)observeScene:(id)a3
{
  void *v4;
  const void *v5;
  id object;

  object = a3;
  if (objc_msgSend(object, "isValid") && (objc_msgSend(object, "isActive") & 1) == 0)
  {
    objc_msgSend(object, "addObserver:", self);
    v5 = (const void *)objc_opt_class();
    objc_setAssociatedObject(object, v5, self, (void *)1);
  }
  else if (objc_msgSend(object, "isActive"))
  {
    -[FBWorkspaceSceneRequest respondWithScene:](self, "respondWithScene:", object);
  }
  else
  {
    FBSceneErrorCreate(2uLL, CFSTR("scene already invalidated"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBWorkspaceSceneRequest invalidateWithError:](self, "invalidateWithError:", v4);

  }
}

- (void)respondWithScene:(id)a3
{
  id v4;
  NSSet *actions;
  void *v6;
  id v7;

  v4 = a3;
  actions = self->_actions;
  v7 = v4;
  if (v7 || !actions)
  {
    NSClassFromString(CFSTR("FBScene"));
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneClass]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceSceneRequest respondWithScene:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceSceneRequest respondWithScene:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E3114);
  }
LABEL_5:

  -[FBWorkspaceSceneRequest _respondWithScene:error:](self, "_respondWithScene:error:", v7, 0);
}

- (void)invalidateWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  NSClassFromString(CFSTR("NSError"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceSceneRequest invalidateWithError:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35E3258);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSErrorClass]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceSceneRequest invalidateWithError:].cold.1();
    goto LABEL_9;
  }

  -[FBWorkspaceSceneRequest _respondWithScene:error:](self, "_respondWithScene:error:", 0, v5);
}

- (void)_respondWithScene:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _BOOL4 lock_responded;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id lock_completion;
  NSObject *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_responded = self->_lock_responded;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8590C4C](self->_lock_completion);
  lock_completion = self->_lock_completion;
  self->_lock_completion = 0;

  self->_lock_responded = 1;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_responded)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempt to respond to previously invalidated request with scene=%@ error=%@"), v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceSceneRequest _respondWithScene:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    if (v7)
    {
      FBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FBWorkspaceSceneRequest _respondWithScene:error:].cold.1((uint64_t)self, v7, v11);

    }
    if (v9)
      ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

  }
}

- (void)sceneDidActivate:(id)a3
{
  const void *v4;
  id object;

  object = a3;
  -[FBWorkspaceSceneRequest respondWithScene:](self, "respondWithScene:", object);
  objc_msgSend(object, "removeObserver:", self);
  v4 = (const void *)objc_opt_class();
  objc_setAssociatedObject(object, v4, 0, (void *)1);

}

- (void)sceneDidInvalidate:(id)a3
{
  void *v4;
  const void *v5;
  id object;

  object = a3;
  FBSceneErrorCreate(2uLL, CFSTR("scene explicitly invalidated"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBWorkspaceSceneRequest invalidateWithError:](self, "invalidateWithError:", v4);

  objc_msgSend(object, "removeObserver:", self);
  v5 = (const void *)objc_opt_class();
  objc_setAssociatedObject(object, v5, 0, (void *)1);

}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (FBSWorkspaceSceneRequestOptions)options
{
  return self->_options;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong(&self->_lock_completion, 0);
}

- (void)initWithTargetIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTargetIdentifier:options:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTargetIdentifier:options:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)respondWithScene:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)invalidateWithError:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)_respondWithScene:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 24);
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1A359A000, a3, OS_LOG_TYPE_ERROR, "Request for workspace \"%{public}@\" failed: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)_respondWithScene:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
