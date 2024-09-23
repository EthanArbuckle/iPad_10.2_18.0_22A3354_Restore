@implementation CFStorageEnumerateNodesInByteRangeWithBlock

_QWORD *____CFStorageEnumerateNodesInByteRangeWithBlock_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v2 = result;
    v3 = result[6];
    if (*(uint64_t *)(v3 + 16 * a2 + 8) >= 1)
    {
      v4 = *(_QWORD *)(result[10] + 8 * a2);
      result = (_QWORD *)__CFStorageEnumerateNodesInByteRangeWithBlock(result[7], *(_QWORD *)(result[8] + 8 * a2), v4 + result[9], *(_QWORD *)(v3 + 16 * a2) - v4);
      if ((_DWORD)result)
        *(_BYTE *)(*(_QWORD *)(v2[5] + 8) + 24) = 1;
    }
  }
  return result;
}

@end
