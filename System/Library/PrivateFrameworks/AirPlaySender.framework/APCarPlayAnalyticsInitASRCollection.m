@implementation APCarPlayAnalyticsInitASRCollection

uint64_t __APCarPlayAnalyticsInitASRCollection_block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t result;
  int v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 28))
  {
    result = APSLogErrorAt();
    v5 = -6709;
  }
  else
  {
    v3 = *(double *)(a1 + 48);
    *(_BYTE *)(v2 + 49) = *(double *)(v2 + 184) != v3;
    *(double *)(v2 + 184) = v3;
    APSDataSetStatisticsInit();
    result = APSDataSetStatisticsInit();
    v5 = 0;
    *(_BYTE *)(v2 + 48) = 1;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end
