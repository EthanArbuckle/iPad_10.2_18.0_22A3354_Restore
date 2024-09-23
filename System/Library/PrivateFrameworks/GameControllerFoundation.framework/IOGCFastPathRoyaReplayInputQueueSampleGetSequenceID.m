@implementation IOGCFastPathRoyaReplayInputQueueSampleGetSequenceID

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleGetSequenceID_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 40);
  **(_QWORD **)(a1 + 32) = *(_QWORD *)(a2 + 24);
  if (v2)
    *v2 = -1;
  return 0;
}

@end
