@implementation FBMutableWorkspaceConnectionsState

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBWorkspaceConnectionsState _initWithIndexSet:]([FBWorkspaceConnectionsState alloc], "_initWithIndexSet:", self->super._pidSet);
}

- (BOOL)addProcessIdentifier:(id)a3
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  char v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBMutableWorkspaceConnectionsState addProcessIdentifier:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BE04CLL);
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "rbs_pid");
  if (v7 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBMutableWorkspaceConnectionsState addProcessIdentifier:].cold.2(a2);
    goto LABEL_11;
  }
  v8 = v7;
  v9 = -[NSMutableIndexSet containsIndex:](self->super._pidSet, "containsIndex:", v7);
  if ((v9 & 1) == 0)
    -[NSMutableIndexSet addIndex:](self->super._pidSet, "addIndex:", v8);

  return v9 ^ 1;
}

- (void)addProcessIdentifier:(const char *)a1 .cold.1(const char *a1)
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

- (void)addProcessIdentifier:(const char *)a1 .cold.2(const char *a1)
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

@end
