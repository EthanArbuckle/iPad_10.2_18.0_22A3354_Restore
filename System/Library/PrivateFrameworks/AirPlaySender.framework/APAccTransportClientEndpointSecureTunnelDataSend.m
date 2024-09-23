@implementation APAccTransportClientEndpointSecureTunnelDataSend

uint64_t __APAccTransportClientEndpointSecureTunnelDataSend_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 16) || (v3 = *(_QWORD *)(v2 + 48)) == 0)
  {
    result = APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6709;
  }
  else
  {
    result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkacc_transportClient_endpointSecureTunnelDataSend[0])(v3, 1, *(_QWORD *)(a1 + 48));
    if (gLogCategory_APAccTransportClientEndpoint <= 30)
    {
      if (gLogCategory_APAccTransportClientEndpoint != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      {
        CFDataGetLength(*(CFDataRef *)(a1 + 48));
        return LogPrintF();
      }
    }
  }
  return result;
}

@end
