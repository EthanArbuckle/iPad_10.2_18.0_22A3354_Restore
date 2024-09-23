@implementation APSWiFiTransactionCreate

void __APSWiFiTransactionCreate_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  if (a2)
    v4 = 90;
  else
    v4 = 50;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = **(_DWORD **)(v5 + 56);
  if (v4 >= v6)
  {
    if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7))
    {
      LogPrintF();
      v5 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v5 + 40) = a2 == 0;
  CFRelease((CFTypeRef)v5);
}

@end
