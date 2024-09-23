@implementation DASSubmissionRateLimiter

uint64_t __33___DASSubmissionRateLimiter_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  NSObject *v4;
  void *v5;
  uint64_t state64;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33___DASSubmissionRateLimiter_init__block_invoke_cold_1();

  result = notify_get_state(objc_msgSend(*(id *)(a1 + 32), "token"), &state64);
  if (!(_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "testing"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Limiter override state = %@", buf, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "setTesting:", state64 != 0);
  }
  return result;
}

uint64_t __33___DASSubmissionRateLimiter_init__block_invoke_6(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33___DASSubmissionRateLimiter_init__block_invoke_6_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "timerHandler");
}

void __42___DASSubmissionRateLimiter_sharedLimiter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedLimiter_limitation;
  sharedLimiter_limitation = (uint64_t)v0;

}

void __33___DASSubmissionRateLimiter_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B0DF4000, v0, v1, "Got notification for limiter override", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __33___DASSubmissionRateLimiter_init__block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B0DF4000, v0, v1, "Timer fired for submission penalty checks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
