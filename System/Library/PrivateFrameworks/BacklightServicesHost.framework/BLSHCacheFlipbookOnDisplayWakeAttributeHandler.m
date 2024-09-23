@implementation BLSHCacheFlipbookOnDisplayWakeAttributeHandler

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

- (void)activateForSceneEnvironment:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __78__BLSHCacheFlipbookOnDisplayWakeAttributeHandler_activateForSceneEnvironment___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setCacheFlipbookOnDisplayWake:", 1);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("class %@ must respond to selector setCacheFlipbookOnDisplayWake: in order to acquire assertion with BLSCacheFlipbookOnDisplayWakeAttribute : %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __78__BLSHCacheFlipbookOnDisplayWakeAttributeHandler_activateForSceneEnvironment___block_invoke_cold_1(a1, (uint64_t)v7);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)deactivateForSceneEnvironment:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __80__BLSHCacheFlipbookOnDisplayWakeAttributeHandler_deactivateForSceneEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCacheFlipbookOnDisplayWake:", 0);
}

void __78__BLSHCacheFlipbookOnDisplayWakeAttributeHandler_activateForSceneEnvironment___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = 138544642;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  v14 = 2114;
  v15 = CFSTR("BLSHCacheFlipbookOnDisplayWakeAttributeHandler.m");
  v16 = 1024;
  v17 = 33;
  v18 = 2114;
  v19 = a2;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
