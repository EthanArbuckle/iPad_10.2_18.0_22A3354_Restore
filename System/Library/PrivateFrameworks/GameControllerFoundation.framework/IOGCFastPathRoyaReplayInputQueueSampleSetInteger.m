@implementation IOGCFastPathRoyaReplayInputQueueSampleSetInteger

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 2 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger_block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(a2 + 12) = 2;
  *(_DWORD *)(a2 + 16) = v2;
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 32);
  return 0;
}

@end
