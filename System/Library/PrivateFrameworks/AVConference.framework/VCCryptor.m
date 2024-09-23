@implementation VCCryptor

void ___VCCryptor_EnsureCryptorIsReady_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCCryptor_EnsureCryptorIsReady_block_invoke_cold_1();
  }
}

void ___VCCryptor_EnsureCryptorIsReady_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid key material passed in callback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
