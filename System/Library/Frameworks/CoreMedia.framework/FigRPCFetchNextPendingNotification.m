@implementation FigRPCFetchNextPendingNotification

_QWORD *__FigRPCFetchNextPendingNotification_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result[6];
  v3 = (uint64_t *)(v1 + 80);
  v2 = *(uint64_t **)(v1 + 80);
  if (v2)
  {
    v4 = *(_QWORD *)(result[5] + 8);
    v5 = *v2;
    *v3 = *v2;
    if (!v5)
    {
      *(_QWORD *)(v1 + 88) = v3;
      *(_BYTE *)(v1 + 96) = 0;
    }
    *(_DWORD *)(v4 + 24) = v5 != 0;
  }
  *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v2;
  return result;
}

@end
