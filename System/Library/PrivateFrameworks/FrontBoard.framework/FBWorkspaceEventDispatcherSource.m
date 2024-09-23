@implementation FBWorkspaceEventDispatcherSource

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (id)consumeRemnantsPassingTest:(id)a3
{
  id v4;
  unsigned int (**v5)(_QWORD, _QWORD);
  os_unfair_lock_s *p_lock;
  NSSet *lock_remnants;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSSet *v22;
  NSSet *v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("test"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource consumeRemnantsPassingTest:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35A46CCLL);
  }
  v5 = (unsigned int (**)(_QWORD, _QWORD))v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_remnants = self->_lock_remnants;
  if (!lock_remnants)
  {
    v17 = 0;
    goto LABEL_30;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = lock_remnants;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v9)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v8);
      v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (v5[2](v5, v15))
      {
        if (v11)
        {
          v16 = v11;
LABEL_13:
          objc_msgSend(v16, "addObject:", v15);
          continue;
        }
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v12)
        {
          v16 = v12;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v10);
LABEL_21:

  v18 = (void *)objc_msgSend(v12, "copy");
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  p_lock = &self->_lock;
  if ((BSEqualObjects() & 1) == 0)
  {
    v22 = (NSSet *)objc_msgSend(v21, "copy");
    v23 = self->_lock_remnants;
    self->_lock_remnants = v22;

  }
  v24 = (void *)objc_msgSend(v11, "copy");
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v26;

LABEL_30:
  os_unfair_lock_unlock(p_lock);

  return v17;
}

- (void)noteHandshakeWithRemnants:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSSet *v11;
  NSSet *lock_remnants;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    NSClassFromString(CFSTR("NSSet"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSSetClass]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:].cold.4();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35A51F0);
    }
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        NSClassFromString(CFSTR("FBSceneRemnant"));
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:].cold.2();
          objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35A50D0);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:].cold.2();
          objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A35A5134);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_remnants)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("double handshake detected"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35A518CLL);
  }
  v11 = (NSSet *)objc_msgSend(v5, "copy");
  lock_remnants = self->_lock_remnants;
  self->_lock_remnants = v11;

  os_unfair_lock_unlock(&self->_lock);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_requestsByTargetIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_remnants, 0);
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
}

- (id)_initWithProcessHandle:(id)a3 underlyingAssertion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  FBWorkspaceEventDispatcherSource *v11;
  FBWorkspaceEventDispatcherSource *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("RBSProcessHandle"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:].cold.1();
LABEL_23:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD928);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD98CLL);
  }

  if ((int)objc_msgSend(v9, "rbs_pid") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid on handle=%@"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BD9E8);
  }
  v10 = v8;
  NSClassFromString(CFSTR("BSSimpleAssertion"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BDA4CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSSimpleAssertionClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:].cold.3();
    goto LABEL_23;
  }

  v18.receiver = self;
  v18.super_class = (Class)FBWorkspaceEventDispatcherSource;
  v11 = -[FBWorkspaceEventDispatcherSource init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_processHandle, a3);
    objc_storeStrong((id *)&v12->_underlyingAssertion, a4);
    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)enqueueSceneRequest:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *lock_requestsByTargetIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  NSClassFromString(CFSTR("FBWorkspaceSceneRequest"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F485CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceSceneRequestClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:].cold.1();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F48C0);
  }

  objc_msgSend(v14, "targetIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing targetIdentifier in request : %@"), v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:].cold.2();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F4920);
  }
  v5 = (void *)v4;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_remnants)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempt to enqueue scene request before handshake"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:].cold.3();
    goto LABEL_22;
  }
  -[NSMutableDictionary objectForKey:](self->_lock_requestsByTargetIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "addObject:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    lock_requestsByTargetIdentifier = self->_lock_requestsByTargetIdentifier;
    if (lock_requestsByTargetIdentifier)
    {
      -[NSMutableDictionary setObject:forKey:](lock_requestsByTargetIdentifier, "setObject:forKey:", v7, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v7, v5);
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = self->_lock_requestsByTargetIdentifier;
      self->_lock_requestsByTargetIdentifier = v9;

    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)dequeueSceneRequestsForTargetIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *lock_requestsByTargetIdentifier;
  void *v9;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource dequeueSceneRequestsForTargetIdentifier:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35F4A9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceEventDispatcherSource dequeueSceneRequestsForTargetIdentifier:].cold.1();
    goto LABEL_13;
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_requestsByTargetIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[NSMutableDictionary count](self->_lock_requestsByTargetIdentifier, "count");
    lock_requestsByTargetIdentifier = self->_lock_requestsByTargetIdentifier;
    if (v6 == 1)
    {
      self->_lock_requestsByTargetIdentifier = 0;

    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](lock_requestsByTargetIdentifier, "removeObjectForKey:", v4);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (FBWorkspaceEventDispatcherSource)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBWorkspaceEventDispatcherSource *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBWorkspaceEventDispatcherSource *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBWorkspaceEventDispatcherSource"));
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
    v16 = CFSTR("FBWorkspaceEventDispatcherSource.m");
    v17 = 1024;
    v18 = 136;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBWorkspaceEventDispatcherSource *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)invalidate
{
  NSSet *v3;
  NSSet *lock_remnants;
  NSMutableDictionary *v5;
  NSMutableDictionary *lock_requestsByTargetIdentifier;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  NSSet *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[BSSimpleAssertion invalidate](self->_underlyingAssertion, "invalidate");
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_lock_remnants;
  lock_remnants = self->_lock_remnants;
  self->_lock_remnants = 0;

  v5 = self->_lock_requestsByTargetIdentifier;
  lock_requestsByTargetIdentifier = self->_lock_requestsByTargetIdentifier;
  self->_lock_requestsByTargetIdentifier = 0;

  os_unfair_lock_unlock(&self->_lock);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v3;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "invalidate");
      }
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }
  v24 = v7;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary objectEnumerator](v5, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          do
          {
            for (k = 0; k != v19; ++k)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
              FBSWorkspaceErrorCreate();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "invalidateWithError:", v23);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v19);
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v13);
  }

}

- (void)_initWithProcessHandle:underlyingAssertion:.cold.1()
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

- (void)_initWithProcessHandle:underlyingAssertion:.cold.2()
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

- (void)_initWithProcessHandle:underlyingAssertion:.cold.3()
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

- (void)noteHandshakeWithRemnants:.cold.1()
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

- (void)noteHandshakeWithRemnants:.cold.2()
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

- (void)noteHandshakeWithRemnants:.cold.4()
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

- (void)consumeRemnantsPassingTest:.cold.1()
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

- (void)enqueueSceneRequest:.cold.1()
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

- (void)enqueueSceneRequest:.cold.2()
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

- (void)enqueueSceneRequest:.cold.3()
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

- (void)dequeueSceneRequestsForTargetIdentifier:.cold.1()
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

@end
