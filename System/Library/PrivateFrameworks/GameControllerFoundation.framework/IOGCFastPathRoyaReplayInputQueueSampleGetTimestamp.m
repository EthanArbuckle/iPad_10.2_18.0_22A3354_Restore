@implementation IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp_block_invoke(_DWORD *a1, _DWORD *a2)
{
  return a2[2] == a1[8] && a2[3] == 1 && a2[4] == a1[9] && a2[5] == a1[10];
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetTimestamp_block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;

  v2 = *(_QWORD **)(a1 + 40);
  **(_QWORD **)(a1 + 32) = *(_QWORD *)(a2 + 24);
  if (v2)
    *v2 = *(_QWORD *)(a2 + 32);
  v3 = *(_DWORD **)(a1 + 48);
  if (v3)
    *v3 = 0;
  return 0;
}

@end
