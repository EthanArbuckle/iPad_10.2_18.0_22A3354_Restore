@implementation IOGCFastPathRoyaReplayInputQueueSampleReadField

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleReadField_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v5;
  _QWORD *i;

  v2 = *(unsigned __int16 *)(a2 + 18);
  if (!*(_WORD *)(a2 + 18))
    return 3758097136;
  v5 = 0;
  for (i = (_QWORD *)(a2 + 32); *i != *(_QWORD *)(a2 + 8); i += 6)
  {
LABEL_6:
    if (++v5 >= (unint64_t)v2)
      return 3758097136;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    v2 = *(unsigned __int16 *)(a2 + 18);
    goto LABEL_6;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
