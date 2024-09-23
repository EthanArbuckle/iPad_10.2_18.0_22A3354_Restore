@implementation IOPSGaugingMitigationGetState

void __IOPSGaugingMitigationGetState_block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __IOPSGaugingMitigationGetState_block_invoke_cold_1();
}

void __IOPSGaugingMitigationGetState_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Event handler is called %@\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
