@implementation C3DIndicesContentEnumerateTriangulatedPrimitives

void __C3DIndicesContentEnumerateTriangulatedPrimitives_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  if (a4 == 3)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else if (a4 < 4)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __C3DIndicesContentEnumerateTriangulatedPrimitives_block_invoke_cold_1();
  }
  else
  {
    v7 = 0;
    v8 = a4 - 2;
    do
    {
      if (v8 == v7)
        break;
      v9 = v7 + 1;
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
      v7 = v9;
    }
    while (!a5);
  }
}

void __C3DIndicesContentEnumerateTriangulatedPrimitives_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: unexpected vertex count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
