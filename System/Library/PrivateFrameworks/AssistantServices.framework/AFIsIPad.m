@implementation AFIsIPad

uint64_t __AFIsIPad_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  AFIsIPad_isIPad = (_DWORD)result == 3;
  return result;
}

@end
