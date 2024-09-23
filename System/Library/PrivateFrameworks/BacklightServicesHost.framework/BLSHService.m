@implementation BLSHService

+ (void)earlyInitialization
{
  objc_msgSend(MEMORY[0x24BE0B988], "setIsHostProcess:", 1);
}

+ (id)startServiceWithPlatformProvider:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id result;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a1, "startServiceWithPlatformProvider:localOnly:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("platformProvider != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHService startServiceWithPlatformProvider:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)startLocalOnlyServiceWithConfiguration:(id)a3
{
  id v4;
  BLSHLocalOnlySimplePlatformProvider *v5;
  void *v6;

  v4 = a3;
  if (!v4)
    v4 = (id)objc_opt_new();
  v5 = -[BLSHLocalOnlySimplePlatformProvider initWithConfiguration:]([BLSHLocalOnlySimplePlatformProvider alloc], "initWithConfiguration:", v4);
  objc_msgSend(MEMORY[0x24BE0B988], "setIsHostProcess:", 1);
  objc_msgSend(a1, "startServiceWithPlatformProvider:localOnly:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)startServiceWithPlatformProvider:(id)a3 localOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id result;
  void *v10;

  v4 = a4;
  v7 = a3;
  os_unfair_lock_lock(&_classLock_2);
  if (_sharedService)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("only one BLSHService can be registered"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHService startServiceWithPlatformProvider:localOnly:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlatformProvider:localOnly:", v7, v4);
    objc_storeStrong((id *)&_sharedService, v8);
    os_unfair_lock_unlock(&_classLock_2);

    return v8;
  }
  return result;
}

+ (id)sharedService
{
  id v3;
  id result;
  void *v5;

  os_unfair_lock_lock(&_classLock_2);
  v3 = (id)_sharedService;
  os_unfair_lock_unlock(&_classLock_2);
  if (v3)
    return v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[BLSHService sharedService] should not be called before startServiceWithPlatformProvider:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[BLSHService sharedService].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BLSHService)initWithPlatformProvider:(id)a3 localOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  BLSHService *v8;
  BLSHService *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  BLSHBacklightOSInterfaceProvider *v14;
  BLSHBacklightOSInterfaceProvider *osInterfaceProvider;
  uint64_t v16;
  BLSHAssertionService *assertionService;
  BLSHInactiveBudgetPolicy *v18;
  BLSHInactiveBudgetPolicing *inactiveBudgetPolicy;
  BLSHInactiveBudgetPolicy *v20;
  BLSHBacklightOSInterfaceProvider *v21;
  void *v22;
  BLSHBacklightOSInterfaceProvider *v23;
  void *v24;
  uint64_t v25;
  BLSHBacklightService *backlightService;
  BLSHDefaultsObserver *v27;
  BLSHDefaultsObserver *defaultsObserver;
  objc_super v30;

  v4 = a4;
  v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BLSHService;
  v8 = -[BLSHService init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_platformProvider, a3);
    objc_msgSend(v7, "backlightPlatformProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();
    v12 = v7;
    if ((v11 & 1) != 0 || (v13 = objc_opt_respondsToSelector(), v12 = v10, (v13 & 1) != 0))
      objc_msgSend(v12, "serviceInitializing:", v9);
    v14 = -[BLSHBacklightOSInterfaceProvider initWithPlatformProvider:]([BLSHBacklightOSInterfaceProvider alloc], "initWithPlatformProvider:", v10);
    osInterfaceProvider = v9->_osInterfaceProvider;
    v9->_osInterfaceProvider = v14;

    +[BLSHBacklightOSInterfaceProvider setSharedProvider:](BLSHBacklightOSInterfaceProvider, "setSharedProvider:", v9->_osInterfaceProvider);
    +[BLSHAssertionService serviceWithOSInterfaceProvider:localOnly:](BLSHAssertionService, "serviceWithOSInterfaceProvider:localOnly:", v9->_osInterfaceProvider, v4);
    v16 = objc_claimAutoreleasedReturnValue();
    assertionService = v9->_assertionService;
    v9->_assertionService = (BLSHAssertionService *)v16;

    v18 = -[BLSHInactiveBudgetPolicy initWithOSInterfaceProvider:]([BLSHInactiveBudgetPolicy alloc], "initWithOSInterfaceProvider:", v9->_osInterfaceProvider);
    inactiveBudgetPolicy = v9->_inactiveBudgetPolicy;
    v9->_inactiveBudgetPolicy = (BLSHInactiveBudgetPolicing *)v18;
    v20 = v18;

    v21 = v9->_osInterfaceProvider;
    -[BLSHAssertionService localAssertionService](v9->_assertionService, "localAssertionService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHBacklightOSInterfaceProvider registerHandlersForService:](v21, "registerHandlersForService:", v22);

    v23 = v9->_osInterfaceProvider;
    -[BLSHAssertionService localAssertionService](v9->_assertionService, "localAssertionService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLSHBacklightService serviceWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:localAssertionService:localOnly:](BLSHBacklightService, "serviceWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:localAssertionService:localOnly:", v10, v23, v20, v24, v4);
    v25 = objc_claimAutoreleasedReturnValue();
    backlightService = v9->_backlightService;
    v9->_backlightService = (BLSHBacklightService *)v25;

    v27 = objc_alloc_init(BLSHDefaultsObserver);
    defaultsObserver = v9->_defaultsObserver;
    v9->_defaultsObserver = v27;

  }
  return v9;
}

- (BOOL)deviceSupportsAlwaysOn
{
  return -[BLSHBacklightOSInterfaceProvider deviceSupportsAlwaysOn](self->_osInterfaceProvider, "deviceSupportsAlwaysOn");
}

- (BLSHLocalAssertionService)localAssertionService
{
  return -[BLSHAssertionService localAssertionService](self->_assertionService, "localAssertionService");
}

- (void)registerSceneWorkspace:(id)a3
{
  -[BLSHBacklightOSInterfaceProvider registerSceneWorkspace:](self->_osInterfaceProvider, "registerSceneWorkspace:", a3);
}

- (void)deregisterSceneWorkspace:(id)a3
{
  -[BLSHBacklightOSInterfaceProvider deregisterSceneWorkspace:](self->_osInterfaceProvider, "deregisterSceneWorkspace:", a3);
}

- (void)beginSpecialManagementForHostEnvironment:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  bls_backlight_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[BLSHService beginSpecialManagementForHostEnvironment:].cold.1((uint64_t)self, v4, v5);

}

- (BLSHServicePlatformProvider)platformProvider
{
  return self->_platformProvider;
}

- (BLSHInactiveBudgetPolicing)inactiveBudgetPolicy
{
  return self->_inactiveBudgetPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_platformProvider, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_backlightService, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_assertionService, 0);
}

+ (void)startServiceWithPlatformProvider:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)startServiceWithPlatformProvider:(const char *)a1 localOnly:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)sharedService
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)beginSpecialManagementForHostEnvironment:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_2145AC000, a3, OS_LOG_TYPE_ERROR, "%p beginSpecialManagementForHostEnvironment:%{public}@ is no longer necessary", (uint8_t *)&v6, 0x16u);

}

@end
