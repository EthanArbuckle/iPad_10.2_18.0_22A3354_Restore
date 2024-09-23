@implementation BLSHBacklightSceneEnvironmentHosting

+ (void)enableSubhostingForEnvironment:(id)a3 withSessionProvider:(id)a4
{
  id v7;
  void *v8;
  BLSHLocalHostSceneEnvironmentUpdater *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_msgSend(v13, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[BLSHLocalHostSceneEnvironmentUpdater initWithSessionProvider:localHostEnvironment:]([BLSHLocalHostSceneEnvironmentUpdater alloc], "initWithSessionProvider:localHostEnvironment:", v7, v13);
    objc_msgSend(v13, "setUpdater:", v9);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("environment %@ must have a delegate to enable subhosting"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BLSHBacklightSceneEnvironmentHosting enableSubhostingForEnvironment:withSessionProvider:].cold.1(a2, (uint64_t)a1, (uint64_t)v12);
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

+ (id)createLocalHostEnvironmentForEnvironment:(id)a3
{
  id v3;
  BLSHLocalHostSceneEnvironment *v4;

  v3 = a3;
  v4 = -[BLSHLocalHostSceneEnvironment initWithBacklightSceneEnvironment:]([BLSHLocalHostSceneEnvironment alloc], "initWithBacklightSceneEnvironment:", v3);

  return v4;
}

+ (void)enableSubhostingForEnvironment:(uint64_t)a3 withSessionProvider:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
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
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHBacklightSceneEnvironmentHosting.m");
  v16 = 1024;
  v17 = 19;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
