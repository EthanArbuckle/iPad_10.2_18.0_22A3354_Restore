@implementation CSIsIPad

uint64_t __CSIsIPad_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  CSIsIPad_isIPad = (_DWORD)result == 3;
  return result;
}

@end
