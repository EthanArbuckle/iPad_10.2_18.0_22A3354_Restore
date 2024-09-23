@implementation APServerActivityScheduler

- (void)registerWeeklyActivityWithName:(id)a3 work:(id)a4
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  id v10;
  _QWORD handler[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC630]);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x24BDAC6B8], 1);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke;
  handler[3] = &unk_250796780;
  v12 = v5;
  v10 = v5;
  xpc_activity_register(v9, v7, handler);

}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (xpc_activity_set_state((xpc_activity_t)v3, 4))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2;
      v13[3] = &unk_250796730;
      v14 = v3;
      (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v13);
      v5 = v14;
    }
    else
    {
      APDefaultFrameworkLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

  }
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    APDefaultFrameworkLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23624C000, a1, a3, "Couldn't mark activity continuing?", a5, a6, a7, a8, 0);
}

void __65__APServerActivityScheduler_registerWeeklyActivityWithName_work___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23624C000, a1, a3, "Couldn't mark activity done?", a5, a6, a7, a8, 0);
}

@end
