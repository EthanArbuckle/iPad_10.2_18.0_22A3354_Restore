@implementation GCDeviceOnDiskDB

_GCDeviceDBBundle *__37___GCDeviceOnDiskDB_initWithBundles___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _GCDeviceDBBundle *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = a2;
  _gc_log_devicedb();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_2(v2, v3);

  v8 = 0;
  v4 = -[_GCDeviceDBBundle initWithBundle:error:]([_GCDeviceDBBundle alloc], "initWithBundle:error:", v2, &v8);
  v5 = v8;
  if (!v4)
  {
    _gc_log_devicedb();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_1();

  }
  return v4;
}

void __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_1DC79E000, v0, v1, "📦 Error loading bundle '%{public}@': %{public}@");
  OUTLINED_FUNCTION_3_1();
}

void __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1DC79E000, a2, OS_LOG_TYPE_DEBUG, "Loading bundle '%{public}@' at '%{public}@'...", (uint8_t *)&v6, 0x16u);

}

@end
