@implementation AFIsIPod

uint64_t __AFIsIPod_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  AFIsIPod_isIPod = (_DWORD)result == 2;
  return result;
}

@end
