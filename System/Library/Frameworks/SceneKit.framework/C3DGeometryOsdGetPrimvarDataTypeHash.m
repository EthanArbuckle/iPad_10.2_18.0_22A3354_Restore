@implementation C3DGeometryOsdGetPrimvarDataTypeHash

uint64_t __C3DGeometryOsdGetPrimvarDataTypeHash_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t result;

  if (!a2)
    return 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 88);
  while (v3 != v4)
  {
    if (*(_QWORD *)v3 == a2)
      return *(unsigned int *)(v3 + 12);
    v3 += 16;
  }
  v5 = scn_default_log();
  result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    __C3DGeometryOsdGetPrimvarDataTypeHash_block_invoke_cold_1();
    return 0;
  }
  return result;
}

void __C3DGeometryOsdGetPrimvarDataTypeHash_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Could not find mesh source indexing info for source %p", v2);
  OUTLINED_FUNCTION_1();
}

@end
