@implementation IOGCFastPathRoyaReplayInputQueueSampleSetInteger3

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger3_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 4 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleSetInteger3_block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 60);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 56);
  *(_DWORD *)(a2 + 12) = 4;
  *(_DWORD *)(a2 + 16) = v2;
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 48);
  return 0;
}

@end
