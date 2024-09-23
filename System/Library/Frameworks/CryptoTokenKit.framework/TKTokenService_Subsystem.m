@implementation TKTokenService_Subsystem

+ (id)initForPlugInKit
{
  NSObject *v3;

  TK_LOG_token();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[TKTokenService_Subsystem initForPlugInKit].cold.1();

  objc_msgSend(MEMORY[0x1E0CB3B70], "_startListening");
  return objc_alloc_init((Class)a1);
}

+ (void)initForPlugInKit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "TKTokenService_Subsystem initializing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
