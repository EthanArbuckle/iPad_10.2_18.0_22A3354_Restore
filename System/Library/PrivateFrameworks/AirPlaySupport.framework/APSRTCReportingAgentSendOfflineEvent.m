@implementation APSRTCReportingAgentSendOfflineEvent

void __APSRTCReportingAgentSendOfflineEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  v2 = FigReportingAgentOfflineAirPlayCreate();
  if ((_DWORD)v2)
    APSLogErrorAt(v2);
  else
    FigReportingAgentOfflineAirPlayIssueReportingEvent();
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

@end
