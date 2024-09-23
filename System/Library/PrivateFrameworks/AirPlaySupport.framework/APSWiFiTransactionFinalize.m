@implementation APSWiFiTransactionFinalize

int *___APSWiFiTransactionFinalize_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  int *result;

  if (a2)
    v2 = 90;
  else
    v2 = 50;
  result = *(int **)(a1 + 32);
  if (v2 >= *result)
  {
    if (*result != -1)
      return (int *)LogPrintF();
    result = (int *)_LogCategory_Initialize();
    if ((_DWORD)result)
      return (int *)LogPrintF();
  }
  return result;
}

@end
