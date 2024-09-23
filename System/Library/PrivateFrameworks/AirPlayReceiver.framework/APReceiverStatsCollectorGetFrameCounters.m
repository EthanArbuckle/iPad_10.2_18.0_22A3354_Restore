@implementation APReceiverStatsCollectorGetFrameCounters

_QWORD *__APReceiverStatsCollectorGetFrameCounters_block_invoke(_QWORD *result)
{
  _DWORD *v1;
  _DWORD *v2;
  _DWORD *v3;

  v1 = (_DWORD *)result[4];
  if (v1)
    *v1 = *(_DWORD *)(result[5] + 72);
  v2 = (_DWORD *)result[6];
  if (v2)
    *v2 = *(_DWORD *)(result[5] + 80);
  v3 = (_DWORD *)result[7];
  if (v3)
    *v3 = *(_DWORD *)(result[5] + 84);
  return result;
}

@end
