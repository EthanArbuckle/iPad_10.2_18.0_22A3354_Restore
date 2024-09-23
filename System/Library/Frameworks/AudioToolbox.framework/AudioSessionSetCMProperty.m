@implementation AudioSessionSetCMProperty

uint64_t __AudioSessionSetCMProperty_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _MXSessionSetProperty();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
