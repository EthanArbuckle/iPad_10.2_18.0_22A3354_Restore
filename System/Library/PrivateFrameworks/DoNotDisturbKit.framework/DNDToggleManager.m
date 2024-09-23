@implementation DNDToggleManager

+ (id)managerForClientIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BE2D678];
  v5 = a3;
  objc_msgSend(v4, "serviceForClientIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2D738], "serviceForClientIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModeAssertionService:stateService:", v6, v7);
  return v8;
}

- (DNDToggleManager)initWithModeAssertionService:(id)a3 stateService:(id)a4
{
  id v7;
  id v8;
  DNDToggleManager *v9;
  DNDToggleManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDToggleManager;
  v9 = -[DNDToggleManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modeAssertionService, a3);
    objc_storeStrong((id *)&v10->_stateService, a4);
    -[DNDToggleManager setToggleAssertionIdentifier:](v10, "setToggleAssertionIdentifier:", 0);
  }

  return v10;
}

- (void)setToggleAssertionIdentifier:(id)a3
{
  __CFString *v4;
  NSString *v5;
  NSString *toggleAssertionIdentifier;
  __CFString *v7;

  v4 = CFSTR("com.apple.donotdisturb.toggle-manager");
  if (a3)
    v4 = (__CFString *)a3;
  v7 = v4;
  if (!-[NSString isEqualToString:](self->_toggleAssertionIdentifier, "isEqualToString:"))
  {
    v5 = (NSString *)-[__CFString copy](v7, "copy");
    toggleAssertionIdentifier = self->_toggleAssertionIdentifier;
    self->_toggleAssertionIdentifier = v5;

  }
}

- (BOOL)toggleToTargetState:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)DNDLogToggleManager;
  if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    DNDStringFromToggleTargetState(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_21314A000, v8, OS_LOG_TYPE_DEFAULT, "Toggling DND: targetState=%{public}@", (uint8_t *)&v15, 0xCu);

  }
  if (!a3)
  {
    -[DNDStateService queryCurrentStateWithError:](self->_stateService, "queryCurrentStateWithError:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isActive"))
      a3 = 1;
    else
      a3 = 2;
    v11 = (void *)DNDLogToggleManager;
    if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      DNDStringFromToggleTargetState(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_21314A000, v12, OS_LOG_TYPE_DEFAULT, "Resolved target state: targetState=%{public}@, currentState=%{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  if (a3 == 1)
    return -[DNDToggleManager _toggleDNDOffReturningError:](self, "_toggleDNDOffReturningError:", a4);
  if (a3 == 2)
    return -[DNDToggleManager _toggleDNDOnReturningError:](self, "_toggleDNDOnReturningError:", a4);
  return 0;
}

- (BOOL)_toggleDNDOnReturningError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  DNDModeAssertionService *modeAssertionService;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = DNDLogToggleManager;
  if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21314A000, v5, OS_LOG_TYPE_DEFAULT, "Taking toggle assertion", buf, 2u);
  }
  v6 = objc_alloc_init(MEMORY[0x24BE2D700]);
  -[DNDToggleManager toggleAssertionIdentifier](self, "toggleAssertionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v7);

  objc_msgSend(MEMORY[0x24BE2D670], "lifetimeUntilEndOfScheduleWithIdentifier:", *MEMORY[0x24BE2D5C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLifetime:", v8);

  modeAssertionService = self->_modeAssertionService;
  v20 = 0;
  -[DNDModeAssertionService takeModeAssertionWithDetails:error:](modeAssertionService, "takeModeAssertionWithDetails:error:", v6, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = DNDLogToggleManager;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_21314A000, v12, OS_LOG_TYPE_DEFAULT, "Successfully took toggle assertion; assertion=%{public}@",
        buf,
        0xCu);
      if (!a3)
        goto LABEL_11;
      goto LABEL_9;
    }
LABEL_8:
    if (!a3)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_ERROR))
    goto LABEL_8;
  -[DNDToggleManager _toggleDNDOnReturningError:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
  if (!a3)
    goto LABEL_11;
LABEL_9:
  if (v11)
    *a3 = objc_retainAutorelease(v11);
LABEL_11:

  return v10 != 0;
}

- (BOOL)_toggleDNDOffReturningError:(id *)a3
{
  NSObject *v5;
  DNDModeAssertionService *modeAssertionService;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v17[8];
  id v18;
  uint8_t buf[16];

  v5 = DNDLogToggleManager;
  if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21314A000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating all assertions for toggle", buf, 2u);
  }
  modeAssertionService = self->_modeAssertionService;
  v18 = 0;
  v7 = -[DNDModeAssertionService invalidateAllActiveModeAssertionsWithError:](modeAssertionService, "invalidateAllActiveModeAssertionsWithError:", &v18);
  v8 = v18;
  v9 = DNDLogToggleManager;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21314A000, v9, OS_LOG_TYPE_DEFAULT, "Successfully invalidated all assertions", v17, 2u);
      if (!a3)
        goto LABEL_11;
      goto LABEL_9;
    }
LABEL_8:
    if (!a3)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogToggleManager, OS_LOG_TYPE_ERROR))
    goto LABEL_8;
  -[DNDToggleManager _toggleDNDOffReturningError:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
  if (!a3)
    goto LABEL_11;
LABEL_9:
  if (v8)
    *a3 = objc_retainAutorelease(v8);
LABEL_11:

  return v7;
}

- (NSString)toggleAssertionIdentifier
{
  return self->_toggleAssertionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
  objc_storeStrong((id *)&self->_modeAssertionService, 0);
}

- (void)_toggleDNDOnReturningError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21314A000, a2, a3, "Unable to take toggle assertion; error=%{public}@", a5, a6, a7, a8, 2u);
}

- (void)_toggleDNDOffReturningError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21314A000, a2, a3, "Unable to invalidate all assertions; error=%{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
