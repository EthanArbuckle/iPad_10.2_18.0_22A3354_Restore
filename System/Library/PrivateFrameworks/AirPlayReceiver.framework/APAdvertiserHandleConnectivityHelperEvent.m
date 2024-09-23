@implementation APAdvertiserHandleConnectivityHelperEvent

void ___APAdvertiserHandleConnectivityHelperEvent_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  v2 = *(_DWORD *)(a1 + 48);
  if (v2 == 7)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v4 + 49))
    {
      if (gLogCategory_APAdvertiser <= 50)
      {
        if (gLogCategory_APAdvertiser != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 32);
        }
      }
      *(_BYTE *)(v4 + 49) = 1;
      _APAdvertiserUpdate(v4);
      if (APConnectivityHelperDeregisterForEvent())
        goto LABEL_22;
    }
  }
  else if (v2 == 1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 48))
    {
      if (gLogCategory_APAdvertiser <= 50)
      {
        if (gLogCategory_APAdvertiser != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 32), v5))
        {
          LogPrintF();
          v3 = *(_QWORD *)(a1 + 32);
        }
      }
      *(_BYTE *)(v3 + 48) = 1;
      _APAdvertiserUpdate(v3);
      if (APConnectivityHelperDeregisterForEvent())
LABEL_22:
        APSLogErrorAt();
    }
  }
  else if (gLogCategory_APAdvertiser <= 40
         && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
  {
    APConnectivityHelperGetEventString();
    LogPrintF();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
