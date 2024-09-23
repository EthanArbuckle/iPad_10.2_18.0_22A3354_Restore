@implementation FBSceneClientHandle

- (RBSProcessHandle)processHandle
{
  return -[FBProcess rbsHandle](self->_legacyProcess, "rbsHandle");
}

- (NSString)bundleIdentifier
{
  return -[FBProcess bundleIdentifier](self->_legacyProcess, "bundleIdentifier");
}

+ (id)handleForScene:(id)a3 clientProcess:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FBSceneClientHandle *v10;
  void *v11;
  uint64_t v12;
  FBSSceneClientIdentity *identity;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSceneClientHandle handleForScene:clientProcess:].cold.1(a2);
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B9150);
  }
  v8 = v7;
  objc_msgSend(v7, "rbsHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[FBScene _isLegacy]((_BOOL8)v6) || v9)
  {
    NSClassFromString(CFSTR("RBSProcessHandle"));
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[FBSceneClientHandle handleForScene:clientProcess:].cold.2(a2);
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35B91B4);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[FBSceneClientHandle handleForScene:clientProcess:].cold.2(a2);
      goto LABEL_17;
    }
  }

  v10 = objc_alloc_init(FBSceneClientHandle);
  if (v10)
  {
    objc_msgSend(v6, "definition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientIdentity");
    v12 = objc_claimAutoreleasedReturnValue();
    identity = v10->_identity;
    v10->_identity = (FBSSceneClientIdentity *)v12;

    objc_storeStrong((id *)&v10->_legacyProcess, a4);
  }

  return v10;
}

- (FBSSceneClientIdentity)identity
{
  return self->_identity;
}

- (id)description
{
  void *v2;
  void *v3;

  -[FBSceneClientHandle processHandle](self, "processHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBProcess)legacyProcess
{
  return self->_legacyProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyProcess, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

+ (void)handleForScene:(const char *)a1 clientProcess:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)handleForScene:(const char *)a1 clientProcess:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
