@implementation SignalDataAvailable

uint64_t __stream_SignalDataAvailable_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  int v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 24))
  {
    result = APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16617;
  }
  else
  {
    v3 = *(_QWORD *)(v2 + 40);
    v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v4)
      v5 = v4(v3);
    else
      v5 = -12782;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if ((_DWORD)result)
      return APSLogErrorAt();
  }
  return result;
}

void __tcpunbufnw_SignalDataAvailable_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 332))
  {
    if (gLogCategory_APTransportConnectionTCPUnbufferedNW <= 30)
    {
      if (gLogCategory_APTransportConnectionTCPUnbufferedNW != -1
        || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v3))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    APTTrafficMetricsDataAvailable(*(_QWORD *)(v2 + 352));
    v4 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v4 + 332) = 1;
    tcpunbufnwGuts_connectionSendPackages(v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v2);
}

@end
