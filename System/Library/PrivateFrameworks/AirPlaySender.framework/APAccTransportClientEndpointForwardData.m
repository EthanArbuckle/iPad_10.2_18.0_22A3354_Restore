@implementation APAccTransportClientEndpointForwardData

uint64_t __APAccTransportClientEndpointForwardData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;
  int v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 16))
  {
    v5 = -6709;
LABEL_12:
    result = APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    return result;
  }
  if (!*(_QWORD *)(v2 + 48))
  {
    v5 = -6709;
    goto LABEL_12;
  }
  if (gLogCategory_APAccTransportClientEndpoint <= 30)
  {
    if (gLogCategory_APAccTransportClientEndpoint != -1
      || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 40), v3))
    {
      CFDataGetLength(*(CFDataRef *)(a1 + 48));
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 40);
    }
  }
  result = ((uint64_t (*)(uint64_t, uint64_t))softLinkacc_transportClient_processIncomingData[0])(*(_QWORD *)(a1 + 48), *(_QWORD *)(v2 + 48));
  if ((result & 1) == 0)
  {
    v5 = -6700;
    goto LABEL_12;
  }
  return result;
}

@end
