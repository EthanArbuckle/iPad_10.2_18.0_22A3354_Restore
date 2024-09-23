@implementation APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler

uint64_t __APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  _QWORD v9[5];

  v2 = *(_QWORD *)(a1 + 48);
  if (!*(_QWORD *)(v2 + 48) || *(_QWORD *)(v2 + 80))
  {
    result = APSLogErrorAt();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = -6709;
LABEL_8:
    *(_DWORD *)(v7 + 24) = v8;
    return result;
  }
  v3 = _Block_copy(*(const void **)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v4 + 80) = v3;
  if (!v3)
  {
    result = APSLogErrorAt();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = -6728;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)(v4 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler_block_invoke_2;
  v9[3] = &unk_1E826DBC8;
  v9[4] = v4;
  return softLinkacc_transportClient_setEndpointSecureTunnelDataReceiveHandler(v5, (uint64_t)v9);
}

void __APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler_block_invoke_2(uint64_t a1, const void *a2, CFDataRef theData)
{
  _QWORD *v5;
  NSObject *v6;
  _QWORD block[7];

  v5 = *(_QWORD **)(a1 + 32);
  if (gLogCategory_APAccTransportClientEndpoint <= 30
    && (gLogCategory_APAccTransportClientEndpoint != -1 || _LogCategory_Initialize()))
  {
    CFDataGetLength(theData);
    LogPrintF();
  }
  CFRetain(v5);
  CFRetain(a2);
  CFRetain(theData);
  v6 = v5[3];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler_block_invoke_3;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = v5;
  block[5] = a2;
  block[6] = theData;
  dispatch_async(v6, block);
}

void __APAccTransportClientEndpointSetSecureTunnelDataReceiveHandler_block_invoke_3(CFTypeRef *a1)
{
  if (!*((_BYTE *)a1[4] + 16) && FigCFEqual())
    (*(void (**)(void))(*((_QWORD *)a1[4] + 10) + 16))();
  CFRelease(a1[5]);
  CFRelease(a1[4]);
  CFRelease(a1[6]);
}

@end
