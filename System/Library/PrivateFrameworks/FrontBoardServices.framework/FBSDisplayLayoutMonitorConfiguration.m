@implementation FBSDisplayLayoutMonitorConfiguration

- (void)setTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)transitionHandler
{
  return self->_transitionHandler;
}

- (BOOL)needsUserInteractivePriority
{
  return self->_needsUserInteractivePriority;
}

- (BSServiceConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

+ (id)configurationForDefaultMainDisplayMonitor
{
  FBSDisplayLayoutMonitorConfiguration *v2;
  void *v3;
  id v4;

  v2 = [FBSDisplayLayoutMonitorConfiguration alloc];
  +[FBSDisplayLayoutMonitor _endpointForDisplayType:](FBSDisplayLayoutMonitor, "_endpointForDisplayType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FBSDisplayLayoutMonitorConfiguration _initWithEndpoint:](v2, "_initWithEndpoint:", v3);

  return v4;
}

- (id)_initWithEndpoint:(id)a3
{
  id v5;
  FBSDisplayLayoutMonitorConfiguration *v6;
  FBSDisplayLayoutMonitorConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSDisplayLayoutMonitorConfiguration;
  v6 = -[FBSDisplayLayoutMonitorConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_endpoint, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionHandler, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (FBSDisplayLayoutMonitorConfiguration)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSDisplayLayoutMonitorConfiguration *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSDisplayLayoutMonitorConfiguration *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBSDisplayLayoutMonitorConfiguration"));
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
    v16 = CFSTR("FBSDisplayLayoutMonitor.m");
    v17 = 1024;
    v18 = 355;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSDisplayLayoutMonitorConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)configurationWithEndpoint:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v9;
  void *v10;

  v3 = a3;
  NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71DE94);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71DEF8);
  }

  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSDisplayLayoutMonitor serviceIdentifier](FBSDisplayLayoutMonitor, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("service identifier of endpoint is mismatched : endpoint=%@"), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:].cold.2();
    goto LABEL_13;
  }
  v7 = -[FBSDisplayLayoutMonitorConfiguration _initWithEndpoint:]([FBSDisplayLayoutMonitorConfiguration alloc], "_initWithEndpoint:", v3);

  return v7;
}

- (void)setNeedsUserInteractivePriority:(BOOL)a3
{
  self->_needsUserInteractivePriority = a3;
}

+ (void)configurationWithEndpoint:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)configurationWithEndpoint:.cold.2()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
