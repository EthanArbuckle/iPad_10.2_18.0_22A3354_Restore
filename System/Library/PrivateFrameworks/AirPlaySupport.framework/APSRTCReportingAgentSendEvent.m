@implementation APSRTCReportingAgentSendEvent

void __APSRTCReportingAgentSendEvent_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const void *v4;
  const void *v5;

  v2 = *(unsigned __int16 *)(a1 + 48);
  if (v2 == 150 || v2 == 200)
  {
    FigCFDictionarySetInt32();
    v3 = *(_QWORD *)(a1 + 40);
    ++*(_DWORD *)(v3 + 48);
    LOWORD(v2) = *(_WORD *)(a1 + 48);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
  }
  reportingAgent_SendReportToRTC(v3, v2, *(_QWORD *)(a1 + 32));
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
}

@end
