@implementation _CDPeriodicScheduler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_24);
  return (id)sharedInstance_sharedInstance_2;
}

- (void)registerJob:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;
  _QWORD handler[4];
  id v9;

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[_CDPeriodicScheduler registerJob:].cold.1(v3);
  objc_msgSend(v3, "jobName");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __36___CDPeriodicScheduler_registerJob___block_invoke;
  handler[3] = &unk_1E26E3168;
  v9 = v3;
  v7 = v3;
  xpc_activity_register(v5, v6, handler);

}

- (void)unregisterJob:(id)a3
{
  xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)updateExecutionCriteriaOnJob:(id)a3
{
  id v3;
  _xpc_activity_s *v4;
  _xpc_activity_s *v5;
  xpc_object_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "activity");
  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = xpc_activity_copy_criteria(v4);
    objc_msgSend(v3, "executionCriteria");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || !xpc_equal(v6, v7))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[_CDPeriodicScheduler updateExecutionCriteriaOnJob:].cold.1(v3);
      xpc_activity_set_criteria(v5, v7);
    }

  }
}

- (void)registerJob:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "jobName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "interval");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = a1;
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Registered CTS job %@ %@ with interval of %@ seconds", (uint8_t *)&v5, 0x20u);

}

- (void)updateExecutionCriteriaOnJob:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "jobName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Updating criteria on activity %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
