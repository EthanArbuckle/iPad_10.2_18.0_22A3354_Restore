@implementation BLPropertyChangedCallback

_QWORD *____BLPropertyChangedCallback_block_invoke(_QWORD *result)
{
  if (*(_QWORD *)(result[4] + 16))
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(result[4] + 16))(*(_QWORD *)(result[4] + 24), result[5], result[6]);
  return result;
}

@end
