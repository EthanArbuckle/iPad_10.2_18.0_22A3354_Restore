@implementation CNOffMainThreadScheduler

uint64_t __42___CNOffMainThreadScheduler_performBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[_CNOffMainThreadScheduler os_log](_CNOffMainThreadScheduler, "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __35___CNOffMainThreadScheduler_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.reactive-extensions", "scheduling");
  v1 = (void *)os_log_cn_once_object_1_1;
  os_log_cn_once_object_1_1 = (uint64_t)v0;

}

uint64_t __59___CNOffMainThreadScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[_CNOffMainThreadScheduler os_log](_CNOffMainThreadScheduler, "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __52___CNOffMainThreadScheduler_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[_CNOffMainThreadScheduler os_log](_CNOffMainThreadScheduler, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __69___CNOffMainThreadScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[_CNOffMainThreadScheduler os_log](_CNOffMainThreadScheduler, "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __53___CNOffMainThreadScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[_CNOffMainThreadScheduler os_log](_CNOffMainThreadScheduler, "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __70___CNOffMainThreadScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    +[_CNOffMainThreadScheduler os_log](_CNOffMainThreadScheduler, "os_log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __42___CNOffMainThreadScheduler_performBlock___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18F80C000, v0, v1, "Work was requested to be performed off the main thread, but scheduler %{public}@ is performing on the main thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
