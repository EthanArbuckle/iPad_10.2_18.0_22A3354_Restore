@implementation ZN21PerSide

_QWORD *___ZN21PerSide_CFWriteStream18_offqueue_canWriteEPP9__CFError_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result[5] < 0xFFFFLL;
  if (*(_QWORD *)(a1 + 48))
  {
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 32))(result);
    **(_QWORD **)(a1 + 48) = result;
  }
  return result;
}

@end
