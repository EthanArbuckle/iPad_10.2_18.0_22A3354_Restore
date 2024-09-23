@implementation IOGCFastPathRoyaReplayInputQueueSampleGetDouble2

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble2_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 6 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetDouble2_block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 40);
  **(_QWORD **)(a1 + 32) = *(_QWORD *)(a2 + 24);
  *v2 = *(_QWORD *)(a2 + 32);
  return 0;
}

@end
