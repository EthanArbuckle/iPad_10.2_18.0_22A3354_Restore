@implementation GCDeviceConfigurationEvaluator

uint64_t __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "priority");
  if (v6 <= objc_msgSend(v5, "priority"))
  {
    v8 = objc_msgSend(v4, "priority");
    v7 = v8 < objc_msgSend(v5, "priority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _gc_log_device_configuration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_9_cold_1();

}

void __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  char isKindOfClass;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _gc_log_device_configuration();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = CFSTR("(NONE)");
    if ((isKindOfClass & 1) == 0)
      v10 = v6;
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_1DC79E000, v7, OS_LOG_TYPE_DEBUG, "\t%@ -> %@", (uint8_t *)&v11, 0x16u);

  }
}

void __43___GCDeviceConfigurationEvaluator_evaluate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  +[NSNull null](&off_1F03A9C88, "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v8);

}

void __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1DC79E000, v0, v1, "\t%@", v2);
  OUTLINED_FUNCTION_5();
}

@end
