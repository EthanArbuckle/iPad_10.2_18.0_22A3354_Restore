@implementation ZL17gCreateMemoryHash

_QWORD *_ZL17gCreateMemoryHash_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[3] = 0;
  result[2] = 0;
  *result = &off_1E1BACDC8;
  result[1] = result + 2;
  gIIOMemoryHash = (uint64_t)result;
  return result;
}

@end
