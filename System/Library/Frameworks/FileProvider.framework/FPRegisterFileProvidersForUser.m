@implementation FPRegisterFileProvidersForUser

void __FPRegisterFileProvidersForUser_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __FPRegisterFileProvidersForUser_block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __FPRegisterFileProvidersForUser_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] fileprovider registration completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

@end
