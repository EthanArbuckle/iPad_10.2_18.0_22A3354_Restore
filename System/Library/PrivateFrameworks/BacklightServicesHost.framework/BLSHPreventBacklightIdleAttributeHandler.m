@implementation BLSHPreventBacklightIdleAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForService:provider:", v7, v6);

  objc_msgSend(v8, "setupService");
  return v8;
}

- (id)initForService:(id)a3 provider:(id)a4
{
  id v6;
  id *v7;
  id *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BLSHPreventBacklightIdleAttributeHandler;
  v7 = -[BLSHLocalCountingAssertionAttributeHandler initForService:](&v10, sel_initForService_, a3);
  v8 = v7;
  if (v7)
  {
    *((_DWORD *)v7 + 12) = 0;
    objc_storeWeak(v7 + 7, v6);
  }

  return v8;
}

+ (id)attributeClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)typeForEntry:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unsigned int v6;
  int64_t v7;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "attribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[attribute isKindOfClass:[BLSPreventBacklightIdleAttribute class]]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHPreventBacklightIdleAttributeHandler typeForEntry:].cold.2();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145B7EBCLL);
  }
  v5 = objc_msgSend(v4, "clearUserInteraction");
  v6 = objc_msgSend(v4, "restartTimerOnInvalidation");
  if (!v5)
  {
    v7 = v6;
    goto LABEL_6;
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[attribute restartTimerOnInvalidation]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHPreventBacklightIdleAttributeHandler typeForEntry:].cold.1();
    goto LABEL_12;
  }
  v7 = 2;
LABEL_6:

  return v7;
}

- (id)countingTargetForEntry:(id)a3
{
  unint64_t v3;
  void *v4;

  v3 = -[BLSHPreventBacklightIdleAttributeHandler typeForEntry:](self, "typeForEntry:", a3);
  if (v3 <= 2)
  {
    NSStringFromSelector(*off_24D1BC288[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)activateWithFirstEntry:(id)a3
{
  -[BLSHPreventBacklightIdleAttributeHandler activate:withEntry:](self, "activate:withEntry:", 1, a3);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  -[BLSHPreventBacklightIdleAttributeHandler activate:withEntry:](self, "activate:withEntry:", 0, a3);
}

- (void)activate:(BOOL)a3 withEntry:(id)a4
{
  _BOOL4 v4;
  id v6;
  int64_t v7;
  os_unfair_lock_s *p_lock;
  BOOL *active;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id WeakRetained;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[BLSHPreventBacklightIdleAttributeHandler typeForEntry:](self, "typeForEntry:", v6);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  active = self->_active;
  if (self->_active[v7] != !v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_active[type] == !isActivate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHPreventBacklightIdleAttributeHandler activate:withEntry:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145B823CLL);
  }
  v22 = v6;
  v10 = self->_active[2];
  v11 = (self->_active[1] | v10);
  v12 = *active | v11;
  active[v7] = v4;
  v13 = self->_active[2];
  v14 = (self->_active[1] | v13);
  v15 = *active | v14;
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  os_unfair_lock_unlock(p_lock);
  bls_backlight_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v18)
    {
      *(_DWORD *)buf = 67109888;
      v24 = v12;
      v25 = 1024;
      v26 = v15;
      v27 = 1024;
      v28 = v11;
      v29 = 1024;
      v30 = v14;
      _os_log_debug_impl(&dword_2145AC000, v17, OS_LOG_TYPE_DEBUG, "received first assertion acquired event oldPreventIdle=%{BOOL}u preventIdle=%{BOOL}u oldRestartTimer=%{BOOL}u restartTimer=%{BOOL}u", buf, 0x1Au);
    }

    if (v12 != v15)
      -[BLSHBacklightIdleProvider setSuppressed:]((uint64_t)WeakRetained, 1);
    v19 = v22;
    if (v11 != v14)
      objc_msgSend(WeakRetained, "setSuspended:", 1);
  }
  else
  {
    v20 = v12;
    if (v18)
    {
      *(_DWORD *)buf = 67110400;
      v24 = v10;
      v25 = 1024;
      v26 = v13;
      v27 = 1024;
      v28 = v11;
      v29 = 1024;
      v30 = v14;
      v31 = 1024;
      v32 = v12;
      v33 = 1024;
      v34 = v15;
      _os_log_debug_impl(&dword_2145AC000, v17, OS_LOG_TYPE_DEBUG, "received last assertion dropped event oldClearUserInteraction=%{BOOL}u clearUserInteraction=%{BOOL}u  oldRestartTimer=%{BOOL}u restartTimer=%{BOOL}u  oldPreventIdle=%{BOOL}u preventIdle=%{BOOL}u", buf, 0x26u);
    }

    v19 = v22;
    if (v10 != v13)
      objc_msgSend(WeakRetained, "reset");
    if (v11 != v14)
      objc_msgSend(WeakRetained, "setSuspended:", 0);
    if (v20 != v15)
      -[BLSHBacklightIdleProvider setSuppressed:]((uint64_t)WeakRetained, 0);
  }

}

- (BLSHBacklightIdleProvider)provider
{
  return (BLSHBacklightIdleProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
}

- (void)typeForEntry:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
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

- (void)typeForEntry:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
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

- (void)activate:withEntry:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
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

@end
