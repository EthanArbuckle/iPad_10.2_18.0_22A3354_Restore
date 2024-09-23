@implementation IOGCFastPathRoyaReplayInputQueueSampleGetInteger3

BOOL ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke(uint64_t a1, _DWORD *a2)
{
  return a2[2] == *(_DWORD *)(a1 + 32) && a2[3] == 4 && a2[4] == *(_DWORD *)(a1 + 36);
}

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetInteger3_block_invoke_2(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 40);
  **(_QWORD **)(a1 + 32) = a2[3];
  *v2 = a2[4];
  **(_QWORD **)(a1 + 48) = a2[5];
  return 0;
}

@end
