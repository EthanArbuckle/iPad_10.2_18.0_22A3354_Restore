@implementation ZNK2CI12ProviderNode13surfaceForROIEPKNS

_QWORD *___ZNK2CI12ProviderNode13surfaceForROIEPKNS_7ContextERK6CGRectRNS_8Tileable5StatsE_block_invoke_6(_QWORD *result, char *__dst, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  _QWORD *v10;
  char *v11;

  if (a5)
  {
    v7 = a5;
    v10 = result;
    v11 = (char *)(result[4] + result[5]);
    do
    {
      result = memmove(__dst, v11, v10[7] * a4);
      __dst += a6;
      v11 += v10[6];
      --v7;
    }
    while (v7);
  }
  return result;
}

@end
