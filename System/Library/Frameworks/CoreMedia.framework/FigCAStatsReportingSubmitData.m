@implementation FigCAStatsReportingSubmitData

void __FigCAStatsReportingSubmitData_block_invoke(uint64_t a1)
{
  const void *v2;

  AnalyticsSendEvent();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

@end
