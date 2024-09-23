@implementation BLSHAssertionPausingSceneObserver

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)-[BLSHAssertionPausingSceneObserver initForAttribute:fromAssertion:forService:]((id *)[BLSHAssertionPausingSceneObserver alloc], v10, v9, v8);

  return v11;
}

- (uint64_t)initForAttribute:(void *)a3 fromAssertion:(void *)a4 forService:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t result;
  void *v12;
  id v13;
  objc_super v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_5;
  v14.receiver = a1;
  v14.super_class = (Class)BLSHAssertionPausingSceneObserver;
  v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v10;
  if (!v10)
    goto LABEL_5;
  *((_DWORD *)v10 + 4) = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeWeak(a1 + 5, v7);
    objc_storeWeak(a1 + 3, v8);
    objc_storeWeak(a1 + 4, v9);
    *((_BYTE *)a1 + 21) = 0;
    v13 = v7;
    a1 = a1;
    BSDispatchMain();

LABEL_5:
    return (uint64_t)a1;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BLSPauseWhenSceneBackgroundAttribute not class for %@"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHAssertionPausingSceneObserver initForAttribute:fromAssertion:forService:].cold.1(sel_initForAttribute_fromAssertion_forService_);
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

void __79__BLSHAssertionPausingSceneObserver_initForAttribute_fromAssertion_forService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  +[BLSHBacklightOSInterfaceProvider sharedProvider](BLSHBacklightOSInterfaceProvider, "sharedProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sceneIdentityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneWithIdentityToken:", v3);
  obj = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 20))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
  }
  else
  {
    objc_storeWeak((id *)(v4 + 8), obj);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(obj, "addObserver:", *(_QWORD *)(a1 + 40));
    -[BLSHAssertionPausingSceneObserver updateAssertionPauseStateForScene:](*(_QWORD *)(a1 + 40), obj);
  }

}

- (void)updateAssertionPauseStateForScene:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  int v8;
  os_unfair_lock_s *v9;
  int v10;
  int v11;
  NSObject *v12;
  id WeakRetained;
  id v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isForeground");
    v7 = v6;
    v8 = v6 ^ 1;

    v9 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v10 = *(unsigned __int8 *)(a1 + 20);
    v11 = *(unsigned __int8 *)(a1 + 21);
    bls_assertions_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "settings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v18 = a1;
      v19 = 1024;
      v20 = v10;
      v21 = 1024;
      v22 = v11 != v8;
      v23 = 1024;
      v24 = v8;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_debug_impl(&dword_2145AC000, v12, OS_LOG_TYPE_DEBUG, "%p invalidated:%{BOOL}u needUpdate:%{BOOL}u shouldBePaused:%{BOOL}u for scene:%{public}@ settings:%{public}@", buf, 0x32u);

    }
    *(_BYTE *)(a1 + 21) = v8;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v14 = objc_loadWeakRetained((id *)(a1 + 32));
    os_unfair_lock_unlock(v9);
    if (!v10 && v11 != v8)
    {
      if ((v7 & 1) != 0)
        objc_msgSend(v14, "resumeAssertion:", WeakRetained);
      else
        objc_msgSend(v14, "pauseAssertion:", WeakRetained);
    }

  }
}

- (void)dealloc
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
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (BOOL)reactivateIfPossible
{
  return 0;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_storeWeak((id *)&self->_scene, 0);
  os_unfair_lock_unlock(p_lock);
  v5 = WeakRetained;
  BSDispatchMain();

}

uint64_t __47__BLSHAssertionPausingSceneObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  -[BLSHAssertionPausingSceneObserver updateAssertionPauseStateForScene:]((uint64_t)self, a3);
}

- (void)sceneDidInvalidate:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v5 = objc_loadWeakRetained((id *)&self->_assertion);
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BE0B778];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = CFSTR("scene invalidated");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 20, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cancelAssertion:withError:", v5, v9);

}

- (BLSAssertionServiceResponding)assertion
{
  return (BLSAssertionServiceResponding *)objc_loadWeakRetained((id *)&self->_assertion);
}

- (BLSHAssertionAttributeHandlerService)service
{
  return (BLSHAssertionAttributeHandlerService *)objc_loadWeakRetained((id *)&self->_service);
}

- (BLSPauseWhenSceneBackgroundAttribute)attribute
{
  return (BLSPauseWhenSceneBackgroundAttribute *)objc_loadWeakRetained((id *)&self->_attribute);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attribute);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)initForAttribute:(const char *)a1 fromAssertion:forService:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
