@implementation BLSHLocalCountingSceneAssertionAttributeHandler

+ (id)attributeClasses
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalCountingSceneAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 22;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)attributeBaseClass
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  Class result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("BLSHLocalCountingSceneAssertionAttributeHandler.m");
    v19 = 1024;
    v20 = 27;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)activateWithFirstEntry:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;

  v4 = a3;
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BLSHLocalCountingSceneAssertionAttributeHandler activateWithFirstEntry:].cold.1();

  -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:](self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  BSDispatchMain();

}

- (id)sceneIdentityTokenForEntry:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id result;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_4;
  objc_msgSend(v3, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "sceneIdentityToken");
    a1 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    return a1;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[attribute isKindOfClass:[BLSSceneAttribute class]]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:].cold.1(sel_sceneIdentityTokenForEntry_);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __74__BLSHLocalCountingSceneAssertionAttributeHandler_activateWithFirstEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "osInterfaceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSceneObserver:forSceneIdentityToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "activateForSceneEnvironment:", v4);
}

- (void)activateForSceneEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BLSHLocalCountingSceneAssertionAttributeHandler *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@"), self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BLSHLocalCountingSceneAssertionAttributeHandler.m");
    v20 = 1024;
    v21 = 43;
    v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;

  v4 = a3;
  bls_assertions_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BLSHLocalCountingSceneAssertionAttributeHandler deactivateWithFinalEntry:].cold.1();

  -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:](self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  BSDispatchMain();

}

void __76__BLSHLocalCountingSceneAssertionAttributeHandler_deactivateWithFinalEntry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "osInterfaceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSceneObserver:forSceneIdentityToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "deactivateForSceneEnvironment:", v4);
}

- (void)deactivateForSceneEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BLSHLocalCountingSceneAssertionAttributeHandler *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@"), self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = CFSTR("BLSHLocalCountingSceneAssertionAttributeHandler.m");
    v20 = 1024;
    v21 = 58;
    v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)countingTargetForEntry:(id)a3
{
  return -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:](self, a3);
}

- (void)sceneDidInvalidate:(id)a3 environment:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BLSHLocalCountingSceneAssertionAttributeHandler *v32;
  id v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  BLSHLocalCountingSceneAssertionAttributeHandler *v47;
  __int16 v48;
  BLSHLocalCountingSceneAssertionAttributeHandler *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v33 = a4;
  -[BLSHLocalAssertionAttributeHandler service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self;
  v34 = v7;
  -[BLSHLocalCountingAssertionAttributeHandler entriesForCountingTarget:](self, "entriesForCountingTarget:", v7);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v15, "service");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 != v8)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[entry service] == service"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[BLSHLocalCountingSceneAssertionAttributeHandler sceneDidInvalidate:environment:].cold.1(a2);
          objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x214616010);
        }
        objc_msgSend(v15, "assertion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v12);
  }
  v31 = v10;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v9;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    v21 = *MEMORY[0x24BE0B778];
    v22 = *MEMORY[0x24BDD0FC8];
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        bls_assertions_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v33, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v47 = v32;
          v48 = 2114;
          v49 = v32;
          v50 = 2114;
          v51 = v24;
          v52 = 2114;
          v53 = v34;
          v54 = 2114;
          v55 = v29;
          _os_log_debug_impl(&dword_2145AC000, v25, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ will cancel assertion:%{public}@ due to invalidated scene:%{public}@ environment:%{public}@", buf, 0x34u);

        }
        v26 = (void *)MEMORY[0x24BDD1540];
        v44 = v22;
        v45 = CFSTR("scene invalidated");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", v21, 20, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancelAssertion:withError:", v24, v28);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
    }
    while (v19);
  }

}

- (void)activateWithFirstEntry:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_2_4(&dword_2145AC000, v0, v1, "%p handler:%{public}@ will activate for:%{public}@");
}

- (void)sceneIdentityTokenForEntry:(const char *)a1 .cold.1(const char *a1)
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

- (void)deactivateWithFinalEntry:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_2_4(&dword_2145AC000, v0, v1, "%p handler:%{public}@ will deactivate for:%{public}@");
}

- (void)sceneDidInvalidate:(const char *)a1 environment:.cold.1(const char *a1)
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
