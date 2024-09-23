@implementation APBrokerDoReceiverPollingIfNecessary

void ___APBrokerDoReceiverPollingIfNecessary_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v3;
  NSObject *v4;
  dispatch_time_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 112))
  {
    if (gLogCategory_APBrokerGroup <= 50)
    {
      if (gLogCategory_APBrokerGroup != -1 || (v3 = _LogCategory_Initialize(), v1 = *(_QWORD *)(a1 + 32), v3))
      {
        LogPrintF();
        v1 = *(_QWORD *)(a1 + 32);
      }
    }
    v4 = *(NSObject **)(v1 + 120);
    v5 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 40));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

@end
