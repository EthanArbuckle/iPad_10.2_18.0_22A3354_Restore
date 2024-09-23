@implementation C3DFramebufferCleanup

void __C3DFramebufferCleanup_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!*(_DWORD *)(a2 + 72))
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __C3DFramebufferCleanup_block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  --*(_DWORD *)(a2 + 72);
}

void __C3DFramebufferCleanup_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. C3DFramebufferCleanup - bad retain count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
